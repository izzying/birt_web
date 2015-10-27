<%-----------------------------------------------------------------------------
	Copyright (c) 2004 Actuate Corporation and others.
	All rights reserved. This program and the accompanying materials 
	are made available under the terms of the Eclipse Public License v1.0
	which accompanies this distribution, and is available at
	http://www.eclipse.org/legal/epl-v10.html
	
	Contributors:
		Actuate Corporation - Initial implementation.
-----------------------------------------------------------------------------%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page session="false" buffer="none" %>
<%@ page import="org.eclipse.birt.report.presentation.aggregation.IFragment,
                 org.eclipse.birt.report.resource.BirtResources,
                 org.eclipse.birt.report.utility.ParameterAccessor,
                 org.eclipse.birt.report.servlet.ViewerServlet" %>

<%-----------------------------------------------------------------------------
	Expected java beans
-----------------------------------------------------------------------------%>
<jsp:useBean id="fragment" type="org.eclipse.birt.report.presentation.aggregation.IFragment" scope="request"/>
<jsp:useBean id="attributeBean" type="org.eclipse.birt.report.context.BaseAttributeBean" scope="request"/>

<%-----------------------------------------------------------------------------
	Toolbar fragment
-----------------------------------------------------------------------------%>
<TR
        <%
            if (attributeBean.isShowToolbar()) {
        %>
        HEIGHT="20px"
        <%
        } else {
        %>
        style="display:none"
        <%
            }
        %>
        >
    <TD COLSPAN='2'>
        <DIV ID="toolbar">
            <TABLE CELLSPACING="1px" CELLPADDING="1px" WIDTH="100%" CLASS="birtviewer_toolbar">
                <TR>
                    <TD></TD>
                </TR>
                <TR>
                    <TD WIDTH="6px"/>
                    <td WIDTH="55px" onclick="javascript:birtEventDispatcher.broadcastEvent( birtEvent.__E_TOC )">
                        <input TYPE="image" name='toc' SRC="birt/images/Toc.gif"
                               TITLE="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.toc" )%>"
                               ALT="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.toc" )%>"
                               CLASS="birtviewer_clickable"
                               width="20px">
                        <p class="birtviewer_clickable_text">
                            预览目录</p>
                    </td>
                    <TD WIDTH="6px"/>
                    <TD WIDTH="55px" onclick="javascript:birtEventDispatcher.broadcastEvent( birtEvent.__E_PARAMETER )">
                        <INPUT TYPE="image" name='parameter' SRC="birt/images/Report_parameters.gif"
                               TITLE="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.parameter" )%>"
                               ALT="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.parameter" )%>"
                               CLASS="birtviewer_clickable"width="20px">

                        <p class="birtviewer_clickable_text">输入参数</p>
                    </TD>
                    <TD WIDTH="6px"/>
                    <TD WIDTH="55px" onclick="javascript:birtEventDispatcher.broadcastEvent( birtEvent.__E_QUERY_EXPORT )">
                        <INPUT TYPE="image" name='export' SRC="birt/images/Export.gif"
                               TITLE="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.export" )%>"
                               ALT="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.export" )%>"
                               CLASS="birtviewer_clickable"width="20px">

                        <p class="birtviewer_clickable_text">导出CSV</p>
                    </TD>
                    <TD WIDTH="6px"/>
                    <TD WIDTH="55px" onclick="javascript:birtEventDispatcher.broadcastEvent( birtEvent.__E_EXPORT_REPORT )">
                        <INPUT TYPE="image" name='exportReport' SRC="birt/images/ExportReport.gif"
                               TITLE="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.exportreport" )%>"
                               ALT="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.exportreport" )%>"
                               CLASS="birtviewer_clickable"width="20px">

                        <p class="birtviewer_clickable_text">导出PDF</p>
                    </TD>
                    <TD WIDTH="6px"/>
                    <TD WIDTH="55px" onclick="javascript:birtEventDispatcher.broadcastEvent( birtEvent.__E_PRINT )">
                        <INPUT TYPE="image" name='print' SRC="birt/images/Print.gif"
                               TITLE="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.print" )%>"
                               ALT="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.print" )%>"
                               CLASS="birtviewer_clickable"width="20px">

                        <p class="birtviewer_clickable_text">打印预览</p>
                    </TD>
                    <%
                        if (ParameterAccessor.isSupportedPrintOnServer) {
                    %>
                    <TD WIDTH="6px"/>
                    <TD WIDTH="55px" onclick="javascript:birtEventDispatcher.broadcastEvent( birtEvent.__E_PRINT_SERVER )">
                        <INPUT TYPE="image" name='printServer' SRC="birt/images/PrintServer.gif"
                               TITLE="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.printserver" )%>"
                               ALT="<%= BirtResources.getHtmlMessage( "birt.viewer.toolbar.printserver" )%>"
                               CLASS="birtviewer_clickable"width="20px">

                        <p class="birtviewer_clickable_text">立刻打印</p>
                    </TD>
                    <%
                        }
                    %>
                    <TD ALIGN='right'>
                    </TD>
                    <TD WIDTH="6px"/>
                </TR>
            </TABLE>
        </DIV>
    </TD>
</TR>
