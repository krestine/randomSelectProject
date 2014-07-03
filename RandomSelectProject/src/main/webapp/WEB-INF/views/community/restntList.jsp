<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function mateList() {
		document.getElementById("community").action = "mateListProc.do";
		document.getElementById("community").submit();
	}
	function main() {
		document.getElementById("community").action = "main.do";
		document.getElementById("community").submit();
	}
</script>
<title>식당리스트</title>
</head>
<body>
	<h1>친구들이 평가한 식당리스트</h1>
<body>
	<form id="community" method="POST">

		<input type="button" onclick="mateList()" value="친구 리스트" /> 
		<input type="button" onclick="main()" value="메인" />
	</form>
	<form action="restntDetailProc.do" method="post">
	<c:forEach var="evaluate" items="${evaluates}">
		<div>
			<table align="center" border="0" cellpadding="0" cellspacing="0"
				bgcolor="white">
				<tr>	
					<input type="" value="${evaluate.score }" name="score">
					<input type="submit" value="${evaluate.restntName}" name="restntName">
					<input type="" value="${evaluate.mateId }" name="mateId">
				</tr>
			</table>	
		</div>		
		
	</c:forEach>
		</form>
</body>
</html>