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

	<!--꾸에에에에에에에엑  -->
	
	<table border="2">
		<caption></caption>
		<thead>
			<tr>
				<th id="n">회원아이디
				<th>회원이름
				<th>회원등급
				<th>블랙리스트
		<tbody>

			<c:forEach items="${members}" var="member">
				<tr>
					<form action="setMemberInfoProc.do" method="post">
						<td>${member.memId}<input type="hidden"
							value="${member.memId}" name="memId"></td>
						<td>${member.memName}</td>
						<td><select name="memGrade">
								<c:choose>
									<c:when test="${member.memGrade=='1'}">
										<option value="1" selected="selected">1</option>
									</c:when>
									<c:otherwise>
										<option value="1">1</option>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${member.memGrade=='2'}">
										<option value="2" selected="selected">2</option>
									</c:when>
									<c:otherwise>
										<option value="2">2</option>
									</c:otherwise>
								</c:choose>


								<c:choose>
									<c:when test="${member.memGrade=='3'}">
										<option value="3" selected="selected">3</option>
									</c:when>
									<c:otherwise>
										<option value="3">3</option>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${member.memGrade=='4'}">
										<option value="4" selected="selected">4</option>
									</c:when>
									<c:otherwise>
										<option value="4">4</option>
									</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${member.memGrade=='5'}">
										<option value="5" selected="selected">5</option>
									</c:when>
									<c:otherwise>
										<option value="5">5</option>
									</c:otherwise>
								</c:choose>
						</select></td>
						<td>
						
						<c:choose>
								<c:when test="${member.black=='1'}">
								<input type="checkbox" name="black" value="1" checked="checked">
								</c:when>
								
								<c:otherwise><input type="checkbox" name="black" value="1" ></c:otherwise>
							</c:choose></td>
						<td><input type="submit" value="수정"></td>
					</form>
				<tr>
			</c:forEach>
	</table>



</body>
</html>

