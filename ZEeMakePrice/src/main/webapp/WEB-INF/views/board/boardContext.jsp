<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="http://large.tistory.com/attachment/cfile24.uf@2308843D537D64900C6363.css">
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
		<font size="2">
			<table width="90%" align="center" cellpadding="0" cellspacing="0"
				bgcolor="white" border="0">

				<tr>
					<td width="5"><img alt="left_top"
						src="http://cfile22.uf.tistory.com/image/2204FA50537C7EA0118329"></td>
					<td colspan="3"
						style="background: url('http://cfile24.uf.tistory.com/image/26456E50537C7EA1054717') repeat-x; text-align: center;"></td>
					<td width="5"><img
						src="http://cfile26.uf.tistory.com/image/270FB150537C7EA10F105C"></td>
				</tr>
				<tr>
					<td rowspan="3"
						style="background: url('http://cfile9.uf.tistory.com/image/21756050537C7E9F14A8FF') repeat-y; text-align: center;"></td>
					<td align="center" width="0">제&nbsp;&nbsp;&nbsp;목</td>
					<td colspan="	2">${board.title}</td>
					<td rowspan="3"
						style="background: url('http://cfile23.uf.tistory.com/image/2274F750537C7EA014CA2B') repeat-y; text-align: center;"></td>
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
					<td><img
						src="http://cfile26.uf.tistory.com/image/2612E550537C7E9F2406E7"></td>
					<td align="right" colspan="3"
						style="background: url('http://cfile10.uf.tistory.com/image/25123550537C7E9F27D769') repeat-x; text-align: center;">
						<c:choose>
							<c:when test="${users.userid==board.userId}">
								<form id="GoSelect" method="post">
									<input type="hidden" name="boardNumber"
										value="${board.boardNumber }" class="redBtn"> <input
										type="button" id="update" onclick="updateGo()" value="수정"
										class="redBtn" /> <input type="button" id="delete"
										onclick="deleteGo()" value="삭제" class="redBtn" /> <input
										type="button" value="목록"
										onclick="document.location='boardList.do'" class="redBtn">
								</form>
							</c:when>
							<c:otherwise>
								<input type="button" value="목록"
									onclick="document.location='boardList.do'" class="redBtn">
							</c:otherwise>
						</c:choose>
					</td>
					<td><img
						src="http://cfile1.uf.tistory.com/image/225B0650537C7EA018F4E6"></td>
				</tr>

			</table>
		</font>
	</div>
</body>
</html>