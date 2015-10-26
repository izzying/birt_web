package com.mumaoxi.birt.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by saxer on 10/23/15.
 */
public class BirtServlet extends MumaoxiServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        String pathInfo = requestURI.replaceFirst(req.getContextPath(), "");

        resp.getWriter().append("<html><body>");
        resp.getWriter().append("requestURI:" + requestURI + "<br>");
        resp.getWriter().append("getServletPath:" + req.getServletPath() + "<br>");
        resp.getWriter().append("getContextPath:" + req.getContextPath() + "<br>");
        resp.getWriter().append("pathInfo:" + pathInfo + "<br>");
        resp.getWriter().append("</body></html>");


        if ("/birts/new".equalsIgnoreCase(pathInfo)) {
            this._new(req, resp);
        } else if ("/birts/show".equalsIgnoreCase(pathInfo)) {
            this._show(req, resp);
        } else if ("/birts/edit".equalsIgnoreCase(pathInfo)) {
            this._edit(req, resp);
        } else if ("/birts/".equalsIgnoreCase(pathInfo) || "/birts".equalsIgnoreCase(pathInfo)) {
            this._index(req, resp);
        }
    }

    private void _index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("files", new String[]{"report_001", "test", "test1", "haha", "stream", "saxer"});
        resp.getWriter().append(new String[]{"report_001", "test", "test1", "haha", "stream", "saxer"}.toString());
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
