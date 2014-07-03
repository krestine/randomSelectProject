<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>nEvaluateList.jsp</title>
<script type="text/javascript">
function editGo() {

	document.getElementById("select2").action = "edit.do";
	document.getElementById("select2").submit();
}
</script>

</head>

<body>


${memberEvaluates}<br>


	<%-- ${evaluationList } 이미지, 이름, 가격, 칼로리, 상세정보, 썸네일이미지, 평점 및 댓글 --%>

	<%
		int i = 0;
	%>
	
		
	<form id="select2" method="post">

		<table width="600" border="1" bordercolor="#777777">

			<tr align="center" valign="middle">
				<td colspan="5">평가안한 목록</td>

			</tr>
			<tr align="center" valign="middle" bgcolor="#f5ccf5">
				<td width="66px">번호</td>
				<td width="100px"><label>평점</label> <select name="grade">
						<option value="5">★★★★★</option>
						<option value="4">★★★★☆</option>
						<option value="3">★★★☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="1">★☆☆☆☆</option>
				</select></td>
				
				<td>방문 평가 안한 음식점</td>
				<c:choose>
					<c:when test="${sessionScope.memberId == null }">
						<td width="100px" colspan="5" align="center">
						<input type="button" onclick="editGo()" value="수정">
							<!-- <a href="javascript:history.go(0)">[새로고침]</a> -->
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" align="right">
							<a href="edit.do"
								class="edite">의견등록</a></td>
							<td><input type="text" name="evaluate" maxlength="300"
					style="width: 300px" placeholder="의견을 140자 이내로 적어주세요"></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tr>

			<c:forEach var="evaluate" items="${memberEvaluates}">
			
				i++;
			
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
		
		</table>
	</form>


</body>
</html>
