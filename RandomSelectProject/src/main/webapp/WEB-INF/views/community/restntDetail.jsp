<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function restntList() {
		document.getElementById("community").action = "restntListProc.do";
		document.getElementById("community").submit();

	}
	function mateList() {
		document.getElementById("community").action = "mateListProc.do";
		document.getElementById("community").submit();
	}
	function main(){
		document.getElementById("community").action = "main.do";
		document.getElementById("community").submit();
		}
</script>
<title>restntDetail</title>

</head>
<body>
<h1>${restnt.restntName}의 상세정보</h1>
					
				
					
					<form id="community" method="POST">
						<input type="button" onclick="restntList()" value="식당 리스트" />
						<input type="button" onclick="mateList()" value="친구 리스트" />
						<input type="button" onclick="main()" value="메인" />
					</form>

     				<form action="restntDetailProc.do" method="POST">
					
						<input value="식당이름">
						<input value="평균별점"><br>
						<input value="${restnt.restntName}" name="restntName">
						<input value="${restnt.restntEval}" name="restntEval"><br>
						<br>
						<input value="카테고리">
						<input value="전화번호"><br>
						<input value="${restnt.restntCate}" name="restntCate">
						<input value="${restnt.restntTel}" name="restntTel"><br>
						<br>
						${restnt.restntName }의 메뉴정보
						<br>
						<input value="메뉴이름">
						<input value="가격">
						<input value="칼로리">
						<br>
						<input type="hidden" value="${menuInfo.menuId}" name="menuId">
						<input value="${menuInfo.menuName}" name="menuName"><br>
						<input value="${menuInfo.menuPrice}" name="menuPrice"><br>
						<input value="${menuInfo.menuCalorie}" name="menuCalorie"><br>
						
					</form>
					<br>
	      
    



</body>
</html>