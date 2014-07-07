<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <style type="text/css">
@import url(http://fonts.googleapis.com/css?family=PT+Sans:400,700);

#cssmenu {
	background: #e00000;
	margin: 0;
	width: auto;
	padding: 0;
	line-height: 1;
	display: block;
	position: relative;
	font-family: 'PT Sans', sans-serif;
}

#cssmenu ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: block;
}

#cssmenu ul:after {
	content: ' ';
	display: block;
	font-size: 0;
	height: 0;
	clear: both;
	visibility: hidden;
}

#cssmenu ul li {
	margin: 0;
	padding: 0;
	display: block;
	position: relative;
}

#cssmenu ul li a {
	text-decoration: none;
	display: block;
	margin: 0;
	-webkit-transition: color .2s ease;
	-moz-transition: color .2s ease;
	-ms-transition: color .2s ease;
	-o-transition: color .2s ease;
	transition: color .2s ease;
}

#cssmenu ul li ul {
	position: absolute;
	left: -9999px;
	top: auto;
}

#cssmenu ul li ul li {
	max-height: 0;
	position: absolute;
	-webkit-transition: max-height 0.4s ease-out;
	-moz-transition: max-height 0.4s ease-out;
	-ms-transition: max-height 0.4s ease-out;
	-o-transition: max-height 0.4s ease-out;
	transition: max-height 0.4s ease-out;
	background: #ffffff;
}

#cssmenu ul li ul li.has-sub:after {
	display: block;
	position: absolute;
	content: '';
	height: 10px;
	width: 10px;
	border-radius: 5px;
	background: #000000;
	z-index: 1;
	top: 13px;
	right: 15px;
}

#cssmenu ul li ul li.has-sub:before {
	display: block;
	position: absolute;
	content: '';
	height: 0;
	width: 0;
	border: 3px solid transparent;
	border-left-color: #ffffff;
	z-index: 2;
	top: 15px;
	right: 15px;
}

#cssmenu ul li ul li a {
	font-size: 14px;
	font-weight: 400;
	text-transform: none;
	color: #000000;
	letter-spacing: 0;
	display: block;
	width: 140px;
	padding: 11px 10px 11px 20px;
}

#cssmenu ul li ul li:hover>a,#cssmenu ul li ul li.active>a {
	color: #4cb6ea;
}

#cssmenu ul li ul li:hover:after,#cssmenu ul li ul li.active:after {
	background: #4cb6ea;
}

#cssmenu ul li ul li:hover>ul {
	left: 170px;
	top: 0;
}

#cssmenu ul li ul li:hover>ul>li {
	max-height: 72px;
	position: relative;
}

#cssmenu>ul>li {
	float: left;
}

#cssmenu>ul>li:after {
	content: '';
	display: block;
	position: absolute;
	width: 100%;
	height: 0;
	top: 0;
	z-index: 0;
	background: #ffffff;
	-webkit-transition: height .2s;
	-moz-transition: height .2s;
	-ms-transition: height .2s;
	-o-transition: height .2s;
	transition: height .2s;
}

#cssmenu>ul>li.has-sub>a {
	padding-right: 40px;
}

#cssmenu>ul>li.has-sub>a:after {
	display: block;
	content: '';
	background: #ffffff;
	height: 12px;
	width: 12px;
	position: absolute;
	border-radius: 13px;
	right: 14px;
	top: 16px;
}

#cssmenu>ul>li.has-sub>a:before {
	display: block;
	content: '';
	border: 4px solid transparent;
	border-top-color: #e00000;
	z-index: 2;
	height: 0;
	width: 0;
	position: absolute;
	right: 16px;
	top: 21px;
}

#cssmenu>ul>li>a {
	color: #ffffff;
	padding: 15px 20px;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: uppercase;
	font-size: 14px;
	z-index: 2;
	position: relative;
}

#cssmenu>ul>li:hover:after,#cssmenu>ul>li.active:after {
	height: 100%;
}

#cssmenu>ul>li:hover>a,#cssmenu>ul>li.active>a {
	color: #000000;
}

#cssmenu>ul>li:hover>a:after,#cssmenu>ul>li.active>a:after {
	background: #000000;
}

#cssmenu>ul>li:hover>a:before,#cssmenu>ul>li.active>a:before {
	border-top-color: #ffffff;
}

#cssmenu>ul>li:hover>ul {
	left: 0;
}

#cssmenu>ul>li:hover>ul>li {
	max-height: 72px;
	position: relative;
}

#cssmenu #menu-button {
	display: none;
}

@media all and (max-width: 768px) , only screen and
		(-webkit-min-device-pixel-ratio: 2) and (max-width: 1024px) , only
		screen and (min--moz-device-pixel-ratio: 2) and (max-width: 1024px) ,
		only screen and (-o-min-device-pixel-ratio: 2/1) and (max-width:
		1024px) , only screen and (min-device-pixel-ratio: 2) and (max-width:
		1024px) , only screen and (min-resolution: 192dpi) and (max-width:
		1024px) , only screen and (min-resolution: 2dppx) and (max-width:
	1024px) {
	#cssmenu>ul {
		max-height: 0;
		overflow: hidden;
		-webkit-transition: max-height 0.35s ease-out;
		-moz-transition: max-height 0.35s ease-out;
		-ms-transition: max-height 0.35s ease-out;
		-o-transition: max-height 0.35s ease-out;
		transition: max-height 0.35s ease-out;
	}
	#cssmenu>ul.open {
		max-height: 1000px;
		border-top: 1px solid rgba(110, 110, 110, 0.25);
	}
	#cssmenu ul {
		width: 100%;
	}
	#cssmenu ul>li {
		float: none;
	}
	#cssmenu ul li a {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		width: 100%;
		padding: 12px 20px;
	}
	#cssmenu ul>li:after {
		display: none;
	}
	#cssmenu ul li.has-sub>a:after,#cssmenu ul li.has-sub>a:before,#cssmenu ul li ul li.has-sub:after,#cssmenu ul li ul li.has-sub:before
		{
		display: none;
	}
	#cssmenu ul li ul,#cssmenu ul li ul li ul,#cssmenu ul li ul li:hover>ul
		{
		left: 0;
		position: relative;
	}
	#cssmenu ul li ul li,#cssmenu ul li:hover>ul>li {
		max-height: 999px;
		position: relative;
		background: none;
	}
	#cssmenu ul li ul li a {
		padding: 8px 20px 8px 35px;
		color: #ffffff;
		width: auto;
	}
	#cssmenu ul li ul ul li a {
		padding: 8px 20px 8px 50px;
	}
	#cssmenu ul li ul li:hover>a {
		color: #000000;
	}
	#cssmenu #menu-button {
		display: block;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		width: 100%;
		padding: 15px 20px;
		text-transform: uppercase;
		font-weight: 700;
		font-size: 14px;
		letter-spacing: 1px;
		color: #ffffff;
		cursor: pointer;
	}
	#cssmenu #menu-button:after {
		display: block;
		content: '';
		position: absolute;
		height: 3px;
		width: 22px;
		border-top: 2px solid #ffffff;
		border-bottom: 2px solid #ffffff;
		right: 20px;
		top: 16px;
	}
	#cssmenu #menu-button:before {
		display: block;
		content: '';
		position: absolute;
		height: 3px;
		width: 22px;
		border-top: 2px solid #ffffff;
		right: 20px;
		top: 26px;
	}
}
</style> -->
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

	function communityGo() {
		document.getElementById("select2").action = "mateListProc.do";
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table>
			<caption></caption>
			<thead>
			<tbody>
				<tr>
					<c:choose>
						<c:when test="${sessionScope.loginUser==null}">
							<form id="select1" method="post">
								<td><input type="button" onclick="loginGo()" value="로그인"></td>
								<td><input type="button" onclick="registerGo()"
									value="회원가입"></td>
							</form>
						</c:when>



						<c:when test="${sessionScope.loginUser.memGrade<7}">
							<form id="select1" method="post">
								<td><input type="button" onclick="logoutGo()" value="로그아웃"></td>
								<td><input type="button" onclick="myInfoGo()" value="내정보"></td>
							</form>
						</c:when>

						<c:when test="${sessionScope.loginUser.memGrade==666}">
							<form id="select1" method="post">
								<td><input type="button" onclick="logoutGo()" value="로그아웃">
								<td><input type="button" onclick="adminGo()" value="관리"></td>
							</form>
						</c:when>
					</c:choose>
					<form id="select3">
						<td><input type="button" onclick="selectResult()"
							value="아무거나"></td>
						<td><input type="button" onclick="ladderMake()" value="복불복"></td>
					</form>
				</tr>
				<tr>
					<form id="select2" method="post">
						<td><input type="button" onclick="settingGo()" value="설정 "></td>
						<td><input type="button" onclick="communityGo()" value="커뮤니티"></td>
						<td><input type="button" onclick="evaluateGo()" value="평가"></td>
						<td><input type="button" onclick="" value="통계"></td>
					</form>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>