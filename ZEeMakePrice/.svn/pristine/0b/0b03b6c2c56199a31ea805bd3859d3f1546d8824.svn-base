<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	function updateGo() {

		document.getElementById("GoSelect").action = "boardUpdateForm.do";
		document.getElementById("GoSelect").submit();
	}

	function deleteGo() {

		document.getElementById("GoSelect").action = "boardDelete.do";
		document.getElementById("GoSelect").submit();
	}
</script>



<title>Insert title here</title>
</head>
<body>
	<div>
		


		<h1 align="center">boardContext</h1>
		<table border="1" width="90%" align="center">

			<tr>
				<td align="center" width="120">제&nbsp;&nbsp;&nbsp;목</td>
				<td colspan="2">${board.title}</td>
			</tr>
			<tr>
				<td align="center">${board.userId}</td>
				<td width="120">조회</td>
				<td>${board.qaDate}</td>
			</tr>
			<tr>
				<td align="center">글내용</td>
				<td colspan="2">${board.qaContext}</td>
			</tr>
			<tr>
				<td></td>
				<td align="right" colspan="2"> <c:choose>
						<c:when test="${users.userid==board.userId}">
							<form id="GoSelect" method="post">
								<input type="hidden"
					name="boardNumber" value="${board.boardNumber }">
								<input type="button" id="update" onclick="updateGo()" value="수정" />
								<input type="button" id="delete" onclick="deleteGo()" value="삭제" />
							</form>
							<input type="button" value="목록"
								onclick="document.location='boardList.do'">
						</c:when>
						<c:otherwise>
							<input type="button" value="목록"
								onclick="document.location='boardList.do'">
						</c:otherwise>
					</c:choose></td>

			</tr>

		</table>
	</div>
</body>
</html>