<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<title>login.jsp</title>
<style type="text/css">
input.error {
	border: 1px dashed red;
}

label.error {
	margin-left: 10px;
	color: red;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginForm").validate({
			onkeyup : false,
			onfocusout : false,
			rules : {
				memId : {
					required : true,
					email : true
				},
				memPasswd : {
					required : true,
					minlength : 4
				}
			},
			messages : {
				memId : {
					required : "아이디를 입력해주세요",
					email : "이메일 형식으로 써주세요."
				},
				memPasswd : {
					required : "비밀번호를 입력해주세요.",
					minlength : "4자이상 입력해주세요."
				}
			},
			submitHandler : function(form) {
				$(form).submit();
			}
		});

		/* 	$('#loginbtn').click(
						function() {
							if ($('#memId').val() == "") {
								$('#inputCheck').text("아이디를 입력해주세요.");
								return false;
							} else if ($('#memPasswd').val() == "") {
								$('#inputCheck').text("비밀번호를 입력해주세요.");
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
										$('#inputCheck').attr("데이터 안넘어감");
									},
									success : function(xml) {
										var result = $(xml).find('check')
												.text();
										alert(result);
										if (result.trim() == 'false') {
											$('#inputCheck').text(
													"다시 확인 후 입력해주세요.");
											return false;
										} else {
											$('#loginForm').submit();
										}
									}
								});
							}
						}); */
	});
</script>
</head>
<body>

	<form id="loginForm" action="loginProc.do" method="post">
		<div>
			아이디 <input type="text" id="memId" name="memId">
		</div>

		<div>
			비밀번호 <input type="password" id="memPasswd" name="memPasswd">
		</div>

		<div>
			<input type="checkbox" name="rememId">아이디기억 <input
				type="submit" id="loginbtn" value="로그인">
		</div>
		<div>
			<label class="error" id="inputCheck" style="color: red">
				${errmessage}</label> <label class="error" id="inputCheck"
				style="color: blue"> ${sMsg}</label>
		</div>
		<div>
			<a href="findIdForm.do">아이디/비밀번호 찾기</a>
		</div>
	</form>

</body>
</html>