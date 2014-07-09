<<<<<<< HEAD
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
<script src="/myapp/resources/js/respond.js"></script>

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
<title>restntDetail</title>

</head>
<body>

<h1>${restnt.restntName}의 상세정보</h1>
					
				
					<br>
					<form id="community" method="post">
						<input type="button" class="btn btn-success" value="식당 리스트" id="restntListBtn"/>
						<input type="button" class="btn btn-success" value="친구 리스트" id="mateListBtn"/>
						<input type="button" class="btn btn-success" value="메인" id="mainBtn"/>
					</form>
					<br>
     				<form action="restntDetailProc.do" method="post">
					
						<input value="식당이름">
						<input value="평균별점"><br>
						<input value="${restnt.restntName}" name="restntName">
						<input value="${restnt.restntEval}" name="restntEval"><br>
						<br>
						<input value="카테고리">
						<input value="전화번호"><br>
						<input value="${restnt.restntCate}" name="restntCate">
						<input value="${restnt.restntTel}" name="restntTel"><br>
						<br>
						
						${restnt.restntName }의 메뉴정보
						<br>
						
						<input value="메뉴이름">
						<input value="가격">
						<input value="칼로리">
						<br>
						<c:forEach items="${menuInfo }" var="menuInfo">
						<input type="hidden" value="${menuInfo.menuId}" name="menuId">
						<input value="${menuInfo.menuName}" name="menuName">
						<input value="${menuInfo.menuPrice}" name="menuPrice">
						<input value="${menuInfo.menuCalorie}" name="menuCalorie"><br>
						</c:forEach>
					</form>
					<br>

</body>

</html>
