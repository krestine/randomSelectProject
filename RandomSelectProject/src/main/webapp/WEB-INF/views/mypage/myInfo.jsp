<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//toggle로 div나누기 
						form_wrapper = $('.modifyBox');
						$('#pwCheck_btn')
								.on(
										'click',
										function(e) {

											$(form_wrapper.find('form:visible'))
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
																		'#myInfo_form')
																		.toggle();
															});
											e.preventDefault();
										});

						//현재비밀번호 확인 ajax
						$('#pwCheck_btn')
								.click(
										function() {
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
															url : 'pwInfoCheck.do',
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
<title>myInfo.jsp</title>
</head>
<body>
	<form>
		<div>아이디 :${sessionScope.loginUser.memId}</div>

		<div>이름 :${myInfo.memName}</div>

		<div>등급 :${myInfo.memGrade}</div>
	</form>


	<div class="modifyBox">
		<form id="pwCheck_form" action="" method="post">
			<div>
				<input type="hidden" name="memId"
					value="	${sessionScope.loginUser.memId}">
			</div>
			<div>현재비밀번호</div>
			<div>
				<input type="password" id="prePasswd" name="memPasswd">
			</div>
			<div>
				<label id="pwMsg"></label>
			</div>
			<div>
				<input type="button" id="pwCheck_btn" value="비밀번호 확인">
			</div>
		</form>

		<form id="myInfo_form" action="myInfoProc.do" method="post"
			style="display: none">
			<div>
				<input type="hidden" name="memId"
					value="	${sessionScope.loginUser.memId}">
			</div>
			<div>새 비밀번호</div>
			<div>
				<input type="password" name="tempPw">
			</div>
			<div>새 비밀번호 확인</div>
			<div>
				<input type="password" name="tempPw2">
			</div>
			<div>전화번호</div>
			<div>
				<input type="text" name="memMobile"
					placeholder="${myInfo.memMobile}">
			</div>
			<div>
				<label id="infoErrorMsg" style="color: red"></label>
			</div>
			<div>
				<input type="submit" value="정보수정">
			</div>
		</form>
	</div>


	<div>
		<a href="dropForm.do">회원탈퇴</a>
	</div>
</body>
</html>