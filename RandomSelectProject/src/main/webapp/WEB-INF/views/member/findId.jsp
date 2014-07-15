<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findId.jsp</title>
<!--jquery  -->
<!--datepicker  -->
<link rel="stylesheet"
	href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.4/themes/smoothness/jquery-ui.css" />
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<!-- <script type="text/javascript"  src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.4/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 달력 
						$("#dateId,#datePw").datepicker(
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

						//toggle로 div나누기 
						form_wrapper = $('.findBox');
						$('.linkform a')
								.on(
										'click',
										function(e) {
											var target = $(this).attr('href');
											$(form_wrapper.find('form:visible'))
													.fadeOut(
															400,
															function() {
																form_wrapper
																		.stop()
																		.animate(
																				50,
																				function() {
																					$(
																							target)
																							.fadeIn(
																									400);
																					$(
																							'.linkBox .linkform')
																							.toggle();

																				});
															});

											e.preventDefault();
										});

						//아이디폼 정규식
						//$("#findId_btn").click(function() {
						$("#findId_form")
								.submit(
										function() {
											var name = $('#nameId').val();
											var date = $('#dateId').val();
											var mobile = $('#mobileId').val();
											var regex_name = /^[가-힣]+$/;
											var regex_mobile = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
											if (name == '' || date == ''
													|| mobile == '') {
												$(this).focus();
												$('#idErrorMsg')
														.html(
																'<font color=red>모두 입력해주세요.</font>');
												return false;
											} else {
												if (!regex_name.test(name)) {
													$('#idErrorMsg')
															.html(
																	'<font color=red>이름은 한글로 입력해주세요.</font>');
													return false;
												} else if (!regex_mobile
														.test(mobile)) {
													$('#idErrorMsg')
															.html(
																	'<font color=red>전화번호는 -을 포함한 숫자로 입력해주세요.</font>');
													return false;
												}
											}
											return true;
										});
						//}

						//비밀번호 찾기 ajax
						$('#findPwCheck_btn')
								.click(
										function() {
											var memId = $('#idPw').val();
											var regex_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
											var regex_mobile = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
											if (memId == ''
													|| $('#datePw').val() == ''
													|| $('#mobilePw').val() == '') {
												$('#pwErrorMsg')
														.html(
																'<font color=red>모두 입력해주세요.</font>');
											} else if (!regex_email.test(memId)) {
												$('#pwErrorMsg')
														.html(
																'<font color=red>아이디는 이메일 형식으로 입력해주세요.</font>');
											} else if (!regex_mobile.test($(
													'#mobilePw').val())) {
												$('#pwErrorMsg')
														.html(
																'<font color=red>전화번호는 -을 포함한 숫자로 입력해주세요.</font>');
											} else {
												$
														.ajax({
															cache : false,
															async : false,
															type : 'POST',
															url : 'pwCheck.do',
															data : 'memId='
																	+ memId
																	+ '&memBirth='
																	+ $(
																			'#datePw')
																			.val()
																	+ '&memMobile='
																	+ $(
																			'#mobilePw')
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
																				'checkPw')
																		.text();
																if (result
																		.trim() == 'true') {
																	$(
																			'#findPassword_form')
																			.submit();
																} else {
																	if (result
																			.trim() == 'incorrectInfo') {
																		$(
																				'#pwErrorMsg')
																				.html(
																						'<font color=red>아이디와 정보를 다시 확인해주세요.</font>');
																	} else {
																		$(
																				'#pwErrorMsg')
																				.html(
																						'<font color=red>일치하는 아이디가 없습니다.</font>');
																	}
																}
															}
														});

											}
										});
					});
</script>
</head>
<body>

	<div class="findBox">
		<form id="findId_form" action="findIdProc.do" method="post">
			<div>아이디 찾기</div>
			<div>
				이름 <input type="text" id="nameId" name="memName">
			</div>
			<div>
				생년월일 <input type="text" id="dateId" name="memBirth"
					readonly="readonly">
			</div>
			<div>
				전화번호 <input type="text" id="mobileId" name="memMobile"
					placeholder="ex)010-1234-1234">
			</div>
			<div>
				<label id="idErrorMsg" style="color: red">${errmessage }</label>
			</div>
			<div>
				<input type="submit" id="findId_btn" value="아이디찾기">
			</div>
		</form>


		<form id="findPassword_form" action="findPasswordProc.do"
			method="post" style="display: none">
			<div>비밀번호 찾기</div>
			<div>
				아이디 <input type="text" id="idPw" name="memId">
			</div>
			<div>
				생년월일 <input type="text" id="datePw" name="memBirth"
					readonly="readonly">
			</div>
			<div>
				전화번호 <input type="text" id="mobilePw" name="memMobile"
					placeholder="ex)010-1234-1234">
			</div>
			<div>
				<label id="pwErrorMsg" style="color: red"></label>
			</div>
			<div>
				<input type="button" id="findPwCheck_btn" value="비밀번호찾기">
			</div>

		</form>

	</div>

	<div class="linkBox">
		<span class="linkform"><a href="#findPassword_form"
			id="findPassword_btn">비밀번호찾기</a> </span> <span class="linkform"
			style="display: none"> <a href="#findId_form" id="findId_btn">아이디
				찾기</a>
		</span>
	</div>




</body>
</html>