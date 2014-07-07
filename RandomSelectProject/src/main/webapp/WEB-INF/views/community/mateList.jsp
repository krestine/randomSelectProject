
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="/controller/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="/controller/resources/js/bootstrap.min.js"></script>
 <script src="/controller/resources/js/respond.js"></script>
<script>
$(document).ready(function() {
	$('input[type=button]').click(function() {
		formHanddler(this);
	});
	function formHanddler(obj) {
		var objID = obj.id;
		var actionStr;

		if (objID === "restntListBtn") {
			actionStr = "restntListProc.do";

		}
		if (objID === "mainBtn") {
			actionStr = "main.do";

		} 
		$('#community').attr("action", actionStr).submit();
	}
});

</script>
<title>mateList</title>
</head>
<body>

	<h1>친구리스트</h1>
	<form id="community" method="POST" class="nav nav-pills">
		 <input type="button" class="btn btn-success" value="식당 리스트" id="restntListBtn"/> 
		 <input type="button" class="btn btn-success" value="메인" id="mainBtn"/>
	</form>

	<c:forEach var="mate" items="${mates}">		
					<form action="mateDetailProc.do" method="post">
						<input type="hidden" value="${mate.memId}" name="memId">			
						<input value="${mate.memName}" name="memName">
						<input value="${mate.mateId}" name="mateId">
						<input type="submit" class="btn btn-success" value="상세보기">
					</form>
					<br>
	</c:forEach>
			
</body>
</html>
