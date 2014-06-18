<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">

$(document).ready(function() {
	$("#idcheck").click(function(){
		alert("성공");
	});
});

</script>

</head>
<body>

<h2>회원가입</h2>

<spring:form action="register.do" commandName="users" method="post">

	이름 : <spring:input path="name" placeholder="홍길동" name="name"/>
			<font color="#FF0000"><spring:errors path="name"/></font><br>
			
	아이디 : <spring:input path="userid" placeholder="abcd" name="userid"/>
			<input type="button" id="idcheck" value="중복확인">
			<font color="#FF0000"><spring:errors path="userid"/></font><br>
			
	비밀번호 : <spring:input type="password" path="password" placeholder="4-15자리"/>
			<font color="#FF0000"><spring:errors path="password"/></font><br>
			
	비밀번호확인 : <spring:input type="password" path="passconfirm" placeholder="비밀번호확인"/>
			<font color="#FF0000"><spring:errors path="passconfirm"/></font><br>
	
	전화번호 : <spring:select path="phonefirst">
					<spring:option value="010"/>
					<spring:option value="011"/>
					<spring:option value="016"/>
					<spring:option value="017"/>
					</spring:select>
					-<spring:input path="phonesecond" placeholder="0000"/>
					-<spring:input path="phonethird" placeholder="0000"/><font color="#FF0000"><spring:errors path="phonethird"/></font><br>
				
	주소 : <spring:input path="address" placeholder="상세주소입력" size="100"/>
	<br><font color="#FF0000"><spring:errors path="address"/></font><br>
	
	직업 : <spring:select path="jobcode">
					<c:forEach var="job" items="${list}">
					<spring:option value="${job.jobcode}">${job.job}</spring:option>
					</c:forEach>
					</spring:select>
					
<input type="submit" value="가입완료(/z/)">
</spring:form>

</body>
</html>