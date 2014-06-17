<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1 align="center">boardWriteForm</h1>
		<table border="0" width="90%" align="center">
			<form action="boardWrite.do" method="post">
				
				
				
				 <input type="hidden" name="userId" value=${users.userid }>
				
				
				<tr>
					<td align="center" width="120">제&nbsp;&nbsp;&nbsp;목</td>
					<td><input type="text" name="title" size="20"
						style="width: 90%" maxlength="50"/></td>
				</tr>
				<tr>
					<td align="center">글내용</td>
					<td>
					
					
					
					<textarea  name="qaContext"
							style="resize: none; width: 90%; height: 400px"
							placeholder="본문 내용을 입력하세요."></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td align="right"><input type="submit" value="작성완료"> <input
						type="button" value="취소"
						onclick="document.location='boardList.do'"></td>
				</tr>
			</form>
		</table>
	</div>
	<br>
	<br>

</body>
</html>