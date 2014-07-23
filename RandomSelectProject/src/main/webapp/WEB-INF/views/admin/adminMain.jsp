<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
html {
	height: 100%;
	margin : 0;
	padding : 0;
}

body,.container {
	height: 100%;
	margin: 0;
	padding : 0;
}
</style>
<script type="text/javascript">
	function memberGo() {

		document.getElementById("GoSelect").action = "memberSearchForm.do";
		document.getElementById("GoSelect").submit();
	}

	function restntGo() {

		document.getElementById("GoSelect").action = "restntManantProc.do";
		document.getElementById("GoSelect").submit();
	}
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자</title>
</head>
<body>
	<div align="center">
	<form id="GoSelect">
		<input type="button" value="회원관리" onclick="memberGo()" style="width: 120px; height: 50px;"> 
		<input type="button" value="식당관리" onclick="restntGo()" style="width: 120px; height: 50px;">
	</form>
	</div>
</body>
</html>