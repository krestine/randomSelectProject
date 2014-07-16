<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">
	function loginGo() {
		document.getElementById("select1").action = "loginForm.do";
		document.getElementById("select1").submit();
	}
	function registerGo() {
		document.getElementById("select1").action = "registerForm.do";
		document.getElementById("select1").submit();
	}
	function myInfoGo() {
		document.getElementById("select1").action = "myInfoForm.do";
		document.getElementById("select1").submit();
	}
	function logoutGo() {
		document.getElementById("select1").action = "logoutForm.do";
		document.getElementById("select1").submit();
	}
	function adminGo() {
		document.getElementById("select1").action = "adminMainProc.do";
		document.getElementById("select1").submit();
	}
	function mateListGo() {
		document.getElementById("select2").action = "mateListProc.do";
		document.getElementById("select2").submit();
	}
	function restntListGo(){
		document.getElementById("select2").action = "restntListProc.do";
		document.getElementById("select2").submit();	
	}
	function settingGo() {
		document.getElementById("select2").action = "settingForm.do";
		document.getElementById("select2").submit();
	}
	function evaluateGo() {
		document.getElementById("select2").action = "evaluatemain.do";
		document.getElementById("select2").submit();
	}
	function selectResult() {
		document.getElementById("select3").action = "selectResult.do";
		document.getElementById("select3").submit();
	}
	function ladderMake() {
		document.getElementById("select3").action = "ladderMake.do";
		document.getElementById("select3").submit();
	}
</script>
<style>
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>


<center>
	<div class="btn-group">	
      		<c:choose>
			<c:when test="${sessionScope.loginUser==null}">
				<form id="select1" method="post" style="display: inline;">
					<input type="button"  style="width:150px;height:100px;" class="btn btn-default " onclick="loginGo()" value="로그인" > 
					<input type="button"  style="width:150px;height:100px;" class="btn btn-warning"  onclick="registerGo()" value="회원가입">
				</form>
			</c:when>
			
			<c:when test="${sessionScope.loginUser.memGrade<7}">
				<form id="select1" method="post" style="display: inline;">
					<input type="button"  style="width:150px;height:100px;" class="btn btn-danger" onclick="logoutGo()" value="로그아웃">
					<input type="button"  style="width:150px;height:100px;" class="btn btn-info" onclick="myInfoGo()" value="내정보">
				</form>
			</c:when>
			
			<c:when test="${sessionScope.loginUser.memGrade==666}">
				<form id="select1" method="post" style="display: inline;">
					<input type="button"  style="width:150px; height:100px;"  class="btn btn-danger" onclick="logoutGo()" value="로그아웃"> 
					<input type="button"   style="width:150px;height:100px;" class="btn btn-info" onclick="adminGo()" value="관   리" >
				</form>
			</c:when>
		</c:choose>
	   		<form id="select3" method="post" style="display: inline;">
			<input type="button"  style="width:150px;height:100px;" class="btn btn-primary" onclick="selectResult()" value="아무거나"> 
			<!-- <input type="button" class="btn btn-warning" onclick="ladderMake()" value="복 불 복"> -->
			
		</form>
   		<form id="select2" method="post" style="display: inline;">
				<input type="button"  style="width:150px;height:100px;" class="btn btn-default" onclick="settingGo()" value="설   정">
				<div class=btn-group>
				<input type="button"  style="width:150px;height:100px;" class="btn btn-success dropdown-toggle"value="커뮤니티"data-toggle="dropdown">
				<ul class="dropdown-menu" role="menu">
				<li><input class="btn btn-success btn-sm" onclick="mateListGo()" value="친구리스트"></li>
				<li><input class="btn btn-success btn-sm" onclick="restntListGo()" value="식당리스트"></li>
				</ul> 
				</div> 	 				
				<div class="btn-group">
					<input type="button" style="width: 150px; height: 100px;" class="btn btn-info" data-toggle="dropdown" value="평  가">
					<!-- 단버튼 -->
					<!-- <div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
  					 평가 <span class="caret"></span>    onclick="evaluateGo()"
  					</button> -->
					<ul class="dropdown-menu" role="menu">
						<li><a href="evaluateList.do">평가한 페이지 </a></li>
						<li><a href="nEvaluateListForm.do">평가 안한 페이지 </a></li>
					</ul>
				</div>
		</form>
				
	</div>
</center>

	

</body>
</html>
