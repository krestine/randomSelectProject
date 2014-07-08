<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mateDetail</title>
<link rel="stylesheet" type="text/css" href="/myapp/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/myapp/resources/css/bootstrap-theme.min.css" />
<script type="text/javascript" src="/myapp/resources/js/bootstrap.min.js"></script>
<script src="/myapp/resources/js/respond.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
	$('input[type=button]').click(function() {
		formHanddler(this);
	});
	function formHanddler(obj) {
		var objID = obj.id;
		var actionStr;

		if (objID === "mateListBtn") {
			actionStr = "mateListProc.do";

		}
		if (objID === "mainBtn") {
			actionStr = "main.do";

		} 
		$('#community').attr("action", actionStr).submit();
	}
});

</script>	
</head>
<body>


		<h1>${mateInfo.memName }님의 정보입니다.</h1>
		<br>
		<form id="community" method="post">
		<input type="button" class="btn btn-success" value="친구 리스트" id="mateListBtn" />
		<input type="button" class="btn btn-success" value="메인" id="mainBtn"/>
		</form>
		<br>
		
		<form action="mateDetailProc.do" method="post">
			<input value="친구이름">
			<input value="친구아이디">
			<input value="친구등급"><br>
			
			<input value="${mateInfo.memName }" name="memName">
			<input value="${mateInfo.memId}" name="memId">
			<input value="${mateInfo.memGrade}" name="memGrade"><br>
			
			
			<br>
			<input value="공유상태">
			<input value="친구관계"><br>	
			<input value="${mate.infoStatus}" name="infoStatus">			
			<input value="${mate.mateStatus}" name="mateStatus">
			
		</form>
					<br>	

</body>
</html>