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
<style type="text/css">
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
											'12월(DEC)' ],

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

						// 						$("#findRsModal").modal('hide');

						//아이디찾기 ajax&modal
						$("#findId_btn")
								.click(
										function() {
											// 						$("#findId_form").submit(function() {
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
											} else if (!regex_name.test(name)) {
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

											} else {
												$
														.ajax({
															cache : false,
															async : false,
															type : 'POST',
															url : 'findIdProc.do',
															data : 'memName='
																	+ name
																	+ '&memBirth='
																	+ date
																	+ '&memMobile='
																	+ mobile,
															dataType : 'xml',
															error : function() {
																alert("error");
															},
															success : function(
																	xml) {
																var result = $(
																		xml)
																		.find(
																				'checkId')
																		.text();
																if (result
																		.trim() == 'true') {
																	$(
																			'#idErrorMsg')
																			.html(
																					'');
																	var userId = $(
																			xml)
																			.find(
																					'check')
																			.text();
																	// 																	alert(userId);

																	var htmlId = '<div class="alert alert-dismissable alert-warning"><button type="button" class="close" data-dismiss="alert">×</button><p align="center">찾으신&nbsp;아이디는 &nbsp;<span id="findUserId" style="color: blue;">"'
																			+ userId
																			+ '"</span>&nbsp;입니다.</p></div>';
																	$(htmlId)
																			.appendTo(
																					"#findResult_body");
																	$(
																			'#findResult_div')
																			.show();
																	// 																	var htmlId = ' <div class="modal-dialog"><div class="modal-content"><div class="modal-body"><div align="center">찾으신&nbsp;아이디는 &nbsp;<span id="findUserId" style="color:blue;">"'+userId+'"</span>&nbsp;입니다.</div></div><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></div><!-- /.modal-content --></div><!-- /.modal-dialog -->';
																	// 																	$('#findRsModal').html(htmlId);
																	// 																	$("#findRsModal").modal('show');
																} else {
																	$(
																			'#idErrorMsg')
																			.html(
																					'<font color=red>일치하는 아이디가 없습니다.</font>');

																}
															}
														});

											}
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
																	// 																	$('#findPassword_form').submit();
																	$(
																			'#pwErrorMsg')
																			.html(
																					'');
																	var userMail = $(
																			xml)
																			.find(
																					'checkCertify')
																			.text();

																	// 																	alert(userMail);

																	var htmlPw = '<div class="alert alert-dismissable alert-success"><button type="button" class="close" data-dismiss="alert">×</button><p align="center"><span id="findPwCheck" style="color: blue;">"'
																			+ userMail
																			+ '"</span>로&nbsp;인증번호가&nbsp;발송되었습니다.<br>메일을&nbsp;확인해&nbsp;주세요.</p></div>';

																	$(htmlPw)
																			.appendTo(
																					"#findResult_body");
																	$(
																			'#findResult_div')
																			.show();

																	// 																	var htmlPw = ' <div class="modal-dialog"><div class="modal-content"><div class="modal-body"><div align="center"><span id="findPwCheck" style="color:blue;">"'+userMail+'"</span>로&nbsp;인증번호가&nbsp;발송되었습니다.<br>메일을&nbsp;확인해&nbsp;주세요.</div></div><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button></div><!-- /.modal-content --></div><!-- /.modal-dialog -->';

																	// 																	$('#findRsModal').html(htmlPw);
																	// 																	$("#findRsModal").modal('show');
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
	<div class="row">
		<div class="col-md-12">
			<a href="#"><img
				src="/myapp/resources/img/aboutUser.png" style="width: 100%;"></a>
		</div>
	</div>
	<div class="row" id="findResult_div" style="display: none">
		<div class="col-md-4"></div>
		<div class="col-md-4" id="findResult_body"></div>
		<div class="col-md-4"></div>
	</div>

	<div align="center" class="findBox">

		<form role="form" id="findId_form" action="findIdProc.do"
			method="post">
			<div>
				<h5 class="text-primary">아이디 찾기</h5>
			</div>
			<div class="form-group">
				<input type="text" id="nameId" name="memName" placeholder="이름">
			</div>
			<div class="form-group">
				<input type="text" id="dateId" name="memBirth" readonly="readonly"
					placeholder="생년월일">
			</div>
			<div class="form-group">
				<input type="text" id="mobileId" name="memMobile"
					placeholder="전화번호 ex)010-1234-1234">
			</div>
			<div>
				<label id="idErrorMsg" style="color: red">${errmessage }</label>
			</div>
			<div>
				<input type="button" class="btn btn-primary btn-sm" id="findId_btn"
					value="아이디찾기">
			</div>
		</form>


		<form role="form" id="findPassword_form" method="post"
			action="pwCheck.do" style="display: none">
			<!-- 		 action="findPasswordProc.do" -->

			<div>
				<h5 class="text-warning">비밀번호 찾기</h5>
			</div>
			<div class="form-group">
				<input type="text" id="idPw" name="memId" placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="text" id="datePw" name="memBirth" placeholder="생년월일"
					readonly="readonly">
			</div>
			<div class="form-group">
				<input type="text" id="mobilePw" name="memMobile"
					placeholder="전화번호 ex)010-1234-1234">
			</div>
			<div>
				<label id="pwErrorMsg" style="color: red"></label>
			</div>
			<div>
				<!-- 				<input type="button" class="btn btn-warning btn-sm" -->
				<!-- 					id="findPwCheck_btn" value="비밀번호찾기"> -->
				<input type="button" class="btn btn-warning btn-sm"
					id="findPwCheck_btn" value="비밀번호찾기">
			</div>

		</form>

	</div>

	<div align="center" class="linkBox">
		<span class="linkform"><a href="#findPassword_form"
			id="findPassword_btn">비밀번호찾기</a> </span> <span class="linkform"
			style="display: none"> <a href="#findId_form" id="findId_btn">아이디
				찾기</a>
		</span>
	</div>

	<!-- 모달 -->
	<!-- 	<div id="findRsModal" class="modal fade" role="dialog"  aria-hidden="true" data-backdrop="false"></div> -->
	<!-- 	<div id="findPwModal" class="modal fade" role="dialog" aria-hidden="true" ></div> -->
</body>
</html>