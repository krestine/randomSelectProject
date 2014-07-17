<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
<style type="text/css">
input.error {
	border: 1px dashed red;
}

label.error {
	margin-left: 10px;
	color: red;
}
</style>
<script type="text/javascript">
	$("#reasonForm").validate({
		rules : {
			leaveReason : "required"
		},
		messages : {
			leaveReason : "탈퇴이유를 적어주세요."
		},
		submitHandler : function(form) {
			$(form).Submit();
		}
	});
</script>
<title>drop.jsp</title>
</head>
<body>
	<div align="center">
		<form role="form" id="reasonForm" action="dropProc.do" method="post">
			<div class="form-group">
				탈퇴한&nbsp;아이디는&nbsp;<font color=red>영구적으로</font>&nbsp;사용불가합니다. <br>
				재가입시&nbsp;다른&nbsp;아이디를&nbsp;사용해주세요. <br>
			</div>
			<div class="form-group">
				<input type="text" name="leaveReason" placeholder="탈퇴사유">
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-danger btn-sm" value="회원탈퇴">
			</div>
		</form>
	</div>
</body>
</html>