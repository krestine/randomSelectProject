<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 명단</title>
</head>
<body>
	회원 아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///    회원 이름                  ///     회원 등급                    ///     블랙 리스트
	<br>
	<c:forEach items="${members}" var="member" >
	${member.memId} /// ${member.memName}&nbsp;&nbsp;&nbsp;&nbsp; /// &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${member.memGrade}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/// ${member.black} 
	<br>
	</c:forEach>
</body>
</html>