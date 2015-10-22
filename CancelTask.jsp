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
<%@ page import="org.eclipse.birt.report.utility.BirtUtility,
				 org.eclipse.birt.report.IBirtConstants,
				 org.eclipse.birt.report.resource.BirtResources" %>

<%-----------------------------------------------------------------------------
	Cancel Task
-----------------------------------------------------------------------------%>
<!DOCTYPE html>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<TITLE>
			<%= BirtResources.getMessage( "birt.viewer.title.message" )%>
		</TITLE>
		<LINK REL="stylesheet" HREF="<%= request.getContextPath( ) + "/webcontent/birt/styles/style.css" %>" TYPE="text/css">
	</HEAD>
	<%
		String taskid = request.getParameter( IBirtConstants.OPRAND_TASKID );
		try
		{
			BirtUtility.cancelTask( request, taskid );
		}
		catch( Exception e )
		{
			e.printStackTrace( );
		}
	%>
	<BODY>
		<TABLE CLASS="BirtViewer_Highlight_Label">
			<TR>
				<TD NOWRAP>
					<%= BirtResources.getMessage( "birt.viewer.message.taskcanceled" )%>
				</TD>
			</TR>
		</TABLE>
	</BODY>
</HTML>
