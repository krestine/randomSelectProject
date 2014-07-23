<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
input.error {
	border: 1px dashed red;
}

label.error {
	/* 	margin-left: 10px; */
	display: block;
	color: red;
}

/* This parent can be any width and height */
.block {
	text-align: center;
	/* 	background: #ccc; */
	margin-bottom: 10px;
}

/* The ghost, nudged to maintain perfect centering */
.block:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -0.25em; /* Adjusts for spacing */
}

/* The element to be centered, can
   also be of any width and height */
.centered {
	display: inline-block;
	vertical-align: middle;
	width: 300px;
}
 html { 
 	height: 100%; 
 	margin: 0; 
 	padding: 0; 
 }

 body,.container {
 	height: 100%;
 	margin: 0; 
	padding: 0; 
 } 
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						form_wrapper = $('.modifyBox');
						//비밀번호 변경폼보이기
						$("#pwCheck_form").hide();
						$("button#changeInfo").click(function() {
							// 							if ($(".linkBox").css("display") == "none") {
								$("#pwCheck_form").toggle();
						});

						//tab으로 비밀번호변경,전화번호변경
						$('#changeFormTab a').click(function(e) {
							e.preventDefault();
							$(".infoChangBox").show();

							// 							$("#pwChange_form").show();
							// 							$(this).tab('show');
							$(".tab-content").tab('show');

						});

						
						//현재비밀번호 확인 ajax
						$('#pwCheck_btn')
								.click(
										function() {
											if ($('#prePasswd').val() == '') {
												$('#pwCheckMsg')
														.html(
																'<font color=red>비밀번호를 입력해주세요.</font>');
											} else {
												$
														.ajax({
															cache : false,
															async : false,
															type : 'POST',
															url : 'pwInfoCheck.do',
															data : 'memPasswd='
																	+ $(
																			'#prePasswd')
																			.val(),
															dataType : 'xml',
															error : function() {
																alert("error");
															},
															success : function(
																	xml) {
																var result = $(
																		xml)
																		.find(
																				'check')
																		.text();
																if (result
																		.trim() == 'true') {
																	//toggle로 div나누기 
																	$(
																			form_wrapper
																					.find('form:visible'))

																			.fadeOut(
																					400,
																					function() {
																						form_wrapper
																								.stop()
																								.animate(
																										50,
																										function() {
																										});
																						$(
																								'#pwChange_form')
																								.toggle();
																						$(
																								'.dropdown')
																								.toggle();
																						$(
																								'#changeInfo')
																								.hide();
																					});
																} else {
																	$(
																			'#pwCheckMsg')
																			.html(
																					'<font color=red>비밀번호가 일치하지 않습니다.</font>');
																}
															}
														});
											}
										});

						//비밀번호 변경폼 유효성검사
						$("#pwChange_form").validate({
							rules : {
								tempPw : {
									required : true,
									minlength : 6
								},
								tempPw2 : {
									required : true,
									equalTo : "#tempPw"
								}
							},
							messages : {
								tempPw : {
									required : "비밀번호를 입력해주세요.",
									minlength : "6자이상 입력해주세요."
								},
								tempPw2 : {
									required : "비밀번호 확인을 입력해주세요.",
									equalTo : "비밀번호가 일치하지 않습니다."
								}
							}
						});

						//전화번호 변경폼 유효성검사
						$("#mobileChange_form").validate({
							rules : {
								memMobile : {
									required : true,
									mobileCheck : true
								}
							},
							messages : {
								memMobile : {
									required : "전화번호를 입력해주세요.",
									mobileCheck : "'010-1234-1234'형식으로 입력해주세요."
								}
							},
							submitHandler : function(form) {
								$(form).Submit();
							}
						});

						//전화번호검사
						jQuery.validator
								.addMethod(
										'mobileCheck',
										function() {
											var result = true;
											var mobile = $('#memMobile').val();
											var regex_mobile = /[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g;
											if (!regex_mobile.test(mobile)) {
												return false;
											}
											return result;
										});
						//엔터키 방지 
						$('#pwCheck_form')
								.bind(
										"keyup keypress",
										function(e) {
											var code = e.keyCode || e.which;
											if (code == 13) {
												e.preventDefault();
												$('#pwCheckMsg')
														.html(
																'<font color=red>enter입력금지</font>');
												return false;
											}
										});
					});
</script>
<title>myInfo.jsp</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<img
				src="/myapp/resources/img/myinfo.png" style="width: 100%;"></a>
		</div>
	</div>
	<table align=center>
		<tr>
			<td>아이디</td>
			<td>:&nbsp;&nbsp;</td>
			<td>${sessionScope.loginUser.memId}</td>
		</tr>
		<tr>
			<td>이&nbsp;&nbsp;름&nbsp;</td>
			<td>:&nbsp;&nbsp;</td>
			<td>${myInfo.memName}</td>
		</tr>
		<tr>
			<td>등&nbsp;&nbsp;급&nbsp;</td>
			<td>:&nbsp;&nbsp;</td>
			<td>${myInfo.memGrade}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>:&nbsp;&nbsp;</td>
			<td>${myInfo.memMobile}</td>
		</tr>
		<tr>
			<td colspan=3 align=center><font color=blue> ${sMsg}</font></td>
		</tr>
	</table>

	<div class="block" style="margin-top: 10px;">
		<div class="centered">
			<button id="changeInfo" class="btn btn-info btn-sm">내정보 변경</button>
		</div>

		<div class="modifyBox" style="margin-top: 10px;">
			<form id="pwCheck_form" action="" method="post" style="display: none">
				<div>
					<input type="password" id="prePasswd" name="memPasswd"
						placeholder="현재&nbsp;비밀번호">
				</div>
				<div>
					<label id="pwCheckMsg"></label>
				</div>
				<div>
					<input type="button" class="btn btn-primary btn-sm"
						id="pwCheck_btn" value="비밀번호 확인">
				</div>
			</form>

			<div class="block">
				<div class="centered" style="align: center; position: static;">
					<div class="dropdown" style="display: none">
						<div style="position: relative; left: 55px;">
							<ul class="nav nav-tabs" id="changeFormTab">
								<li class="active"><a href="#pane1" data-toggle="tab">비밀번호
										변경</a></li>
								<li><a href="#pane2" data-toggle="tab">전화번호 변경</a></li>
							</ul>
						</div>
					</div>
				</div>


				<div class="infoChangeBox">
					<div class="tab-content">

						<div class="tab-pane active" id="pane1">
							<div class="form-group">
								<form id="pwChange_form" action="passwordProc.do" method="post"
									style="display: none">
									<div class="form-group"></div>
									<div class="form-group">
										<input type="password" id="tempPw" name="tempPw"
											placeholder="새&nbsp;비밀번호">
									</div>
									<div class="form-group">
										<input type="password" id="tempPw2" name="tempPw2"
											placeholder="새&nbsp;비밀번호&nbsp;확인">
									</div>
									<div>
										<label id="infoErrorMsg" style="color: red"></label>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-warning btn-sm"
											value="새 비밀번호로 로그인">
									</div>
								</form>
							</div>
						</div>

						<div class="tab-pane" id="pane2">
							<form id="mobileChange_form" action="mobileProc.do" method="post"
								style="display: block">
								<div class="form-group"></div>
								<div class="form-group">
									<input type="text" id="memMobile" name="memMobile"
										placeholder="전화번호"> <label id="mobileErrorMsg"
										style="color: red"></label>
								</div>

								<div class="form-group">
									<input type="submit" class="btn btn-success btn-sm"
										value="전화번호 변경">
								</div>
							</form>
						</div>


					</div>
				</div>

			</div>
		</div>


		<div class="centered">
			<a href="dropForm.do">회원탈퇴</a>
		</div>
	</div>
</body>
</html>