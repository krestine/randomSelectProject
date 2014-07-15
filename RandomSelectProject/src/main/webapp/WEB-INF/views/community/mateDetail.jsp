
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mateDetail</title>

<script>
function loginGo() {
	document.getElementById("select1").action = "loginForm.do";
	document.getElementById("select1").submit();
}


$(document).ready(function() {
	$('#mateListBtn').click(function() {
		$('#community').attr("action", "mateListProc.do").submit();
	});
	$('#restntListBtn').click(function(){
		$('#community').attr("action","restntListProc.do").submit();
	});

});
</script>	
</head>
<body>
<div>
		<h4>${mateInfo.memName }<small>님의 상세정보</small></h4>
		<br>
		<form id="community" method="post">
		<input type="button" class="btn btn-success btn-sm" value="친구 리스트" id="mateListBtn" />
		<input type="button" class="btn btn-success btn-sm" value="식당 리스트" id="restntListBtn"/>
		</form>	
		<br>
		
		<form id="mateDetail" action="mateDetailProc.do" method="post">
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
</div>
</body>

</html>
