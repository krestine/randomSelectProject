<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>myInfo.jsp</title>
</head>
<body>
	아이디 : ${userInfo.memId} 이름 : ${userInfo.memName} 등급 :
	${userInfo.memGrade}

	<form action="/myInfoProc.do" method="post">
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			bgcolor="white">
			<tr>
				<td>현재비밀번호</td>
				<td><input type="password" name="memPasswd"></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="tempPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" name="tempPw2"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="memMobile"></td>
			</tr>
			<tr>
				<td><input type="submit" value="정보수정"></td>
				<td><input type="button" value="회원탈퇴" onclick="/dropForm.do"></td>
		</table>
	</form>
</body>
</html>