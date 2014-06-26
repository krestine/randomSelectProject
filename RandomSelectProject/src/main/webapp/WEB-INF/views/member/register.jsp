<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register.jsp</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
	$(function() {
		$("#memBirth").datepicker(
				{
					changeMonth : true,
					changeYear : true,
					dateFormat : 'yy-mm-dd',
					yearRange : '1900:*',
					monthNamesShort : [ '1월(JAN)', '2월(FEB)', '3월(MAR)',
							'4월(APR)', '5월(MAY)', '6월(JUN)', '7월(JUL)',
							'8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)',
							'12월(DEC)' ]
				});
	});

	function formCheck() {
		var mM1 = document.getElementById('mM1');
		var mM2 = document.getElementById('mM2');
		var mM3 = document.getElementById('mM3');
		var mMT = mM1.value + "-" + mM2.value + "-" + mM3.value;
		document.form.memMobile.value = mMT.value;
		join();
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
				<td><input type="text" id="memBirth" name="memBirth"></td>
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