
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script>
$(document).ready(function() {
	$('#mateDetail')
	.click(function(){
		
		$.ajax({
			cache : false,
			async : false,
			type : 'post',
			url : 'ajaxMateDetail.do', 
			data : ('mateDetail='+ $('#mateDetail').val()),
			dataType : 'json',
			error : function(){
				alert ("에러 : 데이터가 안넘어갑니다.");
			},
			success : function(json){
				var mateInfo = json.mateInfo;
				var mate = json2.mate;
				var html = <form id="mateDetailForm">
				<input value="'+memName+'"name="memName">
				<input value="'+memId+'"name="memId">
				<tr><th>공유상태</th><td><input value="'+infoStatus+'" name="infoStatus"></td></tr>;
				alert("요기?");
				$('#mateDetail').html(html);
			}
		});

	});
	
	$('#restntListBtn').click(function() {
		$('#community').attr("action", "restntListProc.do").submit();
	});

});
</script>
 <style>
       
    </style>
<title>mateList</title>
</head>
<body>
	
	
	<h4>친구리스트</h4>
		<form id="community" method="post">
			<input type="button" class="btn btn-success btn-sm" value="식당 리스트"
				id="restntListBtn" />
		</form>
		
		<c:forEach var="mate" items="${mates}">		
   			<form action="mateDetailProc.do" method="post">
				<input type="hidden" value="${mate.memId}" name="memId"> 
				<input type="button" class="btn btn-primary btn-sm" value="${mate.memName}" name="memName" >  
				<input type="hidden" value="${mate.mateId}" name="mateId">
				<input type="button" class="btn btn-success btn-sm" value="상세보기" data-toggle="collapse" data-target="#mateDetail">
			</form>								
		</c:forEach>
		
		<form id="community" method="post">
		<input type="button" class="btn btn-success btn-sm" value="친구 리스트" id="mateListBtn" />
		<input type="button" class="btn btn-success btn-sm" value="식당 리스트" id="restntListBtn"/>
		</form>
		<br>
		<div id="mateDetail" class="collapse">
		<h4>${mateInfo.memName }<small>님의 상세정보</small></h4>
		<br>
		
		<form id="mateDetail" action="mateDetailProc.do" method="post" >
			<input value="친구이름">
			<input value="친구아이디">
			<input value="친구등급"><br>
			
			<input value="${mateInfo.memName }" name="memName">
			<input value="${mateInfo.memId}" name="memId">
			<input value="${mateInfo.memGrade}" name="memGrade"><br>
			
			
			<br>
			<input value="공유상태">
			<input value="친구관계"><br>	
			<input value="${mate.infoStatus}" name="infoStatus">			
			<input value="${mate.mateStatus}" name="mateStatus">	
		</form>
			<br>	
</div>
		

</body>
</html>
