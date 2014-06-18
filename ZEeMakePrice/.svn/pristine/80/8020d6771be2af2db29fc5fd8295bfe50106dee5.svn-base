<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1 align="center">boardUpdateForm</h1>
		<form action="boardUpdate.do" method="post">
			<input type="hidden" name="boardNumber" value="${board.boardNumber}">
			<table border="0" width="90%" align="center">

				

				<tr>

					<td align="center" width="120">제&nbsp;&nbsp;&nbsp;목</td>
					<td><input type="text" name="title" size="20"
						style="width: 90%" maxlength="50" value="${board.title }" /></td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td><textarea name="qaContext"
							style="resize: none; width: 90%; height: 400px">${board.qaContext }</textarea></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="수정 완료">
						<input type="button" value="취소"
						onclick="document.location='boardList.do'"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>