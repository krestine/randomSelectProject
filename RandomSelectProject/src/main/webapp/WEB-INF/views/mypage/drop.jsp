<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drop.jsp</title>
</head>
<body>
	<form action="dropProc.do" method="post">
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			bgcolor="white">

			<tr>
				<td>탈퇴사유</td>
				<td><input type="text" name="leaveReason"></td>
			</tr>

			<tr>
				<td><input type="submit" value="회원탈퇴"></td>
		</table>
</body>
</html>