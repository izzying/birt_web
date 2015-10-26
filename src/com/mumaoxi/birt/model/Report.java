package com.mumaoxi.birt.model;

import org.dom4j.Document;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by saxer on 10/26/15.
 */
public class Report implements Serializable {

    private static final String BASE_FILE_PATH = "/report/rpts";

    private String displayName;
    private String realPath;
    private String fileName;

    public Report(String realPath) {
        this.realPath = realPath;
        try {
            this.parseXml();
        } catch (Exception e) {
            System.err.println("report error ::" + e);
            e.printStackTrace();
        }

    }

    private Document getSAXDocument() throws Exception {
        Map<String, String> xmlMap = new HashMap<>();
        xmlMap.put("root", "http://www.eclipse.org/birt/2005/design");
        SAXReader saxReader = new SAXReader();
        saxReader.getDocumentFactory().setXPathNamespaceURIs(xmlMap);
        return saxReader.read(new File(realPath));
    }

    private void parseXml() throws Exception {
        Document doc = getSAXDocument();
        //标题
        Node displayNameElement = doc.selectSingleNode("//root:text-property[@name='title']");
        System.out.println("displayNameElement::" + (displayNameElement != null ? displayNameElement.getText() : ""));
        if (displayNameElement != null)
            displayName = displayNameElement.getText();

        //数据库
//        Node dataSourceName = doc.selectSingleNode("//root:oda-data-source/@name");
//        Node odaURL = doc.selectSingleNode("//root:property[@name='odaURL']");
//        Node odaUser = doc.selectSingleNode("//root:property[@name='odaUser']");
//        Node odaPassword = doc.selectSingleNode("//root:encrypted-property[@name='odaPassword']");
//
    }

    /**
     * 修改报表文件的数据源
     *
     * @param dataSource 数据源
     */
    public void changeDataSource(DataSource dataSource) throws Exception {
        Document doc = getSAXDocument();
        Node dataSourceName = doc.selectSingleNode("//root:oda-data-source/@name");
        Node odaDriverClass = doc.selectSingleNode("//root:property[@name='odaDriverClass']");
        Node odaURL = doc.selectSingleNode("//root:property[@name='odaURL']");
        Node odaUser = doc.selectSingleNode("//root:property[@name='odaUser']");
        Node odaPassword = doc.selectSingleNode("//root:encrypted-property[@name='odaPassword']");

        List<Node> dataSetDataSources = doc.selectNodes("//root:property[@name='dataSource']");

        if (odaDriverClass != null && "com.mysql.jdbc.Driver".equals(odaDriverClass.getText()) && dataSourceName != null && odaURL != null && odaUser != null && odaPassword != null) {
            dataSourceName.setText(dataSource.getName());
            odaURL.setText(String.format("jdbc:mysql://%1$s:%2$s/%3$s", dataSource.getHost(), dataSource.getPort(), dataSource.getDatabase()));
            odaUser.setText(dataSource.getUsername());
            odaPassword.setText(dataSource.getEncryptPwd());

            System.out.println("====changeDataSource==="+this.fileName);
            if (dataSetDataSources != null) {
                for (Node node : dataSetDataSources) {
                    node.setText(dataSource.getName());
                }
            }
        }

        OutputFormat format = OutputFormat.createPrettyPrint();
        FileOutputStream output = new FileOutputStream(new File(this.realPath));
        XMLWriter writer = new XMLWriter(output, format);
        writer.write(doc);
        writer.flush();
    }

    /**
     * 获取所有的报表文件
     *
     * @param context
     * @return
     */
    public static List<Report> getAll(ServletContext context) {
        String reportDirRealPath = context.getRealPath(Report.BASE_FILE_PATH);
        String[] reportFileNames = new File(reportDirRealPath).list();

        List<Report> reports = new ArrayList<>();
        for (String name : reportFileNames) {
            if (!name.endsWith("rptdesign"))
                continue;
            Report report = new Report(reportDirRealPath + name);
            report.setFileName(name);
            reports.add(report);
        }
        return reports;
    }

    /**
     * 获取本地所有的报表
     *
     * @param reportDirRealPath
     * @return
     */
    public static List<Report> getAll(String reportDirRealPath) {
        String[] reportFileNames = new File(reportDirRealPath).list();
        List<Report> reports = new ArrayList<>();
        for (String name : reportFileNames) {
            if (!name.endsWith("rptdesign"))
                continue;
            Report report = new Report(reportDirRealPath + name);
            report.setFileName(name);
            reports.add(report);
        }
        return reports;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileName() {
        return fileName;
    }


    public String getDisplayName() {
        return displayName == null ? fileName : displayName;
    }
}
