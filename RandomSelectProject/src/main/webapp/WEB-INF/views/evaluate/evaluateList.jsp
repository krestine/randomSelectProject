<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>evaluateList.jsp</title>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css">

<script type="text/javascript">
	$(function() {
		$("dd").css("display", "none");
		$("dl dt,dl dt.selected").click(function() {
			if ($("+dd", this).css("display") == "none") {
				$("+dd", this).slideDown("fast");
				$("dt").removeClass("selected");
				$(this).addClass("selected");
			} else {
				$("+dd", this).slideUp("fast");
				$(this).removeClass("selected");
			}
		});
	});
</script>


</head>
<body>

<div id="wrap">
		<div class="menu">
			<ul>
				<li class="boardMenu"><a class="EvaluateList" href="#" OnClick="window.location='evaluateList.do'">평가한 페이지</a></li>
				<li class="boardMenu"><a class="friendBoard" href="#" OnClick="window.location='nEvaluateList.do'">평가안한페이지</a></li>
				<li class="boardMenu"><a class="mainBoard" href="#" OnClick="window.location='edit.do'">평점수정</a></li>
			</ul>
		</div>
		<div class="clear"></div>


		<div class="boardList">
			<dl>
			<c:forEach var="notice" items="${add}" varStatus="cnt">
				<dt class="listHead">
					<h3>${notice.title}</h3>
					<h4>${notice.regidate}</h4>
				</dt>
				<dd class="listContent">${notice.issue}
				<a class="mainBoard" href="#" OnClick="window.location='edit.do?notCD=${notice.notCD}'">글수정</a>
				<a class="mainBoard" href="#" OnClick="window.location='delete.do?notCD=${notice.notCD}'">삭제</a></dd>
			</c:forEach>
	
			
			</dl>
		</div>
		<a href="#" class="listMore">지난 공지사항 더보기</a>
	</div>
	<div>

	</div>
	

<div align="center">
		<table align="center" border="0" width="90%">
			<tr>
			<!-- 	<td width="33%"></td>
				<td width="34%" align="center"><a href="/z/"><img src="http://cfile25.uf.tistory.com/image/26446E40537C551725476A"></a>
					</td> -->
		</tr>
					<!-- 쇼핑몰 로고 가운데에 나타나게 한 것   -->
			
			
			
			<%-- <c:choose>
					<c:when test="${users==null}">
						<td width="33%" align="right">
						<input type="button" onclick="document.location='visitList.do'" value="방문목록"
							class="redBtn"></td>
							</c:when>
						<c:when test="${users==null}">
							<td width="33%" align="right">
							<input type="button" onclick="document.location='nEvaluateList.do'" value="평가안한"
							class="redBtn"></td>
							</c:when>
					<c:otherwise>
							<td width="33%" align="right"><b>${users.name}</b>${welcome }<input type="button"
							onclick="document.location='logout.do'" value="로그아웃"
							class="redBtn"></td>
					</c:otherwise>
				</c:choose>  --%>
								
		</table>
	</div>

<select name="Score">
<option value="1">★</option>
<option value="2">★★</option>
<option value="3">★★★</option>
<option value="4">★★★★</option>
<option value="5">★★★★★</option>

</select>
</body>
</html>