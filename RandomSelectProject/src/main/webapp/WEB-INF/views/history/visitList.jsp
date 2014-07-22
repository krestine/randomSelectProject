<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Timestamp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css' rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{
	font-family: 'Nanum Gothic Coding', sans-serif;
	text-rendering: optimizeLegibility;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<center>
	<div align="center" style="width:90%;">
	<table border="2" align="center" class="table table-striped table-hover">
		<caption></caption>
		<thead>
			<tr>
				<th id="n"><h4>번호</h4>
				<th><h4>방문일자</h4>
				<th><h4>식당이름</h4>
				<th><h4>선택메뉴</h4>
				<th><h4>삭제</h4>
		<tbody>

			<c:forEach items="${visits}" var="visit">
				<tr>
					<form action="deleteVisitInfo.do" method="post">
						<td><h4>${visit.visitId}<input type="hidden"
							value="${visit.visitId}" name="visitId"></h4></td>
						<td><h4>${visit.visitDate}</h4></td>
						<td><h4>${visit.restntName}</h4></td>
						<td><h4>${visit.menuId}</h4></td>
						<td align="center"><h4><input type="submit" value="삭제" class="btn btn-danger"></h4></td>
					</form>
				<tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</center>
</body>
</html>