package com.mumaoxi.birt.model;

import java.io.Serializable;

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

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
}
