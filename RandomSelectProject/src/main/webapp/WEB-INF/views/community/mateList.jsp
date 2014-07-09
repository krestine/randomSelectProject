
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myapp/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/myapp/resources/js/bootstrap.min.js"></script>


<script>
$(document).ready(function() {
	$('mateListBtn').click(function() {
		$('#community').attr("action", "mateListProc.do").submit();
	});
	$('mateDetailBtn').click(function(){
		$('#community').attr("action","mateDetailProc.do").submit();
	});

});

</script>
<title>mateList</title>
</head>
<body>


	<h1>친구리스트</h1>
	<form id="community" method="post" >
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
