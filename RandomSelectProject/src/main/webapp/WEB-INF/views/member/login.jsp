<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#login').click(
						function() {
							if ($('#memId').val() == ""
									|| $('#memPasswd').val() == "") {
								$('#inputCheck').text("아이디와 비밀번호를 입력해주세요.");
								return false;
							} else {
								$.ajax({
									cache : false,
									async : false,
									type : 'POST',
									url : "loginCheck.do",
									data : 'memId=' + $('#memId').val()
											+ '&memPasswd='
											+ $('#memPasswd').val(),
									dataType : 'xml',
									error : function() {
										$('#inputCheck').text("데이터 안넘어감");
									},
									success : function(xml) {
										var result = $(xml).find('check')
												.text();
										if (result.trim() == 'true') {
											$('#loginForm').submit();
											result = 'false';
										} else {
											$('#inputCheck').text(
													"다시 확인 후 입력해주세요.");
											result = 'true';
										}
									}
								});
							}
						});
			});
</script>
</head>
<body>
	${errmessage}
	<form id="loginForm" action="loginProc.do" method="post">
		<div>
			아이디 <input type="text" id="memId" name="memId">
		</div>

		<div>
			비밀번호 <input type="password" id="memPasswd" name="memPasswd">
		</div>

		<div>
			<input type="checkbox" name="rememId">아이디기억 <input
				type="submit" id="login" value="로그인">
		</div>
		<div>
			<label id="inputCheck" style="color: red"></label>
		</div>
		<div>
			<a href="findIdForm.do">아이디/비밀번호 찾기</a>
		</div>
	</form>

</body>
</html>