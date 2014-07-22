<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.js"
	type="text/javascript"></script>
<script src="/myapp/resources/js/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true&language=ko"></script>
<link rel="stylesheet" type="text/css" href="/myapp/resources/css/bootstrap.min.css" media="screen"/>
<script type="text/javascript" src="/myapp/resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function navbarMain() {
	document.getElementById("navbar").action = "main.do";
	document.getElementById("navbar").submit();
}
function navbarLogin() {
	document.getElementById("navbar").action = "loginForm.do";
	document.getElementById("navbar").submit();
}
function navbarLogout() {
	document.getElementById("navbar").action = "logoutForm.do";
	document.getElementById("navbar").submit();
}
function navbarRandomSelect() {
	document.getElementById("navbar").action = "selectResult.do";
	document.getElementById("navbar").submit();
}
</script>
<title>Insert title here</title>
</head>
<style>
</style>
<body>
<div class="navbar navbar-inverse navbar-fixed-top " >
      <div class="container">
        <div class="navbar-header" >
        <form id="navbar" method="post" >
          <a href="javascript:;" class="navbar-brand" onclick="navbarMain()">잇콕</a>
          
          <c:when test="${sessionScope.loginUser==null}">
          	<a href="javascript:;" class="navbar-brand" onclick="navbarLogin()">로그인</a>
          </c:when>
          <c:when test="${sessionScope.loginUser.memGrade<7}">
          	<a href="javascript:;" class="navbar-brand" onclick="navbarLogout()">로그아웃</a>
          </c:when>
          
          <a href="javascript:;" class="navbar-brand" onclick="navbarRandomSelect()">아무거나</a>
          </form>
        </div>
      </div>
    </div>
			
			
			
  


</body>
</html>
