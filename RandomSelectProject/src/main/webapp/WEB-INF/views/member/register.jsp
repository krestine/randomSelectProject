<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register.jsp</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<!--validate plugin  -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>

<!-- <script src="./js/ajaxValidate.js" type="text/javascript"></script> -->
<script src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
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
	/* var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; */
	/* 	 
	 $('#memId').blur(
	 function() {
	 $.ajax({
	 type : 'POST',
	 url : 'idCheck.do',
	 data : 'xml',
	 success : function(xml) {
	 var result = $(xml).find('idCheck').text();
	 if (result == 'true') {
	 $('#idCheck').text('사용할 수 있는 아이디입니다.');
	 $('#join').removeAttr('disabled');
	 } else {
	 $('#idCheck').text('사용할 수 없는 아이디입니다.');
	 $('#join').removeAttr('disabled',
	 'disabled').focus();
	 }
	 }
	 });
	 }); */
	$(document)
			.ready(
					function() {
						var cd = "${cfCD}";
						// 달력
						$("#memBirth").datepicker(
								{
									changeMonth : true,
									changeYear : true,
									dateFormat : 'yy-mm-dd',
									yearRange : '1900:*',
									monthNamesShort : [ '1월(JAN)', '2월(FEB)',
											'3월(MAR)', '4월(APR)', '5월(MAY)',
											'6월(JUN)', '7월(JUL)', '8월(AUG)',
											'9월(SEP)', '10월(OCT)', '11월(NOV)',
											'12월(DEC)' ]
								});

						// 중복아이디체크
						jQuery.validator
								.addMethod(
										'idCheck',
										function() {
											//$('#idCheck')	.click(function() {
											$('#check').html(
													'<font color=blue></font>');
											$('#check').hide();
											var result = true;
											var memId = $('#memId').val();
											var reg_email = /^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i;
											if (memId == "") {
												alert("빈칸");
												return result;
											} else if (!(reg_email.test(memId))) {
												alert("틀림");
												$('#memId').val("");
												$('#memId').focus();
												return result;
											} else {
												$
														.ajax({
															cache : false,
															async : false,
															type : "POST",
															data : "memId="
																	+ memId,
															url : "idCheck.do",
															datatype : 'xml',
															success : function(
																	xml) {
																var msg = $(xml)
																		.find(
																				'check')
																		.text();
																if (msg.trim() == 'true') {
																	if ($(
																			'#memId')
																			.val() == '') {
																		$(
																				'#check')
																				.hide();
																	} else {

																		$(
																				'#check')
																				.html(
																						'<font color=blue>사용할 수 있는 아이디입니다.</font>');
																		$(
																				'#check')
																				.show();
																		result = 'false';
																	}
																} else {
																	if ($(
																			'#memId')
																			.val() == '') {
																		$(
																				'#check')
																				.hide();
																	} else {
																		$(
																				'#check')
																				.html(
																						'<font color=red>사용할 수 없는 아이디입니다.</font>');
																		$(
																				'#check')
																				.show();
																		$(
																				'#memId')
																				.val(
																						"");
																		$(
																				'#memId')
																				.focus();
																		result = 'true';
																	}
																}
															},
															error : function() {
																alert("재시도하세요")
															}
														});
												return result;
											}
										});

						//이메일 인증 ajax
						$('#emailCertify_btn')
								.click(
										function() {
											var memId = $('#memId').val();
											if (memId == "") {
												alert("빈칸");
												$('#certify')
														.html(
																'<font color=red>이메일을 확인해주세요.</font>');

											} else {
												$
														.ajax({
															cache : false,
															async : false,
															type : "POST",
															data : "memId="
																	+ memId,
															url : "emailCertifyProc.do",
															datatype : 'xml',
															success : function(
																	xml) {
																var result = $(
																		xml)
																		.find(
																				'checkCertify')
																		.text();
																if (result
																		.trim() == 'true') {
																	var cfCD = $(
																			xml)
																			.find(
																					"cfCD")
																			.text();
																	// 																	console.log(cfCD);
																	$(
																			"#certifyCD")
																			.val(
																					cfCD);
																	// 																	console.log($("#certifyCD").val());
																	$(
																			'#certify')
																			.html(
																					'<font color=blue>입력하신 메일로 인증번호가 발송되었습니다.</font>');
																} else {
																	alert("error");
																	$(
																			'#certify')
																			.html(
																					'<font color=red>인증번호를 재발급해주세요.</font>');
																}
															},
															error : function() {
																alert("재시도하세요")
															}
														});
											}
										});

						// 회원가입 체크
						$("#register_form")
								.validate(
										{
											//onkeyup : false,
											//onfocusout : false,
											//focusInvalid : false,
											//focusCleanup:true,
											//ignore : '#memId',

											// 											groups : {
											// 												phoneGroup : "mPhoneCode mPhoneMid mPhoneEnd"
											// 											},

											rules : {
												memId : {
													required : true,
													email : true,
													idCheck : true
												},
												inputCD : {
													required : true,
													equalTo : "#certifyCD"
												},
												memName : {
													required : true,
													minlength : 2,
													nameCheck : true
												},
												memPasswd : {
													required : true,
													minlength : 6
												},
												memPasswdCheck : {
													required : true,
													equalTo : "#memPasswd"
												},
												memBirth : "required",
												// 												mPhoneCode : {
												// 													required : true,
												// 													number : true
												// 												},
												// 												mPhoneMid : {
												// 													required : true,
												// 													number : true
												// 												},
												// 												mPhoneEnd : {
												// 													required : true,
												// 													number : true
												// 												}
												// 												,
												// 												phoneGroup : {
												// 													required : true,
												// 													number : true,
												// 													mobileCheck : true
												// 												}

												memMobile : {
													required : true,
													mobileCheck : true
												}
											},
											errorPlacement : function(error,
													element) {
												if (element.attr("id") == "mPhoneCode"
														|| element.attr("id") == "mPhoneMid"
														|| element.attr("id") == "mPhoneEnd") {
													error
															.insertAfter("#mPhoneEnd");
												} else {
													error.insertAfter(element);
												}
											},

											messages : {
												memId : {
													required : "아이디를 입력해주세요",
													email : "이메일 형식으로 써주세요.",
													idCheck : "이메일 형식으로 써주세요."
												},
												inputCD : {
													required : "인증번호를 입력해주세요.",
													equalTo : "인증번호가 일치하지 않습니다."
												},
												memName : {
													required : "이름을 입력해주세요.",
													minlength : "2자이상 입력해주세요.",
													nameCheck : "한글로 써주세요."
												},
												memPasswd : {
													required : "비밀번호를 입력해주세요.",
													minlength : "6자이상 입력해주세요."
												},
												memPasswdCheck : {
													required : "비밀번호 확인을 입력해주세요.",
													equalTo : "비밀번호가 일치하지 않습니다."
												},
												memBirth : "생일을 입력해주세요.",
												// 												mPhoneCode : {
												// 													required : "전화번호를 입력해주세요.",
												// 													number : "숫자를 입력해주세요."
												// 												},
												// 												mPhoneMid : {
												// 													required : "전화번호를 입력해주세요.",
												// 													number : "숫자를 입력해주세요."
												// 												},
												// 												mPhoneEnd : {
												// 													required : "전화번호를 입력해주세요.",
												// 													number : "숫자를 입력해주세요."
												// 												},
												// 												phoneGroup : {
												// 													required : "전화번호를 입력해주세요.",
												// 													number : "숫자를 입력해주세요.",
												// 													mobileCheck : "'010-1234-1234'형식으로 입력해주세요."
												// 												}
												memMobile : {
													required : "전화번호를 입력해주세요.",
													mobileCheck : "'010-1234-1234'형식으로 입력해주세요."
												}
											},
											submitHandler : function(form) {
												$(form).ajaxSubmit();
											},
											success : function(xml) {
											}
										});
						//이름 검사
						jQuery.validator.addMethod('nameCheck',
								function(value) {
									var result = true;
									var regex_name = /^[가-힣]+$/;
									if (!(regex_name.test(value))) {
										return false;
									}
									return result;
								}, '');
						//전화번호검사
						jQuery.validator
								.addMethod(
										'mobileCheck',
										function() {
											// 											var mobile = $('#mPhoneCode').val()
											// 													+ "-"
											// 													+ $('#mPhoneCode').val()
											// 													+ "-"
											// 													+ $('#mPhoneCode').val();
											// 											var regex_mobile = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
											// 											if (!regex_mobile.test(mobile)) {
											// 												return false;
											// 											}
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
</head>
<body>



	<form id="register_form" method="post" action="registerProc.do">

		<div>
			아이디 <input type="text" id="memId" name="memId" class="signup" />
			<!-- <button type="button" id="idCheck">중복체크</button> -->
			<span id="check"></span>
		</div>

		<div>
			<button type="button" id="emailCertify_btn">인증번호전송</button>
		</div>
		<div>
			인증번호 <input type="text" id="inputCD" name="inputCD" class="signup" />
		</div>
		<div>
			<input type="hidden" id="certifyCD" name="certifyCD" class="signup"></input>
			<span id="certify"></span>
		</div>

		<div>
			이름 <input type="text" name="memName" class="signup" />
		</div>
		<div>
			비밀번호 <input type="password" id="memPasswd" name="memPasswd"
				class="signup" />
		</div>
		<div>
			비밀번호확인 <input type="password" name="memPasswdCheck" class="signup" />
		</div>
		<div>
			생년월일 <input type="text" id="memBirth" name="memBirth" class="signup"
				readonly="readonly" />
		</div>
		<!-- 		<div class="signup"> -->
		<!-- 			전화번호 <select id="mPhoneCode" name="mPhoneCode"> -->
		<!-- 				<option value="010" selected>010</option> -->
		<!-- 				<option value="011">011</option> -->
		<!-- 				<option value="016">016</option> -->
		<!-- 				<option value="017">017</option> -->
		<!-- 				<option value="018">018</option> -->
		<!-- 				<option value="019">019</option> -->
		<!-- 			</select> - <input type="text" id="mPhoneMid" name="mPhoneMid" size="4" -->
		<!-- 				maxlength="4" /> - <input type="text" id="mPhoneEnd" -->
		<!-- 				name="mPhoneEnd" size="4" maxlength="4" /> -->
		<!-- 		</div> -->
		<div>
			전화번호 <input type="text" id="memMobile" name="memMobile">
		</div>

		<div>${errmessage}</div>

		<div>
			<input type="submit" id="register" value="회원가입">
		</div>
	</form>


</body>
</html>
