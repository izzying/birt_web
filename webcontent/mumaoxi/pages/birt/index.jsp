<!doctype html>
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <script src="<%=request.getContextPath()%>/webcontent/birt/scripts/jquery-2.1.4.js"></script>
</head>
<body>
<h2>Birts index</h2>
<%
    for (String file : ((String[]) session.getAttribute("reports"))) {
%>
<a data-js-href="<%= request.getContextPath( )%>/frameset?__report=<%=file%>"><%=file%>
</a>
<br>
<%}%>
</body>
<script>
    $("[data-js-href]").click(function () {
        var windowHeight = window.screen.height;
        var windowWidth = window.screen.width;
        var width = 800;
        var height = windowHeight;
        var top = 0;
        var left = (windowWidth - width) / 2;
        window.open(jQuery(this).data('js-href'), "birt", "toolbar=no, scrollbars=yes, resizable=yes, top=0, left=" + left + ", width=" + width + ", height=" + height);
    });
</script>
</html>