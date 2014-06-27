<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function restntList() {
		document.getElementById("community").action = "restntList.do";
		document.getElementById("community").submit();

	}
	function mateList() {
		document.getElementById("community").action = "mateListProc.do";
		document.getElementById("community").submit();
	}
	function main(){
		document.getElementById("community").action = "main.do";
		document.getElementById("community").submit();
		}
</script>
<title>restntDetail</title>

</head>
<body>
<h1>restntDetail</h1>

${restnt.restntName } ${restnt.restntEval } ${restnt.restntMenu } ${restnt.restnt } ${restnt.restntCate }
${restnt.restntTel } ${restnt.restntAddr }
<c:forEach var="restnt" items="${restnts}" >
        ${restnt.restntName} <a href="restntDetail.do?restntId=${restnt.restntName}"></a> <br>
        ${restnt.restntEval} <a href="restntDetail.do?restntId=${restnt.restntEval}"></a>
        
        <hr>
    </c:forEach>

<form id="community" method="POST">
		<input type="button" onclick="restntList()" value="식당 리스트" />
		<input type="button" onclick="mateList()" value="친구 리스트" />
		<input type="button" onclick="main()" value="메인" />
	</form>

</body>
</html>