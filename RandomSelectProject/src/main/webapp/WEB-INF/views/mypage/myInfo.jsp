<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<style type="text/css">
input.error {
	border: 1px dashed red;
}

label.error {
	margin-left: 10px;
	color: red;
}

.div_tb {
	position: relative;
	/* 	margin-left: 50%; */
	left: 50%;
	width: 300px;
	height: 100px;
	text-align: center;
	display: table;
	width: 50%;
}

.div_tr {
	display: table-row;
}

.div_tc {
	display: table-cell;
	margin: 5px;
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
							if ($(".dropdown").css("display") == "none") {
								$("#pwCheck_form").toggle();
							}
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

					});
</script>
<title>myInfo.jsp</title>
</head>
<body>
	<div class="div_tb">
		<form>
			<div class="div_tr">
				<div class="div_tc">아이디</div>
				<div class="div_tc">&nbsp;:&nbsp;&nbsp;</div>
				<div class="div_tc">${sessionScope.loginUser.memId}</div>
			</div>
			<div class="div_tr">
				<div class="div_tc">이&nbsp;&nbsp;름</div>
				<div class="div_tc">&nbsp;:&nbsp;&nbsp;</div>
				<div class="div_tc">${myInfo.memName}</div>
			</div>
			<div class="div_tr">
				<div class="div_tc">등&nbsp;&nbsp;급</div>
				<div class="div_tc">&nbsp;:&nbsp;&nbsp;</div>
				<div class="div_tc">${myInfo.memGrade}</div>
			</div>
			<div class="div_tr">
				<div class="div_tc">전화번호</div>
				<div class="div_tc">&nbsp;:&nbsp;&nbsp;</div>
				<div class="div_tc">${myInfo.memMobile}</div>
			</div>
			<div class="div_tr">
				<div>
					<label style="color: blue"> ${sMsg}</label>
				</div>
			</div>
		</form>

		<button id="changeInfo" class="btn btn-info btn-sm">내정보 변경</button>

		<div class="modifyBox">
			<form id="pwCheck_form" action="" method="post" style="display: none">
				<div>현재비밀번호</div>
				<div>
					<input type="password" id="prePasswd" name="memPasswd">
				</div>
				<div>
					<label id="pwCheckMsg"></label>
				</div>
				<div>
					<input type="button" class="btn btn-primary btn-sm"
						id="pwCheck_btn" value="비밀번호 확인">
				</div>
			</form>

			<div class="tabtable">
				<div class="dropdown" style="display: none">
					<ul class="nav nav-tabs" id="changeFormTab">
						<!-- 				<li class="active"><a href="#pwChange_form" data-toggle="tab">비밀번호 -->
						<!-- 						변경</a></li> -->
						<!-- 				<li><a href="#mobileChange_form" data-toggle="tab">전화번호 변경</a></li> -->
						<li class="active"><a href="#pane1" data-toggle="tab">비밀번호
								변경</a></li>
						<li><a href="#pane2" data-toggle="tab">전화번호 변경</a></li>
					</ul>
				</div>


				<div class="infoChangeBox">
					<div class="tab-content">


						<div class="tab-pane active" id="pane1">
							<form id="pwChange_form" action="passwordProc.do" method="post"
								style="display: none">

								<div>새 비밀번호</div>
								<div>
									<input type="password" id="tempPw" name="tempPw">
								</div>
								<div>새 비밀번호 확인</div>
								<div>
									<input type="password" id="tempPw2" name="tempPw2">
								</div>
								<div>
									<label id="infoErrorMsg" style="color: red"></label>
								</div>
								<div>
									<input type="submit" class="btn btn-warning btn-sm"
										value="새 비밀번호로 로그인">
								</div>
							</form>
						</div>


						<div class="tab-pane" id="pane2">
							<form id="mobileChange_form" action="mobileProc.do" method="post"
								style="display: block">
								<div>전화번호</div>
								<div>
									<input type="text" id="memMobile" name="memMobile"
										placeholder="${myInfo.memMobile}">
								</div>
								<div>
									<label id="mobileErrorMsg" style="color: red"></label>
								</div>
								<div>
									<input type="submit" class="btn btn-success btn-sm"
										value="전화번호 변경">
								</div>
							</form>
						</div>


					</div>
				</div>

			</div>
		</div>


		<div>
			<a href="dropForm.do">회원탈퇴</a>
		</div>
	</div>

</body>
</html>