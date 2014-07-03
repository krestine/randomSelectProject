<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function mateList() {
		document.getElementById("community").action = "mateListProc.do";
		document.getElementById("community").submit();
		}
	function main(){
		document.getElementById("community").action = "main.do";
		document.getElementById("community").submit();
		}
</script>	
<title>mateDetail</title>
</head>
<body>
		<h1>${mateInfo.memName }님의 정보입니다.</h1>
		<br>
		<div>
			<table align="center" border="0" cellpadding="0" cellspacing="0"
				bgcolor="white">
				
				<tr>
						
					<form action="mateDetailProc.do" method="post">
						<input value="친구이름">
						<input value="친구아이디">
						<input value="친구등급"><br>
						<input type="" value="${mateInfo.memName }" name="memName">
						<input type="" value="${mateInfo.memId}" name="memId">
						<input type="" value="${mateInfo.memGrade}" name="memGrade"><br>
						<input value="공유상태">
						<input value="친구관계"><br>	
						<input type="" value="${mate.infoStatus}" name="infoStatus">
						
						<input type="" value="${mate.mateStatus}" name="mateStatus">
					
					</form>
				</tr>
			</table>
		</div>
		<br>

		<hr>
	


	


	<form id="community" method="POST">
	<input type="button" onclick="mateList()" value="친구 리스트" />
	<input type="button" onclick="main()" value="메인" />
	</form>
	

</body>
</html>