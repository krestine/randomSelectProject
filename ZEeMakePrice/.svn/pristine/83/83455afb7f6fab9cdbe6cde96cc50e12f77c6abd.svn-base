<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="http://large.tistory.com/attachment/cfile24.uf@2308843D537D64900C6363.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>



	<div align="center">
		<h1 align="center">boardList</h1>
		<table align="center" cellpadding="0" cellspacing="0" border="0"
			width="90%">
			<tr
				style="background: url('http://cfile23.uf.tistory.com/image/17466F3E50FD792A0AC4F3') repeat-x; text-align: center;">
				<td width="5"><img
					src="http://cfile24.uf.tistory.com/image/0246E73E50FD79290A761A"
					width="5" height="30" /></td>
				<td width="80">글번호</td>
				<td>제&nbsp;목</td>
				<td width="80">작성자</td>
				<td width="80">시&nbsp;&nbsp;간</td>
				<td width="80">조회수</td>
				<td width="7"><img
					src="http://cfile25.uf.tistory.com/image/1248543E50FD792A092352"
					width="5" height="30" /></td>
			</tr>
			<c:forEach items="${boards}" var="board" >
				<tr align="center" bgcolor="white">
					<td></td>
					<td width="80" height="25"><font size="2">${board.boardNumber}</font></td>
					<!-- 글번호 -->
					<td><a class="no-uline"
						href="boardContext.do?boardNumber=${board.boardNumber}"><font
							size="2">${board.title}</font></a></td>
					<!-- 제목 -->
					<td width="80"><font size="2">${board.userId }</font></td>
					<!-- 작성자 -->
					<td width="85"><font size="2">${board.qaDate }</font></td>
					<!-- 작성일 -->
					<td width="80"><font size="2">${board.hit}</font></td>
					<!-- 조회수 -->
					<td></td>
				</tr>
			</c:forEach>
			<tr height="1" bgcolor="#D2D2D2">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td align="right" colspan="3""><form action="myBoardList.do">
						<input type="hidden" name="userId" value="${users.userid }"><input type="button"
					onclick="document.location='boardWriteForm.do'" value="글쓰기"
					class="redBtn"><input
							type="submit" value="내글 목록" class="redBtn">
					</form> </td>
			</tr>

		</table>
		<br>
	</div>


</body>
</html>







