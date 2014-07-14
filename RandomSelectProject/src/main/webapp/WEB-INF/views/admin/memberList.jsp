<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 명단</title>
</head>
<body>

	

	<div align="center">
	<h1>회원 목록</h1>
	<table border="2">
		<caption></caption>
		<thead>
			<tr>
				<th id="n">회원아이디
				<th>회원이름
				<th>회원등급
				<th>블랙리스트
				<th>
		<tbody>

			<c:forEach items="${members}" var="member">
				<tr>
					<form action="setMemberInfoProc.do" method="post">
						<td>${member.memId}<input type="hidden"
							value="${member.memId}" name="memId"></td>
						<td>${member.memName}</td>
						<td><select name="memGrade">

								<c:forEach items="${grades}" var="grade" varStatus="gradeValue">
									<c:choose>
										<c:when test="${member.memGrade==grade}">
											<option value="${grade}" selected="selected">${grade}</option>
										</c:when>
										<c:otherwise>
											<option value="${grade}">${grade}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>





						</select></td>
						<td><c:choose>
								<c:when test="${member.black=='1'}">
									<input type="checkbox" name="black" value="1" checked="checked">
								</c:when>

								<c:otherwise>
									<input type="checkbox" name="black" value="1">
								</c:otherwise>
							</c:choose></td>
						<td><input type="submit" value="수정"></td>
					</form>
				<tr>
			</c:forEach>
	</table>

</div>

</body>
</html>

