<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Birt报表首页</title>
    <link href="http://www.eclipse.org/images/eclipse.ico" type=image/x-icon rel="shortcut icon">
    <style>
        .warningMessage {
            color: red;
        }
    </style>
    <%
        String javaVersion = System.getProperty("java.version");
        String viewerVersion = "4.5.0";
        String engineVersion = "4.5.0";
    %>
</head>
<body>
<!-- Page banner -->
<TABLE class=banner-area cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
    <TR>
        <TD width=115><a href="http://www.eclipse.org/">
            <IMG src="webcontent/birt/images/EclipseBannerPic.jpg" alt="Eclipse Logo" width="115" height="50" border=0></a>
        </TD>
        <TD>
            <IMG src="webcontent/birt/images/gradient.jpg" alt="gradient banner" width="300" height="50" border=0>
        </TD>
        <TD vAlign=center align=right width=250>
            <a class="birt" href="http://www.eclipse.org/birt">
                <!-- Temporary BIRT header -->
							<SPAN style="PADDING-RIGHT: 10px; FONT-WEIGHT: bold; FONT-SIZE: 20px; COLOR: #e8e8ff; FONT-FAMILY: arial, sans-serif">
								BIRT
							</SPAN>
            </a>
        </TD>
    </TR>
    </TBODY>
</TABLE>
<!-- Table with menu & content -->
<table cellSpacing=0 cols=2 cellPadding=0 border=0 width="100%">
    <tbody>
    <tr>
        <td class=content style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px">
            <!-- Page title -->
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR>
                    <TD vAlign=top>
                        <span class="indextop">BIRT viewer has been installed.</span>

                        <p>&nbsp;
                    </TD>
                    <TD class=jump style="PADDING-LEFT: 10px" align=right rowSpan=2>
                        <IMG src="webcontent/birt/images/Idea.jpg" alt="Idea" width="120" height="86">
                    </TD>
                </TR>
                <TR>
                    <TD>&nbsp;</TD>
                </TR>
                </TBODY>
            </TABLE>
            <!-- Content area -->
            <p>Thank you for your choosing BIRT (Business Intelligence Reporting Tool).</p>

            <p>Viewer Version : <%= viewerVersion %>
            </p>

            <p>Engine Version: <%= engineVersion %>
            </p>
            <%
                String javaVersionMessage = javaVersion;

                // check Java version
                String[] versionParts = javaVersion.split("\\.");
                int majorVersion = 0;
                int minorVersion = 0;
                try {
                    majorVersion = Integer.parseInt(versionParts[0]);
                    minorVersion = Integer.parseInt(versionParts[1]);
                    if (majorVersion < 1 || (majorVersion == 1 && minorVersion < 5)) {
                        javaVersionMessage = "<span class=\"warningMessage\">" + javaVersion + " (WARNING: BIRT " + viewerVersion + " only supports JRE versions >= 1.5)</span>";
                    }
                } catch (NumberFormatException e) {

                }
            %>
            <p>JRE version: <%= javaVersionMessage  %>
            </p>

            <p><a data-js-href="<%= request.getContextPath( ) + "/frameset?__report=report_001.rptdesign" %>">查看报表report_001.rptdesign</a>
            </p>

            <p><a href="<%= request.getContextPath( ) + "/birts" %>">BirtWeb报表首页</a>
            </p>
        </td>
    </tr>
    </tbody>
</table>
<script src="webcontent/birt/scripts/jquery-2.1.4.js"></script>
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
