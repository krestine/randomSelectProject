<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>



	<div>
		<h1 align="center">boardList</h1>
		<table align="center" border="1" width="90%">

			<tr align="center">
				<td width="80">글번호</td>
				<td>제&nbsp;목</a></td>
				<td width="80">작성자</td>
				<td width="80">시&nbsp;&nbsp;간</td>
				<td width="80">조회수</td>
			</tr>
			<c:forEach items="${boards}" var="board">
				<tr align="center">
					<td width="80">${board.boardNumber}</td>
					<!-- 글번호 -->
					<td><a href="boardContext.do?boardNumber=${board.boardNumber}">${board.title}</a></td>
					<!-- 제목 -->
					<td width="80">${board.userId }</td>
					<!-- 작성자 -->
					<td width="85">${board.qaDate }</td>
					<!-- 작성일 -->
					<td width="80">${board.hit}</td>
					<!-- 조회수 -->
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td colspan="2" align="right"><form action="myBoardList.do">
						<input type="hidden" name="userId" value="${users.userid }">
						
						<input type="submit" value="내글 목록">
					</form> <input type="button"
					onclick="document.location='boardWriteForm.do'" value="글쓰기"></td>
			</tr>

		</table>
		<br>
	</div>


</body>
</html>