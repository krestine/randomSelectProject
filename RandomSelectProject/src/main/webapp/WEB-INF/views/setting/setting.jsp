<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>설정</title>
</head>
<body>
	<form action="settingProc.do" method="post">
		검색 설정: 도보 <br> <select name="walkRange">
			<c:forEach items="${walkRanges}" var="walkRange">
				<option>${walkRange.walkRange}</option>
			</c:forEach>
		</select> <br> <br> 검색 설정 : 차량 <br> <select name="carRange">
			<c:forEach items="${carRanges}" var="carRange">
				<option>${carRange.carRange}</option>
			</c:forEach>
		</select> <br> <br> 검색 설정 : 제외메뉴 <br>
		<c:forEach items="${excMenus}" var="excMenu" varStatus="num">
			<input type="checkbox" value="${num.index}" name="menus">${excMenu.excMenu}
				<br>
		</c:forEach>
		<br> <input type="submit" value="저장">
	</form>



</body>
</html>