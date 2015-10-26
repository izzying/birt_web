package com.mumaoxi.birt.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by saxer on 10/23/15.
 */
public class MumaoxiServlet extends HttpServlet {

    //模板渲染文件目录
    private String layoutPath = "/webcontent/mumaoxi/pages/";

    public MumaoxiServlet() {
        layoutPath += this.getClass().getSimpleName().toLowerCase().replace("servlet", "") + "/";
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
    }

    /**
     * 模板渲染
     *
     * @param req
     * @param resp
     * @param relativeTemplateName 渲染的模板文件路径（相对）
     * @throws ServletException
     * @throws IOException
     */
    protected void render(HttpServletRequest req, HttpServletResponse resp, String relativeTemplateName) throws ServletException, IOException {
        relativeTemplateName = relativeTemplateName.endsWith(".jsp") ? relativeTemplateName : (relativeTemplateName + ".jsp");
        getServletConfig().getServletContext().getRequestDispatcher(layoutPath + relativeTemplateName).forward(req, resp);
    }
}
