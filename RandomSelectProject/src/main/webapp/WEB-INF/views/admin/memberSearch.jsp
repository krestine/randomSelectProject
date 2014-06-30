<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>
	<form action="memberSearchByIdProc.do" method="post">
		아이디 입력<input type="text" name="param">
		<input type="hidden" value="ID" name="caseCode">
		<input type="submit" value="검색">
	</form>
		<br>
	<form action="memberSearchByNameProc.do" method="post">	
		이름 입력<input type="text" name="param">
		<input type="hidden" value="NAME" name="caseCode">
		<input type="submit" value="검색">
	</form>
		<br>
	<form action="memberSearchByGradeProc.do" method="post">	
		등급 선택
		<select name="param">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		</select>
		<input type="hidden" value="GRADE" name="caseCode">
		<input type="submit" value="검색">
	</form>	
		<br>
		<form action="memberSearchByBlackProc.do" method="post">
		<input type="hidden" value="BLACK" name="caseCode">
		블랙 리스트<input type="submit" value="검색">
		</form>
</body>
</html>