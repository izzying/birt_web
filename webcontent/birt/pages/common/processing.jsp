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
<%@ page import="org.eclipse.birt.report.resource.BirtResources" %>

<%-----------------------------------------------------------------------------
	Progress page
-----------------------------------------------------------------------------%>
<%
	boolean rtl = false;
	String rtlParam = request.getParameter("__rtl");
	if ( rtlParam != null )
	{
		rtl = Boolean.getBoolean(rtlParam);
	}
%>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<LINK REL="stylesheet" HREF="<%= request.getContextPath( ) + "/webcontent/birt/styles/style.css" %>" TYPE="text/css">
	</HEAD>
	<BODY STYLE="background-color: #ECE9D8;">
		<DIV ID="progressBar" ALIGN="center">
			<TABLE WIDTH="250px" CLASS="birtviewer_progresspage" CELLSPACING="10px">
				<TR>
					<TD ALIGN="center">
						<B>
							<%= BirtResources.getMessage( "birt.viewer.progressbar.prompt" )%>
						</B>
					</TD>
				</TR>
				<TR>
					<TD ALIGN="center">
						<IMG SRC="<%= request.getContextPath( ) + "/webcontent/birt/images/" + (rtl?"Loading_rtl":"Loading") + ".gif" %>" ALT="Progress Bar Image"/>
					</TD>
				</TR>
			</TABLE>
		</DIV>
	</BODY>
</HTML>
