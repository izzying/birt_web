package com.mumaoxi.birt.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by saxer on 10/31/15.
 */
public class AppFilter implements Filter {
    protected String encoding = "UTF-8";
    protected String contentType = "text/html;charset=utf-8";
    protected FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletResponse.setCharacterEncoding(encoding);
        servletResponse.setContentType(contentType);
        if (servletRequest.getCharacterEncoding() == null && this.encoding != null) {
            servletRequest.setCharacterEncoding(this.encoding);
        }
        System.err.println("this.is App filter:");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        this.encoding = null;
        this.filterConfig = null;

    }
}
