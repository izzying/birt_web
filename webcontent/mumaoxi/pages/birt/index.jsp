<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: saxer
  Date: 10/26/15
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>报表列表</title>
    <link href="<%=request.getContextPath()%>/webcontent/mumaoxi/bootstrap-3.3.5-dist/css/bootstrap.css"
          rel="stylesheet"/>
</head>
<body>
<div class="container">
    <h2>报表列表</h2>
    <table class="table table-hover table-bordered table-striped table-condensed">
        <tr>
            <th>文件名</th>
            <th>操作</th>
        </tr>
        <%
            for (String file : ((String[]) session.getAttribute("reports"))) {
        %>
        <tr>
            <td><%=file%>
            </td>
            <th>
                <button class="btn btn-xs btn-default"
                        data-js-href="<%= request.getContextPath( )%>/frameset?__report=<%=file%>">查看
                </button>
            </th>
        </tr>
        <%}%>
    </table>
</div>

<script src="<%=request.getContextPath()%>/webcontent/birt/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/webcontent/mumaoxi/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
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
</body>
</html>