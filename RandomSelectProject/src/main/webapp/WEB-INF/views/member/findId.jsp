<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findId.jsp</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
</head>
<body>
	${errmessage }
	<div class="findBox">
		<form id="findId_form" action="findIdProc.do" method="post">
			<div>
				이름 <input type="text" name="memName">
			</div>
			<div>
				생년월일 <input type="text" name="memBirth">
			</div>
			<div>
				전화번호 <input type="text" name="memMobile">
			</div>
			<div>
				<input type="button" onclick="findId()" value="아이디찾기"> <input
					type="button" onclick="findPw()" value="비밀번호찾기">
			</div>
			<div>
				<input type="submit" value="아이디찾기">
			</div>
		</form>


		<form id="findPassword_form" action="findPasswordProc.do"
			method="post">
			<div>
				아이디 <input type="text" name="memId">
			</div>
			<div>
				생년월일 <input type="text" name="memBirth">
			</div>
			<div>
				전화번호 <input type="text" name="memMobile">
			</div>
			<div>
				<input type="submit" value="비밀번호찾기">
			</div>
		</form>

	</div>

	<div class="linkBox">
		<span class="linkform"><a href="#findPassword_form"
			id="findPassword_btn">비밀번호찾기</a> </span> <span class="linkform"
			style="display: none"> <a href="#findId_form" id="findId_btn">아이티
				찾기</a>
		</span>
	</div>




</body>
</html>