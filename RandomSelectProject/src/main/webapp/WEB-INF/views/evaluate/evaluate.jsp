<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>evaluateList.jsp</title>
<style>
.divHide {
	display: none;
	visibility: hidden;
}

.divShow {
	visibility: show;
}

table {
	width: 600px;
	border: 1px solid #000000;
}

caption {
	font-weight: bold;
}

tr {
	height: 30px;
}

td {
	text-align: center;
	font-weight: bold;
}

#m1,#dm1 {
	background: #eeeeee;
}

#m2,#dm2 {
	background: #cccccc;
}

#m3,#dm3 {
	background: #aaaaaa;
}
</style>

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
<!-- <script>
function showHide(num) {
 
  var dm1 = document.getElementById("dm1"); // dom을 이용해서 값을 가져옴. 
  var dm2 = document.getElementById("dm2");
  var dm3 = document.getElementById("dm3");
  dm1.className = "divHide"; // 이벤트 발생시 전체를 초기화해서 보이지 않게함
  dm2.className = "divHide";
  dm3.className = "divHide";
  
  switch (num) {
   case 1:
    dm1.className = "divShow";
    break;
   case 2:
    dm2.className = "divShow";
    break;
   case 3:
    dm3.className = "divShow";
    break;
  }
  
 }
</script> -->
</head>
<body>
	<%-- <table>
<caption>평가</caption>
<tr>
<td id="m1" onclick="showHide(1);">평가한음식점</td>
<td id="m2" onclick="showHide(2);">평가안한 음식점</td>
<td id="m3" onclick="showHide(3);">홈으로 </td>
</tr>
<tr>
<td id="dm1" colspan="3">평가한 음식점</td>
<td id="dm2" colspan="3" class="divHide">평가안한 음식점</td>
<td id="dm3" colspan="3" class="divHide">홈으로 </td>
</tr>
</table>
 --%>
	<!-- <style>
a:link {
	color: blue;
	text-decoration: none;
}

a:visited {
	color: purple;
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: underline;
}

a:active {
	color: white;
	background-color: green;
}
</style> -->


	<!-- <script type="text/javascript">
	function evaluateGo() {

		document.getElementById("select2").action = "evaluateList.do";
		document.getElementById("select2").submit();
	}

	function nEvaluateGo() {

		document.getElementById("select2").action = "nEvaluateListForm.do";
		document.getElementById("select2").submit();
	}
	function editGo() {

		document.getElementById("select2").action = "edit.do";
		document.getElementById("select2").submit();
	}

	function mainGo() {
		document.getElementById("select1").action = "main.do";
		document.getElementById("select1").submit();
	}
	function myInfoGo() {
		document.getElementById("select1").action = "myInfoForm.do";
		document.getElementById("select1").submit();
	}</script>
 -->


	<form id="select2" method="post">
		<input type="button" onclick="evaluateGo()" value="평가한 페이지 ">
		<input type="button" onclick="nEvaluateGo()" value="평가 안한 페이지">
		<input type="button" onclick="mainGo()" value="메인으로">
	</form>
	<%-- <div class="evaluateList">

		<c:forEach var="notice" items="${add}" varStatus="evaluate">
			<dt class="listHead">
				<h3>${notice.title}</h3>
				<h4>${notice.regidate}</h4>
			</dt>
			<dd class="listContent">${notice.issue}
				<a class="mainBoard" href="WEB-INF/evaluate/edit.do"
					OnClick="editgo()">글수정</a> <a class="mainBoard" href="#"
					OnClick="window.location='delete.do?notCD=${notice.notCD}'">삭제</a>
			</dd>
		</c:forEach> </div>
		--%>

	
</body>
</html>
