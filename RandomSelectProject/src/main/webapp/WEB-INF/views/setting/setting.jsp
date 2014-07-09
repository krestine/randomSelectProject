<%@page import="java.util.List"%>
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
				<c:choose>

					<c:when test="${walkRange.walkRange==userInfo.memWalkRange}">
						<option selected="selected">${walkRange.walkRange}</option>
					</c:when>

					<c:otherwise>
						<option>${walkRange.walkRange}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>

		</select> <br> 검색 설정 : 차량 <br> <select name="carRange">

			<c:forEach items="${carRanges}" var="carRange">

				<c:choose>
					<c:when test="${carRange.carRange==userInfo.memCarRange}">
						<option selected="selected">${carRange.carRange}</option>
					</c:when>
					<c:otherwise>
						<option>${carRange.carRange}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>


		</select> <br> <br> 검색 설정 : 제외메뉴 <br>
		<c:forEach items="${excMenus}" var="excMenu" varStatus="num">

			<c:choose>
				<c:when test="${excMenu.excMenu==userSettings[num.index]}">

					<input type="checkbox" value="${num.index}" name="menus"
						checked="checked">${excMenu.excMenu}
				<br>
				</c:when>
				<c:otherwise>

					<input type="checkbox" value="${num.index}" name="menus">${excMenu.excMenu}
				<br>
				</c:otherwise>

			</c:choose>
		</c:forEach>

		<br> <input type="submit" value="저장">

	</form>
	<form action="main.do">
		<input type="submit" value="메인으로">
	</form>



</body>
</html>