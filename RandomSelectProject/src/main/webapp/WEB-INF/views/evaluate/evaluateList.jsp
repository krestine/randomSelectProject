<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
</head>
<body>
	<script type="text/javascript">
	$(document).ready(
			function() {
				$("#ok").click(
						function() {
							var x = f.grade.value;
							$.ajax({
								type : 'POST', //포스트방식
								url : 'menuAjax.do', //요청처리
								data : 'itemId=' + $('#itemId').val()
										+ '&grade=' + x
										+ '&evaluationContents='
										+ $('#evaluationContents').val(), //파라미터
								dataType : 'xml', //처리한 요청을 받는 형식
								error : function() {
									alert("에러");
								},
								success : function(xml) { //성공시 해당함수 실행
									console.log('xml: ' + xml);
									alert("등록되었습니당!!!");
								}
							});
						});
			});
</script>



<form id="f" name="f">
	<label> 아이템 아이디<input id="itemId" name="itemId"
		value="${itemList[ind].itemId}">
	</label> <br> <label> 아이템 이름 <input name="itemName"
		value="${itemList[ind].itemName}">
	</label> <br> <label> 아이템 가격 <input name="itemPrice"
		value="${itemList[ind].price}">
	</label> <br> <label> 아이템 인포 <input name="itemInfo"
		value="${itemList[ind].itemInfo }">
	</label> <br> <br>

	<%-- ${evaluationList } 이미지, 이름, 가격, 칼로리, 상세정보, 썸네일이미지, 평점 및 댓글 --%>

	<%
		int i = 0;
	%>
	
	
	
	
	
	<form name=submit method=POST action="edit.do">

		<table width="600" border="1" bordercolor="#777777">

			<tr align="center" valign="middle">
				<td colspan="5">평점 및 댓글</td>

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
				<td><input type="text" name="evaluate" maxlength="300"
					style="width: 300px" placeholder="의견을 140자 이내로 적어주세요"></td>
				<td>회원아이디</td>
				<c:choose>
					<c:when test="${sessionScope.memberId == null }">
						<td width="100px" colspan="5" align="center"><input
							type="submit" value="등록"> 
							<!-- <a href="javascript:history.go(0)">[새로고침]</a> -->
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" align="right">
							<a href="edit.do"
								class="edite">의견등록</a></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tr>

			<c:forEach var="evaluate" items="${evalutes}">
			
				i++;
			
			<tr height="35px">
					<td align="center">${evaluate.evaluateId}</td>
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
					<td>${board.restntId }</td>
					<td></td>
					<td align="center"><fmt:formatDate
							value="${evaluate.evalDate}" pattern="yyyy-MM-dd" /></td>
				</tr>

			</c:forEach>

		<%-- 	<tr>
				<td colspan="5" align="center"><c:if test="${page <= 1 }">[이전]&nbsp; </c:if>
					<c:if test="${page > 1 }">
						<a href="menuInfo.do?page=${page-1}">이전</a>&nbsp;</c:if> <c:forEach
						begin="${startpage }" end="${endpage }" var="a">
						<c:if test="${a==page }">[${a }]</c:if test="${a!=page }">
						<a href="menuInfo.do?page=${a }">[${a }]</a>&nbsp;
				</c:forEach> <c:if test="${page>=maxpage }">[다음]</c:if> <c:if
						test="${page<maxpage }">
						<a href="menuInfo.do?page=${page+1}">[다음]</a>
					</c:if></td>
			</tr>
 --%>



		</table>
	</form>

	<!-- 
<form action="NewFile.jsp" method="post">


<input type="text" name="title" /><br/>
<input type="text" name="writer" /><br/>
<input type="text" name="regdate" /><br/>
	<input type="submit"/>
</form>-->
</body>
</html>
