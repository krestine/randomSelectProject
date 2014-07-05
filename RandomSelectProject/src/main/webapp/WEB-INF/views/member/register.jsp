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
<!-- <script src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script> -->
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
						$('#idCheck')
								.click(
										function() {
											var memId = $('#memId').val();
											if (memId == "") {
												$('#check')
														.html(
																'<font color=red>아이디를 입력해주세요.</font>');

												$('#check').show();
												$('#memId').focus();
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
																	$('#check')
																			.html(
																					'<font color=blue>사용할 수 있는 아이디입니다.</font>');
																	$('#check')
																			.show();
																	result = 'false';

																} else {
																	$('#check')
																			.html(
																					'<font color=red>사용할 수 없는 아이디입니다.</font>');
																	$('#check')
																			.show();
																	$('#memId')
																			.val(
																					"");
																	$('#memId')
																			.focus();
																	result = 'true';
																}
															},
															error : function() {
																alert("재시도하세요")
															}
														});
												return result;
											}
										});

						// 회원가입 체크
						$("#registerForm").validate({
							onkeyup : false,
							onfocusout : false,
							//focusInvalid : false,
							//focusCleanup:true,
							groups : {
								phoneGroup : "mPhoneCode mPhoneMid mPhoneEnd"
							},
							rules : {
								memId : {
									required : true,
									email : true
								/* remote : {
											url : "idCheck.do",
											type : "POST",
											data : {
												memId : function() {
													return $("#memId").val();
												}
											} 
										}*/
								},
								memName : {
									required : true,
									minlength : 2
								},
								memPasswd : {
									required : true,
									minlength : 4
								},
								memPasswdCheck : {
									required : true,
									equalTo : "#memPasswd"
								},
								memBirth : "required",
								mPhoneCode : {
									required : true,
									number : true
								},
								mPhoneMid : {
									required : true,
									number : true
								},
								mPhoneEnd : {
									required : true,
									number : true
								}

							},

							messages : {
								memId : {
									required : "아이디를 입력해주세요",
									email : "이메일 형식으로 써주세요.",
									remote : "사용할수 없는 이메일입니다."
								},
								memName : {
									required : "이름을 입력해주세요.",
									minlength : "2자이상 입력해주세요."
								},
								memPasswd : {
									required : "비밀번호를 입력해주세요.",
									minlength : "4자이상 입력해주세요."
								},
								memPasswdCheck : {
									required : "비밀번호 확인을 입력해주세요.",
									equalTo : "비밀번호가 일치하지 않습니다."
								},
								memBirth : "생일을 입력해주세요.",
								mPhoneCode : {
									required : "전화번호를 입력해주세요.",
									number : "숫자를 입력해주세요."
								},
								mPhoneMid : {
									required : "전화번호를 입력해주세요.",
									number : "숫자를 입력해주세요."
								},
								mPhoneEnd : {
									required : "전화번호를 입력해주세요.",
									number : "숫자를 입력해주세요."
								}
							},
							submitHandler : function(form) {
								$(form).ajaxSubmit();
							},
							success : function(xml) {
							}
						});
					});

	 
	 
	function action() {
		document.getElementById("form").action = "main.do";
		document.getElementById("form").submit();
	}
</script>
</head>
<body>
	${errmessage}


	<form id="registerForm" method="post" action="registerProc.do">

		<div>
			아이디 <input type="text" id="memId" name="memId" required="required" />
			<button type="button" id="idCheck">중복체크</button>
			<span id="check"></span>
		</div>
		<div>
			이름 <input type="text" name="memName" />
		</div>
		<div>
			비밀번호 <input type="password" id="memPasswd" name="memPasswd" />
		</div>
		<div>
			비밀번호확인 <input type="password" name="memPasswdCheck" />
		</div>
		<div>
			생년월일 <input type="text" id="memBirth" name="memBirth" />
		</div>
		<div>
			전화번호 <select id="mPhoneCode" name="mPhoneCode">
				<option value="010" selected>010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> - <input type="text" id="mPhoneMid" name="mPhoneMid" size="4"
				maxlength="4" /> - <input type="text" id="mPhoneEnd"
				name="mPhoneEnd" size="4" maxlength="4" />
		</div>
		<div>
			<script type="text/javascript"
				src="${captchajs}?theme=clean&key=${captchaPublicKey}"></script>
		</div>
		<div>
			<input type="submit" id="register" value="회원가입"> <input
				type="button" onclick="action()" value="메인으로">
		</div>
	</form>


</body>
</html>