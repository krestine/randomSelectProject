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
</script>
<title>게시판</title>
</head>
<body>
	<h3>평가한 식당 리스트</h3>

	<input type="button" onclick="window.location='evaluatemain.do'"
		value="메인" />
	<input type="button" onclick="javascript:history.back(-1)" value="메인" />
	<form id="select2" method="post">

		<table width="600" border="1" bordercolor="#00A5FF">

			<tr align="center" valign="middle">
				<td colspan="5">평가한 목록</td>

			</tr>
			<tr align="center" valign="middle" bgcolor="#00A5FF">
				<td width="66px">번호</td>
				<td width="100px"><label>평점</label> <select name="score"
					id="score">
						<option value="5">★★★★★</option>
						<option value="4">★★★★☆</option>
						<option value="3">★★★☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="1">★☆☆☆☆</option>
				</select></td>
				<!-- 	<td><input type="text" name="evaluate" maxlength="300"
					style="width: 300px" placeholder="의견을 140자 이내로 적어주세요"></td> -->
				<td>방문 평가 한 음식점</td> //여기서 부터 시험
				<!-- <tr>	<td colspan="5" align="right">
							<input type="button" onclick="deleteGo()" value="삭제"> </a></td>
						</td>
						</tr> -->
				<!--  이게 시험해보려고 하는 것 -->
				<%-- 		<td>${sessionScope.memId!==null}</td> --%>

				<td align="center"><input type="submit" id="ok" value="등록"
					${sessionScope.memId == null?" disabled":"" }></td>
				<td width="40px">삭제</td> // 아래는 같음

			</tr>

			<c:forEach var="evaluate" items="${boardList}">

				<tr height="35px">
					<td align="center">${evaluate.evalId}</td>
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
						</c:choose></td>
					<td>${evaluate.restntName}</td>
					<td>${evaluate.evalDate}</td>

				</tr>

			</c:forEach>
			<tr>
				<td colspan="5" align="center"><c:if test="${page <= 1 }">[이전]&nbsp; </c:if>
					<c:if test="${page > 1 }">
						<a href="evaluateList.do?memId=${memId }&page=${page-1}">이전</a>&nbsp;</c:if>
					<c:forEach begin="${startpage }" end="${endpage }" var="a">
						<c:if test="${a==page }">[${a}]</c:if>
						<c:if test="${a!=page }">
							<a href="evaluateList.do?memId=${memId}&page=${a}">[${a}]</a>&nbsp;</c:if>
					</c:forEach> <c:if test="${page>=maxpage }">[다음]</c:if> <c:if
						test="${page<maxpage }">
						<a href="evaluateList.do?memId=${memId}&page=${page+1}">[다음]</a>
					</c:if></td>
			</tr>
		</table>
	</form>
	</table>
	</form>


</body>
</html>
