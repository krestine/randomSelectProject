<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="http://large.tistory.com/attachment/cfile24.uf@2308843D537D64900C6363.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">${errorMessage}</h1>
	<font size="2">
		<form action="login.do" method="post">
			<table align="center" border="0" cellpadding="0" cellspacing="0"
				bgcolor="white">
				<tr>
					<td><img
						src="http://cfile22.uf.tistory.com/image/2204FA50537C7EA0118329"></td>
					<td colspan="2"
						style="background: url('http://cfile24.uf.tistory.com/image/26456E50537C7EA1054717') repeat-x; text-align: center;"></td>
					<td><img
						src="http://cfile26.uf.tistory.com/image/270FB150537C7EA10F105C"></td>
				</tr>
				<tr>
					<td rowspan="3"
						style="background: url('http://cfile9.uf.tistory.com/image/21756050537C7E9F14A8FF') repeat-y; text-align: center;"></td>
					<td>ID</td>
					<td><input type="text" name="userid"></td>
					<td rowspan="3"
						style="background: url('http://cfile23.uf.tistory.com/image/2274F750537C7EA014CA2B') repeat-y; text-align: center;"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="로그인" class="redBtn"><input type="button"
						onclick="document.location='registerForm.do'" value="회원가입"
						class="redBtn"></td>
				</tr>
				<tr>
					<td><img
						src="http://cfile26.uf.tistory.com/image/2612E550537C7E9F2406E7"></td>
					<td colspan="2"
						style="background: url('http://cfile10.uf.tistory.com/image/25123550537C7E9F27D769') repeat-x; text-align: center;"></td>
					<td><img
						src="http://cfile1.uf.tistory.com/image/225B0650537C7EA018F4E6"></td>
				</tr>
			</table>
		</form>
	</font>
</body>
</html>
