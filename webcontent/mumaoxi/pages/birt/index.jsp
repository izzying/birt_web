<%@ page import="com.mumaoxi.birt.model.Report" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>统计报表</title>
    <link href="<%=request.getContextPath()%>/webcontent/mumaoxi/bootstrap-3.3.5-dist/css/bootstrap.css"
          rel="stylesheet"/>
    <link href="<%= request.getContextPath( )%>/webcontent/mumaoxi/images/report.ico" type=image/x-icon
          rel="shortcut icon">
</head>
<body>
<div class="container">
    <br>
    <div class="alert alert-warning">
        <h4>重要公告：查看报表前，请务必仔细阅读这些规则</h4>
        <hr>
        <p>【商城】：报表名称以<strong class="text-danger">【商城】</strong>开始，数据不包含<strong class="text-danger">优店</strong>统计数据。</p>
        <p>【优店】：报表名称以<strong class="text-danger">【优店】</strong>开始，数据不包含<strong class="text-danger">商城</strong>统计数据。</p>
        <p>【首趣】：报表名称以<strong class="text-danger">【首趣】</strong>开始，数据包含<strong class="text-danger">商城</strong>和<strong class="text-danger">优店</strong>统计数据。</p>
        <p class="text-right">---- 2015年10月30日</p>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">统计报表</h3>
        </div>
        <table class="table table-hover table-condensed">
            <tr>
                <th>#id</th>
                <th>报表</th>
                <th>上传者</th>
                <th>操作</th>
            </tr>
            <%
                for (Report report : ((ArrayList<Report>) session.getAttribute("reports"))) {
            %>
            <tr>
                <td><%=report.getId()%>
                </td>
                <td><span data-toggle="tooltip" data-placement="top"
                          title="<%=report.getDescription()%>"><%=report.getTitle() != null ? report.getTitle() : report.getFileName()%></span>
                </td>
                <td><%=report.getAuthor()%>
                </td>
                </td>
                <th>
                    <a class="btn btn-xs btn-default" target="_blank"
                       href="<%= request.getContextPath( )%>/frameset?__report=<%=report.getFileName()%>"
                       data-js-href="<%= request.getContextPath( )%>/frameset?__report=<%=report.getFileName()%>">查看
                    </a>
                </th>
            </tr>
            <%}%>
        </table>
    </div>
</div>

<script src="<%=request.getContextPath()%>/webcontent/birt/scripts/jquery-2.1.4.js"></script>
<script src="<%=request.getContextPath()%>/webcontent/mumaoxi/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<script>
    $('[data-toggle="tooltip"]').tooltip();
    //    $("[data-js-href]").click(function () {
    //        var windowHeight = window.screen.height;
    //        var windowWidth = window.screen.width;
    //        var width = 800;
    //        var height = windowHeight;
    //        var top = 0;
    //        var left = (windowWidth - width) / 2;
    //        window.open(jQuery(this).data('js-href'), "birt", "toolbar=no, scrollbars=yes, resizable=yes, top=0, left=" + left + ", width=" + width + ", height=" + height);
    //    });
</script>
</body>
</html>