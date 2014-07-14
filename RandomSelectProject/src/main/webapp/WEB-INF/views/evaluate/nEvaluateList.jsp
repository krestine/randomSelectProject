<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>nEvaluateList.jsp</title>
<script type="text/javascript">
	function mainGo() {

		document.getElementById("select1").action = "main.do";
		document.getElementById("select1").submit();
	}
	function evaluateMainGo() {

		document.getElementById("select2").action = "evaluatemain.do";
		document.getElementById("select2").submit();
	}
	
</script>

</head>

<body>
	<h3>평가안한 식당 리스트</h3>

	<form id="select1" method="post">
		<input type="button" onclick="mainGo()" value="메인으로 ">
	</form>
	<form id="select2" method="post">
		<input type="button" onclick="evaluateMainGo()" value="평가메인으로">
	</form>

	<table width="600" border="1" bordercolor="#00A5FF">

		<tr align="center" valign="middle">
			<td colspan="5">평가안한 목록</td>

		</tr>
		<tr align="center" valign="middle" bgcolor="#00A5FF">
			<td width="66px">번호</td>
			<td width="100px"><label>평점</label></td>

			<td>방문 평가 안한 음식점</td>

			<td>방문한 날짜</td>
			<td></td>
			<c:forEach var="evaluate" items="${memberEvaluates}"
				varStatus="status">
				<tr height="35px">
					<td align="center">번호</td>
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
</script> 
<form action="editOk.do" method="post">
<a href="javascript:hideshow(document.getElementById('${evaluate.evalId}'))">수정</a>

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
	<%--<a	href="javascript:hideshow(document.getElementById('${evaluate.evalId}'))">확인</a>
 --%>					
 
 	<input type="submit" value="확인" onclick="location.href='javascript:hideshow(document.getElementById('${evaluate.evalId}'))'">
	</div>
				</form>
				</td>
				
					<td>${evaluate.restntName}</td>
					<td>${evaluate.evalDate}</td>
					<td>1::${evaluate.memId } <br> 2::${evaluate.evalId }
					</td>
				</tr>
			</c:forEach>
		<tr>
			<td colspan="5" align="center"><c:if test="${page <= 1 }">[이전]&nbsp; </c:if>
				<c:if test="${page > 1 }">
					<a href="/nEvaluateList.do?memId=${memId }&page=${page-1}">이전</a>&nbsp;</c:if>
				<c:forEach begin="${startpage }" end="${endpage }" var="a">
					<c:if test="${a==page }">[${a}]</c:if>
					<c:if test="${a!=page }">
						<a href="/nEvaluateList.do?memId=${memId}&page=${a}">[${a}]</a>&nbsp;</c:if>
				</c:forEach> <c:if test="${page>=maxpage }">[다음]</c:if> <c:if
					test="${page<maxpage }">
					<a href="/nEvaluateList.do?memId=${memId}&page=${page+1}">[다음]</a>
				</c:if></td>
		</tr>

	</table>


</body>
</html>