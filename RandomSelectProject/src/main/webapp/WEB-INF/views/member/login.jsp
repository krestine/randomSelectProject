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
		//쿠키값불러오기
		var remember = $.cookie("remember");
		if (remember == 'true') {
			var cookieId = $.cookie("cookieId");
			$('#memId').attr("value", cookieId);
			$("#rememId").attr("checked", true);
		}
		// 		//아이디기억체크박스
		// 		$("#rememId").click(function() {
		// 			var isChecked = $("#rememId").prop('checked');
		// 			// 			if ($(this).is(':checked')) {
		// 			if (isChecked) {
		// 				var memId = $('#memId').val();
		// 				//쿠키저장
		// 				$.cookie("cookieId", memId, {
		// 					expire : 7
		// 				});
		// 				$.cookie("remember", true, {
		// 					expires : 7
		// 				});
		// 				$('#inputCheck').text("아이디가 저장됩니다.");
		// 				setTimeout(function() {
		// 					$('#inputCheck').hide();
		// 				}, 3000);
		// 			} else {
		// 				//쿠키지움
		// 				$.cookie("cookieId", null);
		// 				$.cookie("remember", false);
		// 			}
		// 			alert($.cookie("cookieId"));
		// 		});
		//유효성검사
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
				//아이디기억체크박스
				var isChecked = $("#rememId").prop('checked');
				// 			if ($(this).is(':checked')) {
				if (isChecked) {
					var memId = $('#memId').val();
					//쿠키저장
					$.cookie("cookieId", memId, {
						expire : 7
					});
					$.cookie("remember", true, {
						expires : 7
					});
					$('#inputCheck').text("아이디가 저장됩니다.");
					setTimeout(function() {
						$('#inputCheck').hide();
					}, 3000);
				} else {
					//쿠키지움
					$.cookie("cookieId", null);
					$.cookie("remember", false);
				}
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
	<div class="row">
		<div class="col-md-12">
			<a href="mateListProc.do"><img
				src="/myapp/resources/img/aboutUser.png" style="width: 100%;"></a>
		</div>
	</div>
	<div align="center">
		<label style="color: blue"> ${sMsg}</label>
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
					type="submit" id="loginbtn" class="btn btn-primary btn-sm"
					value="로그인">
			</div>
			<div class="form-group">
				<label class="error" id="inputCheck" style="color: red">
					${errmessage}</label>
			</div>
			<div>
				<a href="findIdForm.do">아이디/비밀번호 찾기</a>
			</div>
		</form>
	</div>
</body>
</html>