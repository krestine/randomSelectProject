
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
	$('#mateListBtn').click(function() {
		$('#community').attr("action", "mateListProc.do").submit();
	});
});

</script>
<title>식당리스트</title>
</head>
<body>

	<h1>친구들이 평가한 식당리스트</h1>
<div>
	<form id="community" method="post" >
		<input type="button" class="btn btn-success" value="친구 리스트" id="mateListBtn"/> 
	</form>
	<br>
	<c:forEach var="restnt" items="${restnts}">
		
						<form action="restntDetailProc.do" method="post">	
				
						<input value="식당이름">
						<input value="평균별점">
						<br>
						<input type="hidden" value="${restnt.mateId }" name="mateId">
						<input type="hidden" value="${restnt.restntId }" name="restntId">
						<input value="${restnt.restntName}" name="restntName">
						<input value="${restnt.score}" name="score">
						<input type="submit" class="btn btn-success" value="상세보기">
						</form>
						<br>
		</c:forEach>
</div>
</body>

</html>
