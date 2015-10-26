package com.mumaoxi.birt.model;

import org.apache.axis.encoding.Base64;

import java.io.FileInputStream;
import java.io.Serializable;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;
import java.io.File;

/**
 * Created by saxer on 10/26/15.
 */
public class DataSource implements Serializable {

    private String realPath;

    private String name;
    private String host;
    private String port;
    private String username;
    private String password;
    private String database;

    public DataSource(String realPath) {
        this.realPath = realPath;
        loadConfig();
    }

    private void loadConfig() {
        try {
            File file = new File(realPath);
            if (!file.exists()) {
                return;
            }
            Properties pps = new Properties();
            pps.load(new FileInputStream(realPath));
            Enumeration enum1 = pps.propertyNames();
            while (enum1.hasMoreElements()) {
                String strKey = (String) enum1.nextElement();
                String strValue = pps.getProperty(strKey);
                if (strKey.equals("name"))
                    name = strValue;
                else if (strKey.equals("host"))
                    host = strValue;
                else if (strKey.equals("port"))
                    port = strValue;
                else if (strKey.equals("username"))
                    username = strValue;
                else if (strKey.equals("password"))
                    password = strValue;
                else if (strKey.equals("database"))
                    database = strValue;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getRealPath() {
        return realPath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    /**
     * @return 加密后的密码
     */
    public String getEncryptPwd() {
        return Base64.encode(password.getBytes());
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public static void main(String[] args) throws Exception {
        DataSource dataSource = new DataSource("./report/rpts/database.properties");
        System.out.println("DataSource config:" + dataSource);
        List<Report> reports = Report.getAll("./report/rpts/");
        for (Report report : reports) {
            if (dataSource.getName() != null) {
                report.changeDataSource(dataSource);
            }
        }
    }


    @Override
    public String toString() {
        return "DataSource{" +
                "realPath='" + realPath + '\'' +
                ", name='" + name + '\'' +
                ", host='" + host + '\'' +
                ", port='" + port + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", database='" + database + '\'' +
                '}';
    }
}
