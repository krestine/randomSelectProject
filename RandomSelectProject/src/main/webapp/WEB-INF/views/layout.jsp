<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<!-- <div class="col-md-1"></div>
<div class="col-md-10"> -->
	

	<div align="center">
		<table width="100%" border="0">
			<tr>
				<td><tiles:insertAttribute name="header" /></td>
			</tr>
			<tr>
				<td><tiles:insertAttribute name="menu" /></td>
			</tr>
			<tr>
				<%-- <td width="180"><tiles:insertAttribute name="menu" /></td> --%>
				<td height="500"><tiles:insertAttribute name="main" /></td>
			</tr>
			<tr>
				<td height="0" colspan="0" bgcolor="#e2e2e2"><tiles:insertAttribute
						name="footer" /></td>
			</tr>
		</table>
	</div>
<!-- </div>
<div class="col-md-1"></div>	 -->
</body>
</html>
