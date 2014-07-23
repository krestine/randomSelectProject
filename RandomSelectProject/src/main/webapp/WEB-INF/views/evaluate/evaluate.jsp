<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>evaluateList.jsp</title>

<script type="text/javascript">
	function evaluateGo() {

		document.getElementById("select2").action = "evaluateList.do";
		document.getElementById("select2").submit();
	}

	function nEvaluateGo() {

		document.getElementById("select2").action = "nEvaluateListForm.do";
		document.getElementById("select2").submit();
	}

	function mainGo() {
		document.getElementById("select1").action = "main.do";
		document.getElementById("select1").submit();
	}
</script>


</head>
<body>
	<form id="select2" method="post">
		<input type="button" onclick="evaluateGo()" value="평가한 페이지 ">
		<input type="button" onclick="nEvaluateGo()" value="평가 안한 페이지">
		<input type="button" onclick="mainGo()" value="메인으로">
	</form>
	
	
	
	
	<!-- 단버튼 -->
<div class="btn-group">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
    평가  <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu">
    <li><a href="evaluateList.do">평가한 페이지 </a></li>
    <li><a href="nEvaluateListForm.do">평가 안한 페이지 </a></li>
    
  </ul>
</div>

	
</body>
</html>
