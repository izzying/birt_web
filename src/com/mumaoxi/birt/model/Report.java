package com.mumaoxi.birt.model;

import javax.servlet.ServletContext;
import java.io.File;

/**
 * Created by saxer on 10/26/15.
 */
public class Report {

    /**
     * 获取所有的报表文件
     *
     * @param context
     * @return
     */
    public static String[] getAll(ServletContext context) {

        return new File(context.getRealPath("/report/rpts")).list();
    }
}
