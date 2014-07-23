<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript">
	function idSearch() {

		document.getElementById("serchSelect").action = "memberSearchByIdProc.do";
		document.getElementById("serchSelect").submit();
	}

	function nameSearch() {

		document.getElementById("serchSelect").action = "memberSearchByNameProc.do";
		document.getElementById("serchSelect").submit();
	}

	function gradeSearch() {

		document.getElementById("serchSelect").action = "memberSearchByGradeProc.do";
		document.getElementById("serchSelect").submit();
	}

	function blackSearch() {

		document.getElementById("serchSelect").action = "memberSearchByBlackProc.do";
		document.getElementById("serchSelect").submit();
	}
</script>
<title>회원 검색</title>
<style>
html {
	height: 100%;
	margin : 0;
	padding : 0;
}

body,.container {
	height: 100%;
	margin: 0;
	padding : 0;
}
</style>
</head>

<body>
<div class="row">
<div class="col-md-12"><img src="/myapp/resources/img/admin.png" style="width:100%;"></div>	
</div>
	<div align="center" style="position: relative; ">
		<h1>회원 검색</h1>
		<table>

			<tr>
				<form action="memberSearchProc.do" method="post">
					<td>아이디 입력</td>
					<td><input type="text" name="param"></td> <input
						type="hidden" value="1" name="caseCode">
					<td><input type="submit" value="검색"></td>
				</form>
			</tr>

			<tr>
				<form action="memberSearchProc.do" method="post">
					<td>이름 입력</td>
					<td><input type="text" name="param"> <input
						type="hidden" value="2" name="caseCode"></td>
					<td><input type="submit" value="검색"></td>
				</form>
			</tr>
			<tr>
				<form action="memberSearchProc.do" method="post">
					<td>등급 선택</td>
					<td><select name="param">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
					</select></td>
					<td><input type="hidden" value="3" name="caseCode"> <input
						type="submit" value="검색"></td>
				</form>
			</tr>
			<tr>

				<form action="memberSearchProc.do" method="post">
					<input type="hidden" value="4" name="caseCode">
					<td>블랙 리스트</td>
					<td></td>
					<td><input type="submit" value="검색"></td>
				</form>
			</tr>
		</table>
	</div>
</body>
</html>