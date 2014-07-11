<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
</script>
<title>myInfo.jsp</title>
</head>
<body>
	${errmessage}

	<form>
		<div>아이디 :${sessionScope.loginUser.memId}</div>

		<div>이름 :${myInfo.memName}</div>

		<div>등급 :${myInfo.memGrade}</div>
	</form>



	<form id="pwCheck_form" action="" method="post">
		<div>
			<input type="hidden" name="memId"
				value="	${sessionScope.loginUser.memId}">
		</div>
		<div>현재비밀번호</div>
		<div>
			<input type="password" id="prePasswd" name="memPasswd">
		</div>
		<div>
			<label id="pwMsg"></label>
		</div>
		<div>
			<input type="button" id="pwCheck_btn" value="비밀번호 확인">
		</div>
	</form>
	<form id="myInfo_form" action="myInfoProc.do" method="post"
		style="display: none">
		<div>
			<input type="hidden" name="memId"
				value="	${sessionScope.loginUser.memId}">
		</div>
		<div>새 비밀번호</div>
		<div>
			<input type="password" name="tempPw">
		</div>
		<div>새 비밀번호 확인</div>
		<div>
			<input type="password" name="tempPw2">
		</div>
		<div>전화번호</div>
		<div>
			<input type="text" name="memMobile" placeholder="${myInfo.memMobile}">
		</div>
		<div>
			<label id="infoErrorMsg" style="color: red"></label>
		</div>
		<div>
			<input type="submit" value="정보수정">
		</div>
	</form>

	<div>
		<a href="dropForm.do">회원탈퇴</a>
	</div>
</body>
</html>