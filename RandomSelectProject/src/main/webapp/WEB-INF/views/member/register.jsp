<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register.jsp</title>
<script type="text/javascript">
	function formCheck() {
		var mM1 = document.getElementById('mM1');
		var mM2 = document.getElementById('mM2');
		var mM3 = document.getElementById('mM3');
		var mMT = mM1.value + "-" + mM2.value + "-" + mM3.value;
		document.form.memMobile.value = mMT.value;
		return join();
	}
	function join() {
		var proc = document.getElementById('form');
		proc.submit();
	}
</script>
</head>
<body>
	${errmessage}
	<form action="registerProc.do" id="form" method="post">
		<table align="center" border="0" cellpadding="0" cellspacing="0"
			bgcolor="white">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memId"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="memName"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memPasswd"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="memPasswdCheck"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="memBirth"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><select id="mM1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" id="mM2" size="4" maxlength="4"> - <input
					type="text" id="mM3" size="4" maxlength="4"> <input
					type="hidden" name="memMobile" id="memMobile" value="${mMT}"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="javascript:formCheck()"
					value="회원가입"></td>
			</tr>

		</table>
	</form>
</body>
</html>