<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>restntDetail</title>
</head>
<body>
<h1>restntDetail</h1>

${restnt.restntName } ${restnt.restntEval } ${restnt.restntMenu } ${restnt.restnt } ${restnt.restntCate }
${restnt.restntTel } ${restnt.restntAddr }
<c:forEach var="restnt" items="${restnts}" >
        ${restnt.restntName} <a href="restntDetail.do?restntId=${restnt.restntName}"></a> <br>
        ${restnt.restntEval} <a href="restntDetail.do?restntId=${restnt.restntEval}"></a>
        
        <hr>
    </c:forEach>

<a href="restntDetail.do?restntId=${restnt.restntId}">식당상세</a>

<a href="restntListProc.do">리스트로</a>
</body>
</html>