<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>evaluateList.jsp</title>
</head>
<body>
<div align="center">
		<table align="center" border="0" width="90%">
			<tr>
			<!-- 	<td width="33%"></td>
				<td width="34%" align="center"><a href="/z/"><img src="http://cfile25.uf.tistory.com/image/26446E40537C551725476A"></a>
					</td> -->
		</tr>
					<!-- 쇼핑몰 로고 가운데에 나타나게 한 것   -->
				
			<c:choose>
					<c:when test="${users==null}">
						<td width="33%" align="right"><input type="button"
							onclick="document.location='visitList.do'" value="방문목록"
							class="redBtn"></td>
							onclick="document.location='nEvaluateList.do'" value="평가안한"
							class="redBtn"><input type="button"></c:when>
					
					<c:otherwise>
	
						<td width="33%" align="right"><b>${users.name}</b>${welcome }<input type="button"
							onclick="document.location='logout.do'" value="로그아웃"
							class="redBtn"></td>
					</c:otherwise>
				</c:choose> 
								
		</table>
	</div>

<select name="Score">
<option value="1">★</option>
<option value="2">★★</option>
<option value="3">★★★</option>
<option value="4">★★★★</option>
<option value="5">★★★★★</option>

</select>
</body>
</html>