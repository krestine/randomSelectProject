<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function restntList() {
		document.getElementById("community").action = "restntList.do";
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
<h1>restntDetail</h1>



     
 <div>
			<table align="center" border="0" cellpadding="0" cellspacing="0"
				bgcolor="white">
				
				<tr>
						
					<form action="mateDetailProc.do" method="post">
						<input value="친구이름">
						<input value="친구아이디">
						<input value="친구등급"><br>
						<input type="" value="${restnt.restntName}" name="restntName"><br>
						<input type="" value="${restnt.restntEval}" name="restntEval"><br>
						<input type="" value="${restnt.restntMenu}" name="restntMenu"><br>
						<input type="" value="${restnt.restntCate} " name="restntCate"><br>
						<input type="" value="${restnt.restntTel} " name="restntTel"><br>
						<input type="" value="${restnt.restntAddr }" name="restntAddr"><br>
						
					
					</form>
				</tr>
			</table>
		</div>       
    

<form id="community" method="POST">
		<input type="button" onclick="restntList()" value="식당 리스트" />
		<input type="button" onclick="mateList()" value="친구 리스트" />
		<input type="button" onclick="main()" value="메인" />
	</form>

</body>
</html>