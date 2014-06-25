<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function restntDetail() {
		document.getElementById("community").action = "restntDetailProc.do";
		document.getElementById("community").submit();

	}
	function mateList() {
		document.getElementById("community").action = "mateListProc.do";
		document.getElementById("community").submit();
	}
</script>

<title>restntList</title>
</head>
<body>
<h1>restntList</h1>

	<form id="community" method="POST">
		<input type="button" onclick="restntDetail()" value="식당 상세보기" />
		<input type="button" onclick="mateList()" value="친구 리스트" />
	</form>

	<a href=randomSelect/main.do>메인으로</a>


</body>
</html>