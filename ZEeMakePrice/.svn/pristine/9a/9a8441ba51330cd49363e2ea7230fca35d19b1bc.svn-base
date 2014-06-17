<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table align="center" border="0" width="90%">
			<tr>
				<td width="33%"></td>
				<td width="34%" align="center"><a href="/z/"><img src="http://cfile25.uf.tistory.com/image/26446E40537C551725476A"></a>
					</td>
				<c:choose>
					<c:when test="${users==null}">
						<td width="33%" align="right"><input type="button"
							onclick="document.location='loginForm.do'" value="로그인"
							class="redBtn"><input type="button"
							onclick="document.location='registerForm.do'" value="회원가입"
							class="redBtn"></td>
					</c:when>
					<c:otherwise>
	
						<td width="33%" align="right"><b>${users.name}</b>${welcome }<input type="button"
							onclick="document.location='logout.do'" value="로그아웃"
							class="redBtn"></td>
					</c:otherwise>
				</c:choose>
			</tr>

		</table>
	</div>
</body>
</html>