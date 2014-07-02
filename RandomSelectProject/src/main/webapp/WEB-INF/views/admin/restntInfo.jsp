<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당 상세 정보</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		// 				input type="button"
		$('input[type=button]').click(function() {

			formHanddler(this);
		});

		function formHanddler(obj) {
			var objID = obj.id;
			var actionStr;
			if (objID === "addBtn") {
				actionStr = "restntInfoInsert.do";
			} else if (objID === "modBtn") {
				actionStr = "restntInfoUpdate.do";
			} else if (objID === "delBtn") {
				actionStr = "restntInfoDelete.do";
			}
			$('#management').attr("action", actionStr).submit();

		}
	});

	// 				$('#addBtn').click(
	// 						function(event) {
	// 							$('form[name=management]').attr('action','restntInfoInsert.do').submit();
	// 						});

	// 				$('#modBtn').click(
	// 						function(event) {
	// 							$('form[name=management]').attr('action',
	// 									'restntInfoUpdate.do').submit();
	// 						});

	// 				$('#delBtn').click(
	// 						function(event) {
	// 							$('form[name=management]').attr('action',
	// 									'restntInfoDelete.do').submit();
	// 						});

	// 	function formHanddler(button, action) {
	// 		button.click(
	// 				function(event) {
	// 					$('form[name=management]').attr('action',
	// 							action).submit();
	// 				});	
	// 	);

	/* $("#addBtn").bind(
			"click",
			function() {
				$('form[name=management]')
						.attr('action', 'restntInfoInsert.do').submit();
			}); */
</script>
</head>
<body>
	<c:choose>
		<c:when test="${restnt==null}">
		식당 정보가 없다 = 추가할 식당 정보 입력창
	</c:when>
	</c:choose>
	<form id="management" method="post">
		<table border="2">

			<caption>
				<c:choose>
					<c:when test="${restnt==null}">
						 식당 정보 입력
					</c:when>
					<c:otherwise>
				식당 상세 정보
				</c:otherwise>

				</c:choose>

			</caption>

			<tbody>

				<tr>
					<th>식당명</th>


					<td><input type="hidden" value="${restnt.restntId}"
						name="restntId"><input type="text"
						value="${restnt.restntName}" name="restntName"></td>
				</tr>
				<tr>
					<th>주소1</th>
					<td><input type="text" value="${restnt.adress1}"
						name="adress1"></td>
				</tr>
				<tr>
					<th>주소2</th>
					<td><input type="text" value="${restnt.adress2}"
						name="adress2"></td>
				</tr>
				<tr>
					<th>주소3</th>
					<td><input type="text" value="${restnt.adress3}"
						name="adress3"></td>
				</tr>
				<tr>
					<th>주소4</th>
					<td><input type="text" value="${restnt.adress4}"
						name="adress4"></td>
				</tr>

				<tr>
					<th>분류</th>
					<td>
						<%-- <input type="text" value="${restnt.restntCate}"
						name="restntCate">  --%> <select name="restntCate">
							<c:forEach items="${excMenus}" var="menu">
								<c:choose>
									<c:when test="${restnt.restntCate==menu.excMenu}">
										<option selected="selected">${menu.excMenu}</option>
									</c:when>
									<c:otherwise>
										<option>${menu.excMenu}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>
					<th>연락처</th>
					<td><input type="text" value="${restnt.restntTel}"
						name="restntTel"></td>
				</tr>



				<tr>
					<th>평균 별점</th>

					<td><input type="text" disabled="disabled"
						value="${restnt.restntEval}"></td>
				</tr>

				<tr>

					<th>별점 재계산</th>
					<td><input type="submit" value="계산"></td>

				</tr>

				<tr>
					<td><input type="button" value="추가" id="addBtn"></td>
					<td><input type="button" value="수정" id="modBtn"></td>
				</tr>
				<tr>
					<td><input type="button" value="삭제" id="delBtn"></td>
					<td><input type="reset" value="초기화" id="resBtn"></td>
				</tr>


			</tbody>

		</table>
	</form>


</body>
</html>