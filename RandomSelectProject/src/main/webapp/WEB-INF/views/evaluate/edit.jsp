<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<title>Insert title here</title>

<script type="text/javascript" src="edit.js">

var lnbElement;
var contentElement;

window.addEventListener("load", function () {
	lnbElement = document.getElementById("lnb");
	contentElement = document.getElementById("content");
});

function toggleLNB(target) {
	if (lnbElement.style.display == "block") {
		lnbElement.style.display = "none";
		contentElement.style.paddingLeft = "20px";
		target.innerHTML = "메뉴열기";
	}else {
		lnbElement.style.display = "block";
		contentElement.style.paddingLeft = "216px";
		target.innerHTML = "메뉴닫기";
	}
}
</script>
////
<script type="text/javascript">
function hideshow(which){
if (!document.getElementById)
return
if (which.style.display=="block")
which.style.display="none"
else
which.style.display="block"
}
</script>
<a href="javascript:hideshow(document.getElementById('adiv'))">수정</a>

<div id="adiv" style="font:15px bold; display: none">

<select name="score" id="score">
					<option value="5">★★★★★</option>
					<option value="4">★★★★☆</option>
					<option value="3">★★★☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
			</select>
			
			</div>
</head>
<body>






<!--게시판 소스만 복사한 것  -->
<%-- <form name=writeform method=POST action="editOk.do">
		<table>

			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
							<td>글쓰기</td>
							<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
						</tr>
					</table>
					<table>
					<input type ="hidden" name = "evalScore"  value ="3">
						<tr>	
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input type=text name="title" size="50" maxlength="100" value="${nn.title}"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">이름</td>
							<td><input name="writer" size="50" maxlength="50" value="${nn.writer}"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">비밀번호</td>
							<td><input name="notPasswd" size="50" maxlength="50" value="${nn.notPasswd}"></td>
							<td>&nbsp;</td>
						</tr>
							<tr>
							<td>&nbsp;</td>
							<td align="center">예제 박스</td>
							<td><input type="text" name="box" value="box1111" size="50" maxlength="50" ></td>
							<td>&nbsp;</td>
						</tr>
						<form:select path="code" name="code" items="${code}" itemValue="code" 						
						itemLabel="codenm" />
						 --%>
		<%-- <tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td><textarea name="issue" cols="50" rows="13" value="${nn.issue}"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td>&nbsp;</td>

							<td colspan="2">
							<!--  <input type=button value="수정"	OnClick="javascript:writeCheck();"> -->
							
							<input type=submit value="수정"	> 
							
								<input type=button
								value="취소" OnClick="javascript:history.back(-1)">
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>

		</table>
	</form> --%>
	
</body>
</html>