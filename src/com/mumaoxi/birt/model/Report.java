package com.mumaoxi.birt.model;

import org.dom4j.Document;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import javax.servlet.ServletContext;
import java.io.File;
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
    private DataSource dataSource;

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

    private void parseXml() throws Exception {
        Map<String, String> xmlMap = new HashMap<>();
        xmlMap.put("root", "http://www.eclipse.org/birt/2005/design");
        SAXReader saxReader = new SAXReader();
        saxReader.getDocumentFactory().setXPathNamespaceURIs(xmlMap);
        Document doc = saxReader.read(new File(realPath));

        //标题
        Node displayNameElement = doc.selectSingleNode("//root:text-property[@name='title']");
        System.out.println("displayNameElement::" + displayNameElement);
        if (displayNameElement != null)
            displayName = displayNameElement.getText();
    }

    /**
     * 获取所有的报表文件
     *
     * @param context
     * @return
     */
    public static List<Report> getAll(ServletContext context) {
        String reportDirRealPath = context.getRealPath(Report.BASE_FILE_PATH);
        String databaseRealPath = reportDirRealPath + "database.properties";

        String[] reportFileNames = new File(reportDirRealPath).list();
        DataSource dataSource = null;
        if (new File(databaseRealPath).exists()) {
            dataSource = new DataSource(databaseRealPath);
        }

        List<Report> reports = new ArrayList<>();
        for (String name : reportFileNames) {
            if (!name.endsWith("rptdesign"))
                continue;
            Report report = new Report(reportDirRealPath + name);
            report.setFileName(name);
            if (dataSource != null) {
                report.setDataSource(dataSource);
            }
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

    public DataSource getDataSource() {
        return dataSource;
    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public String getDisplayName() {
        return displayName == null ? fileName : displayName;
    }
}
