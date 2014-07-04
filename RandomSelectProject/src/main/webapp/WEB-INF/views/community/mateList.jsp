
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	
	function restntList() {
		document.getElementById("community").action = "restntListProc.do";
		document.getElementById("community").submit();
	}
	function main() {
		document.getElementById("community").action = "main.do";
		document.getElementById("community").submit();
	}
</script>
<title>mateList</title>
</head>
<body>
	<h1>친구리스트</h1>
	<form id="community" method="POST">
		 <input type="button" onclick="restntList()" value="식당 리스트" /> 
		 <input type="button" onclick="main()" value="메인" />
	</form>
	<br>
	<c:forEach var="mate" items="${mates}">
		<br>
		
				
					
					<form action="mateDetailProc.do" method="post">
				
						<input type="hidden" value="${mate.memId}" name="memId">
						<input type="hidden" value="${mate.mateId}" name="mateId">
						<input type="hidden" value="${mate.mateId}" name="param">
						<input value="${mate.memName}" name="memName">
						<input value="${mate.mateId}" name="mateId">
						
						<input type="submit" value="상세보기">
					
					</form>
					
	</c:forEach>
	
</body>
</html>
