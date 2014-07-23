<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>evaluateList.jsp</title>
<script type="text/javascript">
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function evalPage(obj){
	
	$('#pageNum').val(parseInt(obj.id));
	$('#pageForm').submit();
}
</script>
</head>
<body>
	<center>
		<h3>평가한 식당 리스트</h3>

		<%-- <form id="select1" method="post">
		<input type="button" onclick="mainGo()" value="메인으로 ">
	</form> <form id="select2" method="post">
		<input type="button" onclick="evaluateMainGo()" value="평가메인으로">
	</form>
 --%>

		<form action="evaluateList.do" id="pageForm">
			<input id="pageNum" name="pageNum" type="hidden"> <input
				id="memId" name="memId" value="${memId}" type="hidden">
		</form>
		<table width="50%" border="1" bordercolor="#00A5FF">

			<tr align="center" valign="middle">
				<td colspan="5">평가한 목록</td>
			</tr>
			<tr align="center" valign="middle" bgcolor="#00A5FF">

				<td width="100px"><label>평점</label></td>

				<td>방문 평가 한 음식점</td>

				<td>방문한 날짜</td>
				<td></td>
				<c:forEach var="evaluate" items="${boardList}" varStatus="status">

					<tr height="35px">


						<td align="center"><c:choose>
								<c:when test="${evaluate.score ==5}">
						★★★★★
			</c:when>
								<c:when test="${evaluate.score ==4}">
						★★★★☆
			</c:when>
								<c:when test="${evaluate.score ==3}">
						★★★☆☆
			</c:when>
								<c:when test="${evaluate.score ==2}">
						★★☆☆☆
			</c:when>
								<c:when test="${evaluate.score ==1}">
						★☆☆☆☆
			</c:when>
							</c:choose> <script type="text/javascript">
function hideshow(which){
if (!document.getElementById)
return
if (which.style.display=="block")
which.style.display="none";
else
which.style.display="block";
}
</script>
							<form action="edit.do" method="post">
								<a
									href="javascript:hideshow(document.getElementById('${evaluate.evalId}'))">수정</a>
								<div id="${evaluate.evalId}" style="display: none">
									<input type="hidden" value="${evaluate.evalId}" name="evalId">
									<input type="hidden" value="${evaluate.memId}" name="memId">
									<select name="score" id="score">
										<option value="5">★★★★★</option>
										<option value="4">★★★★☆</option>
										<option value="3">★★★☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="1">★☆☆☆☆</option>
									</select>
									<!-- <a
						href="edit.do?memId=${evaluate.memId}&evalId=${evaluate.evalId}">확인</a> -->

									<input type="submit" value="확인"
										onclick="location.href='javascript:hideshow(document.getElementById(memId=${evaluate.memId}&evalId=${evaluate.evalId}))'">

								</div>
							</form> <a
							href="delete.do?memId=${evaluate.memId}&evalId=${evaluate.evalId}">삭제</a>

						</td>
						<td>${evaluate.restntName}</td>
						<td style="text-align: center;"><f:formatDate
								value="${evaluate.evalDate}" pattern="YYYY-MM-D" /></td>

					</tr>

				</c:forEach>
			<tr>
				<td colspan="5" align="center"><c:forEach var="a" begin="1"
						end="${pageCount}">

						<a onclick="evalPage(this)" id="${a}">[${a}]</a>

					</c:forEach></td>
			</tr>

		</table>
	</center>
</body>
</html>
