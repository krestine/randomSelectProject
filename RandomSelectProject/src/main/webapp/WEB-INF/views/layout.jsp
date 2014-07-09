<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
._css3m {
	display: none
}

.redBtn {
	-moz-box-shadow: inset 0px 1px 0px 0px #f5978e;
	-webkit-box-shadow: inset 0px 1px 0px 0px #f5978e;
	box-shadow: inset 0px 1px 0px 0px #f5978e;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f24537
		), color-stop(1, #c62d1f));
	background: -moz-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background: -webkit-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background: -o-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background: -ms-linear-gradient(top, #f24537 5%, #c62d1f 100%);
	background: linear-gradient(to bottom, #f24537 5%, #c62d1f 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537',
		endColorstr='#c62d1f', GradientType=0);
	background-color: #f24537;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #d02718;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: arial;
	font-size: 15px;
	font-weight: bold;
	padding: 2px 9px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #810e05;
}

.redBtn:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c62d1f
		), color-stop(1, #f24537));
	background: -moz-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background: -webkit-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background: -o-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background: -ms-linear-gradient(top, #c62d1f 5%, #f24537 100%);
	background: linear-gradient(to bottom, #c62d1f 5%, #f24537 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f',
		endColorstr='#f24537', GradientType=0);
	background-color: #c62d1f;
}

.redBtn:active {
	position: relative;
	top: 1px;
}

body {
	padding-top: 70px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body background="/myapp/resources/img/bg2.png">
	<br>
	<br>
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
				<td height="300"><tiles:insertAttribute name="main" /></td>
			</tr>
			<tr>
				<td height="0" colspan="0" bgcolor="#e2e2e2"><tiles:insertAttribute
						name="footer" /></td>
			</tr>
		</table>
	</div>
</body>
</html>