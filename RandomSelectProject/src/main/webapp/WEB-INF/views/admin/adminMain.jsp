<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function memberGo() {

		document.getElementById("GoSelect").action = "/memberSearchForm.do";
		document.getElementById("GoSelect").submit();
	}

	function restntGo() {

		document.getElementById("GoSelect").action = "/restntManantProc.do";
		document.getElementById("GoSelect").submit();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form id="GoSelect">
		<input type="button" value="회원관리" onclick="memberGo()"> 
		<input type="button" value="식당관리" onclick="restntGo()">
	</form>
</body>
</html>