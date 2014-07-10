
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script>
$(document).ready(function() {
	$('#restntListBtn').click(function() {
		$('#community').attr("action", "restntListProc.do").submit();
	});

});

</script>
<title>mateList</title>
</head>
<body>


	<h1>친구리스트</h1>
<div>	
	<form id="community" method="post" >
		 <input type="button" class="btn btn-success" value="식당 리스트" id="restntListBtn"/>
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
</div>		
</body>
</html>
