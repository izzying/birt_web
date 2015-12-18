package com.mumaoxi.birt.servlet;

import com.mumaoxi.birt.model.Report;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

/**
 * Created by saxer on 10/23/15.
 */
public class MyappServlet extends MumaoxiServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        String requestURI = req.getRequestURI();
        String pathInfo = requestURI.replaceFirst(req.getContextPath(), "");

        if (pathInfo.toLowerCase().startsWith("/myapps/icon")) {
            this._show_icon(req, resp, req.getParameter("pkg"));
        } else if (pathInfo.toLowerCase().startsWith("/myapps/")) {
            String packageName = pathInfo.replace("/myapps/", "");
            this._show(req, resp, packageName);
        }
    }

    private void _show(HttpServletRequest req, HttpServletResponse resp, String packageName) throws ServletException, IOException {
        renderJSON(req,resp,getMyApp(packageName));
    }

    private void _show_icon(HttpServletRequest req, HttpServletResponse resp, String packageName) throws ServletException, IOException {
        JSONObject jsonObject = JSONObject.fromObject(getMyApp(packageName));
        resp.sendRedirect(jsonObject.optJSONObject("data").optJSONObject("appDetail").optString("iconUrl"));
    }


    /**
     * 获取应用宝应用详情
     *
     * @param packageName 应用包名
     * @return
     * @throws IOException
     */
    private String getMyApp(String packageName) throws IOException {
        URL url = new URL("http://a.app.qq.com/o/ajax/micro/AppDetail?pkgname=" + packageName);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.connect();
        InputStream input = new BufferedInputStream(url.openStream(), 8192);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte data[] = new byte[1024];
        int count;
        while ((count = input.read(data)) != -1) {
            outputStream.write(data, 0, count);
        }
        outputStream.flush();
        input.close();
        outputStream.close();
        connection.disconnect();

        return new String(outputStream.toByteArray(), "utf-8");
    }


}
