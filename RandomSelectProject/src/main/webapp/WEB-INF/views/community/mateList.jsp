<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function mateDetail() {
		document.getElementById("community").action = "mateDetailProc.do";
		document.getElementById("community").submit();

	}
	function restntList() {
		document.getElementById("community").action = "restntListProc.do";
		document.getElementById("community").submit();
	}
</script>
<title>mateList</title>
</head>
<body>
	<h1>mateList</h1>

${mate.mateId } ${mate.memId}

<c:forEach var="mate" items="${mates}" >
        ${mate.mateId} <a href="mateDetail.do?mateId=${mate.mateId}"></a><br>
        ${mate.memId } <a href="mateDetail.do?memId=${mate.memId}"></a><br>
        <hr>
    </c:forEach>



<form id="community" method="POST">
		<input type="button" onclick="mateDetail()" value="친구 상세보기" />
		<input type="button" onclick="restntList()" value="식당 리스트" />
	</form>
	<a href=randomSelect/main.do>메인으로</a>


<a href="mateDetailProc.do">친구 상세정보</a>
<a href="restntListProc.do">식당 리스트</a>

</body>
</html>