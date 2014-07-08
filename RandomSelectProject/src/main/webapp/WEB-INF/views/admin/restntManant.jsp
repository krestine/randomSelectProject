<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당 관리</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document)
			.ready(
					function() {

						$('#restntList').hide();
						$('#restntInfo').hide();

						$('#adress1')
								.click(
										function() {

											$('#restntList').hide();

											$
													.ajax({
														cache : false,
														async : false,
														type : 'POST',
														url : 'ajaxAdress2.do',
														data : ('adress1=' + $(
																'#adress1')
																.val()),
														dataType : 'json',
														error : function() {
															alert("에러 : 데이터가 안넘어갑니다.");
														},
														success : function(json) {
															$('#adress2')
																	.empty();
															for (var idx = 0; idx < json.adress2.length; idx++) {
																var adress2 = json.adress2[idx];
																$('#adress2')
																		.append(
																				'<option value="'+adress2+'">'
																						+ adress2
																						+ '</option>');
															}

														}
													});

										});
						$('#adress2')
								.click(
										function() {
											var paramData = {
												adress1 : $('#adress1').val(),
												adress2 : $('#adress2').val()
											};

											if ($('#adress2').val() != '시/도 를 선택하세요') {

												$
														.ajax({
															cache : false,
															async : false,
															type : 'POST',
															url : 'ajaxAdress3.do',
															data : paramData,
															dataType : 'json',
															error : function() {
																alert("에러 : 데이터가 안넘어갑니다.");
															},
															success : function(
																	json) {
																$('#adress3')
																		.empty();
																for (var idx = 0; idx < json.adress3.length; idx++) {
																	var adress3 = json.adress3[idx];
																	$(
																			'#adress3')
																			.append(
																					'<option value="'+adress3+'">'
																							+ adress3
																							+ '</option>');
																}

															}
														});
											}
										});
						$('#adress3')
								.click(
										function() {

											$('#restntList').hide();
											$('#restntInfo').hide();
											$("#restntTable > tbody").html("");
											var paramData = {
												adress1 : $('#adress1').val(),
												adress2 : $('#adress2').val(),
												adress3 : $('#adress3').val()
											};
											if ($('#adress3').val() != '시/군/구를 선택하세요') {

												$
														.ajax({
															cache : false,
															async : false,
															type : 'POST',
															url : 'ajaxRestntList.do',
															data : paramData,
															dataType : 'json',
															error : function() {
																alert("에러 : 데이터가 안넘어갑니다.");
															},
															success : function(
																	json) {

																var restnts = json.restnts;

																if (restnts[0].restntId != '') {
																	$(
																			'#restntList')
																			.show();
																	$.each(restnts,function(key) {
																						var restntName = restnts[key].restntName;
																						var restntId = restnts[key].restntId;

																						var html = '<tbody id="restntListResult"><tr>';
																						html += '<td>'
																								+ '<input type="hidden" id="restntId'+key+'" name="restntId" value="'+restntId+'" class="restntId">';
																						html += restntName
																								+ '<button id="restntInfo'
																								+ key
																								+ '" class="restntInfo" onclick="clickBtn(this);">관리</button></td></tr></tbody>';
																						$('#restntTable')
																								.append(
																										html);
																					});

																}

															}
														});

												// 												$('#restntInfo').click(function() {
												// 													alert('씨발');
												// 												});

											}
										});

					});
	function clickBtn(obj) {

		var paramData = {
			restntId : $(obj).prev().attr("value")
		};

		$.ajax({
					cache : false,
					async : false,
					type : 'POST',
					url : 'ajaxRestntInfo.do',
					data : paramData,
					dataType : 'json',
					error : function() {
						alert("에러 : 데이터가 안넘어갑니다.");

					},
					success : function(json) {
						$("#restntInfoTable > tbody").html("");
						$('#selectBox').hide();
						$('#restntList').hide();
						$('#restntInfo').show();

						if (json.restntId != '') {
							var restntName = json.restntName;
							var restntId = json.restntId;
							var adress1 = json.adress1;
							var adress2 = json.adress2;
							var adress3 = json.adress3;
							var adress4 = json.adress4;
							var restntCate = json.restntCate;
							var restntTel = json.restntTel;
							var restntEval = json.restntEval;
							var html = '<tr><th>식당명</th><td><input type="hidden" value="'+restntId+'"name="restntId"><input type="text"value="'+restntName+'" name="restntName"></td></tr>';
							html += '<tr><th>시/도</th><td><input type="text" value="'+adress1+'"name="adress1"></td></tr>';
							html += '<tr><th>시/군/구</th><td><input type="text" value="'+adress2+'"name="adress2"></td></tr>';
							html += '<tr><th>도로 명</th><td><input type="text" value="'+adress3+'"name="adress3"></td></tr>';
							html += '<tr><th>상세주소</th><td><input type="text" value="'+adress4+'"name="adress4"></td></tr>';
							html += '<tr><th>분류</th><td><input type="text" value="'+restntCate+'"name="restntCate"></td></tr>';
							html += '<tr><th>연락처</th><td><input type="text" value="'+restntTel+'"name="restntTel"></td></tr>';
							html += '<tr><th>평균 별점</th><td><input type="text" disabled="disabled"value="'+restntEval+'"></td></tr>';
							/* html += '<td>'
									+ '<input type="hidden" id="restntId" name="restntId" value="'+restntId+'" class="restntId">';
							html += restntName
									+ '<button id="restntInfo" class="restntInfo" onclick="clickBtn(this);">관리</button></td></tr></tbody>'; */
							$('#restntInfoTable').append(html);
						}

					}
				});

		$.ajax({
					cache : false,
					async : false,
					type : 'POST',
					url : 'ajaxMenuList.do',
					data : paramData,
					dataType : 'json',
					error : function() {
						alert("에러 : 데이터가 안넘어갑니다.");
					},
					success : function(json) {

						var menus = json.menus;
						var html1 = '<tr><th>메뉴 이름</th><th>가격</th><th>칼로리</th><th>특이사항</th></tr>';
						$('#menuTable').append(html1);

						$.each(menus, function(key) {

							var menuName = menus[key].menuName;
							var menuId = menus[key].menuId;
							var menuPrice = menus[key].menuPrice;
							var menuCalorie = menus[key].menuCalorie;
							var menuNote = menus[key].menuNote;
							var html2 = '<tr><td>' + menuName + '</td><td>'
									+ menuPrice + '</td><td>' + menuCalorie
									+ '</td><td>' + menuNote + '</td></tr>';
							$('#menuTable').append(html2);
						});
					}
				});

	}
</script>

</head>
<body>


	<div id="selectBox" align="center">
		<select id="adress1" class="adress1">
			<c:forEach items="${adress1}" var="adress1">

				<option value="${adress1}">${adress1}</option>

			</c:forEach>
		</select> <select id="adress2" class="adress2">
			<option>시/도 를 선택하세요</option>

		</select> <select id="adress3" class="adress3">
			<option>시/군/구를 선택하세요</option>
		</select>
	</div>


	<div id="restntList" align="center">

		<table border="2" id="restntTable">
			<caption>식당 리스트</caption>


		</table>

	</div>

	<div id="restntInfo" align="center">

		<table border="2" id="restntInfoTable">
			<caption>식당 정보</caption>


		</table>

		<table border="2" id="menuTable">
			<caption>메뉴 정보</caption>


		</table>

	</div>




</body>
</html>