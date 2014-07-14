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

						form_wrapper = $('.modifyBox');
						//비밀번호 변경폼보이기
						$("#pwCheck_form").hide();
						$("button.changeInfo").click(function() {
							// 											if ($("#pwChange_form").css(
							// 													"display") == "none"
							// 													|| $("#mobileChange_form")
							// 															.css("display") == "none") {
							// 												$("#pwCheck_form").toggle();
							// 											}
							if ($(".infoChangBox").css("display") == "none") {
								$("#pwCheck_form").toggle();
							}
						});

						//비밀번호 변경,전화번호 보이기
						$('.linkform a,.link_reg a')
								.on(
										'click',
										function(e) {
											var target = $(this).attr('href'), target_height = $(
													target).actual('height');
											$(form_wrapper).css(
													{
														'height' : form_wrapper
																.height()
													});

											$(form_wrapper.find('form:visible'))
													.fadeOut(
															400,
															function() {
																form_wrapper
																		.stop()
																		.animate(
																				{
																					height : target_height,
																					marginTop : (-(target_height / 2) - 24)
																				},
																				50,
																				function() {
																					$(
																							target)
																							.fadeIn(
																									400);
																					$(
																							'.links_btm .linkform')
																							.toggle();
																					$(
																							form_wrapper)
																							.css(
																									{
																										'height' : ''
																									});
																				});
															});
											e.preventDefault();
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

																						// 																						$(
																						// 																								'#pwChange_form')
																						// 																								.toggle();

																						$(
																								'.infoChangBox')
																								.toggle();
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
					});
</script>
<title>myInfo.jsp</title>
</head>
<body>
	<form>
		<div>아이디 :${sessionScope.loginUser.memId}</div>

		<div>이름 :${myInfo.memName}</div>

		<div>등급 :${myInfo.memGrade}</div>

		<div>전화번호 :${myInfo.memMobile}</div>

	</form>
	<div>
		<button class="changeInfo">내정보 변경</button>
	</div>

	<div class="modifyBox">
		<form id="pwCheck_form" action="" method="post">
			<!-- 			<div> -->
			<!-- 				<input type="hidden" name="memId" -->
			<%-- 					value="	${sessionScope.loginUser.memId}"> --%>
			<!-- 			</div> -->
			<div>현재비밀번호</div>
			<div>
				<input type="password" id="prePasswd" name="memPasswd">
			</div>
			<div>
				<label id="pwCheckMsg"></label>
			</div>
			<div>
				<input type="button" id="pwCheck_btn" value="비밀번호 확인">
			</div>
		</form>


		<div class="infoChangBox" style="display: none">

			<div>
				<button class="changePw_btn">비밀번호 변경</button>
			</div>
			<div>
				<button class="changeMobile_btn">전화번호 변경</button>
			</div>

			<form id="pwChange_form" action="passwordProc.do" method="post"
				style="display: none">
				<div>새 비밀번호</div>
				<div>
					<input type="password" name="tempPw">
				</div>
				<div>새 비밀번호 확인</div>
				<div>
					<input type="password" name="tempPw2">
				</div>
				<div>
					<label id="infoErrorMsg" style="color: red"></label>
				</div>
				<div>
					<input type="submit" value="비밀번호 변경">
				</div>
			</form>


			<form id="mobileChange_form" action="mobileProc.do" method="post"
				style="display: none">
				<div>전화번호</div>
				<div>
					<input type="text" name="memMobile"
						placeholder="${myInfo.memMobile}">
				</div>
				<div>
					<label id="mobileErrorMsg" style="color: red"></label>
				</div>
				<div>
					<input type="submit" value="전화번호 변경">
				</div>
			</form>


		</div>
	</div>


	<div>
		<a href="dropForm.do">회원탈퇴</a>
	</div>
</body>
</html>