<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table border="2">
		<caption></caption>
		<thead>
			<tr>
				<th>식당이름
				<th>방문일자
				<th>선택메뉴
				<th>삭제
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
						<td><input type="submit" value="수정"></td>
					</form>
				<tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>