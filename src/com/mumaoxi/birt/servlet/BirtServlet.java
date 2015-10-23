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
        resp.getWriter().append("requestURI:" + requestURI + "<br>");
        if ("/birts/new".equalsIgnoreCase(requestURI)) {
            this._new(req, resp);
        } else if ("/birts/show".equalsIgnoreCase(requestURI)) {
            this._show(req, resp);
        } else if ("/birts/edit".equalsIgnoreCase(requestURI)) {
            this._edit(req, resp);
        } else if ("/birts/".equalsIgnoreCase(requestURI) || "/birts".equalsIgnoreCase(requestURI)) {
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
