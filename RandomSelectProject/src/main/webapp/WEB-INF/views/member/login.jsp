<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/myapp/resources/js/jquery.cookie.js"
	type="text/javascript"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>

<title>login.jsp</title>
<style type="text/css">
input.error {
	border: 1px dashed red;
}

label.error {
	display: block;
	/* 	margin-left: 10px; */
	color: red;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#rememId").click(function() {
			//쿠키정보가져오기 확인
			console.log($.cookie("cookieId"));

			if ($.cookie("cookieId") != null) {
				if (!$.cookie("cookieId").equals($('#memId').val())) {
					//쿠키정보지우기
					$.cookie("cookieId", null);
					//쿠키저장
					$.cookie('cookieId', $('#memId').val(), {
						expires : 7
					});
					console.log("cookieId=" + $('#memId').val());
				}
			} else {
				$('#memId').cookieFill();
				//쿠키정보가져오기 확인
				console.log($.cookie("cookieId"));
			}
		});

		// 				//쿠키 질문
		// 				function confirmSave(checkbox) {
		// 					var isRemember;
		// 					if (checkbox.checked) {
		// 						isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까?");
		// 						if (!isRemember) {
		// 							checkbox.checked = false;
		// 						}
		// 					}
		// 				}
		// 				//뭘 언제까지 저장할지 정해주는것
		// 				function setSave(name, value, expiredays) {
		// 					var today = new Date();
		// 					today.setDate(today.getDate() + expiredays);
		// 					document.cookie = name + "=" + escape(value)
		// 							+ ";path=/;expires=" + today.toGMTString() + ";"
		// 				}
		// 				//저장할 아이디
		// 				function saveLogin(memId) {
		// 					if (memId != "") {
		// 						//3일동안 쿠키값저장
		// 						setSave("cookieId", memId, 3);
		// 					} else {
		// 						setSave("cookieId", memId, -1);
		// 					}
		// 				}
		// 				//쿠키아이디 가져오기
		// 				function getLogin() {
		// 					var cook = document.cookie + ";";
		// 					var idx = cook.indexOf(key, 0);
		// 					var val = "";
		// 					if (idx != -1) {
		// 						cook = cook.substring(idx, cook.length);
		// 						begin = cook.indexOf("=", 0) + 1;
		// 						end = cook.indexOf(";", begin);
		// 						val = unescape(cook.substring(begin, end));
		// 					}
		// 					if (val != "") {
		// 						document.form.id.value = memId;
		// 						document.form.rememId.checked = true;
		// 					}
		// 				}

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
				// 	if (form.rememId.checked) {
				// 					saveLogin(form.memId.value);
				// 				} else {
				// 					saveLogin("");
				// 				}
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
	<div align="center" class="col-lg-10">
		<form role="form" id="loginForm" action="loginProc.do" method="post">
			<div class="form-group">
				<input type="text" id="memId" name="memId" placeholder="아이디">
			</div>

			<div class="form-group">
				<input type="password" id="memPasswd" name="memPasswd"
					placeholder="비밀번호">
			</div>

			<div class="form-group">
				<input type="checkbox" id="rememId" name="rememId">아이디기억 <input
					type="submit" id="loginbtn" class="btn btn-success btn-sm"
					value="로그인">
			</div>
			<div class="form-group">
				<label class="error" id="inputCheck" style="color: red">
					${errmessage}</label> <label class="error" id="inputCheck"
					style="color: blue"> ${sMsg}</label>
			</div>
			<div>
				<a href="findIdForm.do">아이디/비밀번호 찾기</a>
			</div>
		</form>
	</div>
</body>
</html>