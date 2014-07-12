<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
<script type="text/javascript">
	function editGo() {

		document.getElementById("select2").action = "edit.do";
		document.getElementById("select2").submit();
	}
	function deleteGo() {

		document.getElementById("select2").action = "delete.do";
		document.getElementById("select2").submit();
	}
	function mainGo() {
		document.getElementById("select1").action = "main.do";
		document.getElementById("select1").submit();
	}
	function evaluateMainGo() {
		document.getElementById("select2").action = "evaluatemain.do";
		document.getElementById("select2").submit();
	}
</script>
<title>게시판</title>
</head>

<body>



	<h3>평가한 식당 리스트</h3>

	<form id="select1" method="post">
		<input type="button" onclick="mainGo()" value="메인으로 ">
	</form>
	<form id="select2" method="post">
		<input type="button" onclick="evaluateMainGo()" value="평가메인으로">
	</form>



	<table width="600" border="1" bordercolor="#00A5FF">

		<tr align="center" valign="middle">
			<td colspan="5">평가한 목록</td>

		</tr>
		<tr align="center" valign="middle" bgcolor="#00A5FF">
			<td width="66px">번호</td>
			<td width="100px"><label>평점</label></td>
			<!-- 	<td><input type="text" name="evaluate" maxlength="300"
					style="width: 300px" placeholder="의견을 140자 이내로 적어주세요"></td> -->
			<td>방문 평가 한 음식점</td>

			<td>방문한 날짜</td>
			<td></td>
			<c:forEach var="evaluate" items="${boardList}" varStatus="status">
				<tr height="35px">
					<td align="center">${evaluate.memId}</td>
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
which.style.display="none"
else
which.style.display="block"
}
</script> <a
						href="javascript:hideshow(document.getElementById('${evaluate.evalId}'))">수정</a>


						<div id="${evaluate.evalId}" style="display: none">

							<select name="score" id="score">
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
							</select> <a
								href="javascript:hideshow(document.getElementById('${evaluate.evalId}'))">확인</a>
						</div> <a
						href="javascript:hideshow(document.getElementById('${evaluate.evalId}'))">삭제</a>

					</td>
					<td>${evaluate.restntName}</td>
					<td>${evaluate.evalDate}</td>
					<td>
						<form id="select2" method="POST">
							<input type="button" onclick="editGo()" value="수정">
						</form>
						<form id="select2" method="POST">
							<input type="button" onclick="deleteGo()" value="삭제">
						</form>
					</td>
				</tr>

			</c:forEach>
		<tr>
			<td colspan="5" align="center"><c:if test="${page <= 1 }">[이전]&nbsp; </c:if>
				<c:if test="${page > 1 }">
					<a href="/evaluateList.do?memId=${memId}&page=${page-1}">이전</a>&nbsp;</c:if>
				<c:forEach begin="${startpage }" end="${endpage }" var="a">
					<c:if test="${a==page }">[${a}]</c:if>
					<c:if test="${a!=page }">
						<a href="/evaluateList.do?memId=${memId}&page=${a}">[${a}]</a>&nbsp;</c:if>
				</c:forEach> <c:if test="${page>=maxpage }">[다음]</c:if> <c:if
					test="${page<maxpage }">
					<a href="/evaluateList.do?memId=${memId}&page=${page+1}">[다음]</a>
				</c:if></td>
		</tr>

	</table>


</body>
</html>
