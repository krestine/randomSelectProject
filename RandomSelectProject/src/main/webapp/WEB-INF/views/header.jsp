<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/myapp/resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/myapp/resources/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="main.do" class="navbar-brand">아무거나</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="themes">Login<span class="caret"></span></a>
              <ul class="dropdown-menu" aria-labelledby="">
                <li><a href="loginForm.do">로그인</a></li>
                <li><a href="findIdForm.do">아이디\패스워드 찾기</a></li>
               
              </ul>
            </li>
            <li>
              <a href="registerForm.do">Register</a>
            </li>
            
          
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="logoutForm.do" target="_blank">Logout</a></li>
          </ul>

        </div>
      </div>
    </div>


  


</body>
</html>
