package com.mumaoxi.birt.servlet;

import com.mumaoxi.birt.model.Report;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by saxer on 10/23/15.
 */
public class BirtServlet extends MumaoxiServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        String requestURI = req.getRequestURI();
        String pathInfo = requestURI.replaceFirst(req.getContextPath(), "");

        resp.getWriter().append("<html><body>");

        resp.getWriter().append("requestURI:" + requestURI + "<br>");
        resp.getWriter().append("getServletPath:" + req.getServletPath() + "<br>");
        resp.getWriter().append("getContextPath:" + req.getContextPath() + "<br>");
        resp.getWriter().append("pathInfo:" + pathInfo + "<br>");


        if ("/birts/new".equalsIgnoreCase(pathInfo)) {
            this._new(req, resp);
        } else if ("/birts/show".equalsIgnoreCase(pathInfo)) {
            this._show(req, resp);
        } else if ("/birts/edit".equalsIgnoreCase(pathInfo)) {
            this._edit(req, resp);
        } else if ("/birts/".equalsIgnoreCase(pathInfo) || "/birts".equalsIgnoreCase(pathInfo)) {
            this._index(req, resp);
        }

        resp.getWriter().append("</body></html>");
    }

    /**
     * 获取报表的列表
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void _index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Report> reports = Report.getAll(req.getServletContext());
        session.setAttribute("reports", reports);
        super.render(req, resp, "index");
    }

    private void _show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.render(req, resp, "show");
    }

    private void _new(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.render(req, resp, "new");
    }

    private void _edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.render(req, resp, "edit");
    }

}
