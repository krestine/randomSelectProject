
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
$('#mateDetail')
.click(function(){
	$('#mateDetail').hide();
	$.ajax({
	cache : false,
	async : false,
	type :'POST',
	url : 'ajaxMateDetail.do', 
	data : ('mateDetail='+ $('#mateDetail').val()),
	dataType : 'json',
	error : function(){
		alert ("에러 : 데이터가 안넘어갑니다.");
	},
	success : function(json){
		$('#mateDetail').show();
	}
})
if (json.mateId != '') {

	var memName = json.memName;
	var memId = json.memId;
	var memGrade = json.memGrade;
	var infoStatus = json.infoStatus;
	var mateStatus = json.mateStatus;
	var html = 
}); 


$(document).ready(function() {
	$('#restntListBtn').click(function() {
		$('#community').attr("action", "restntListProc.do").submit();
	});

});


</script>
<title>mateList</title>
</head>
<body>


	<h4>친구리스트</h4>
<div>	
	<form id="community" method="post" >
		 <input type="button" class="btn btn-success btn-sm" value="식당 리스트" id="restntListBtn"/>
	</form>
	


	<c:forEach var="mate" items="${mates}">		
					<form action="mateDetailProc.do" method="post">
						<input type="hidden" value="${mate.memId}" name="memId">			
						<input value="${mate.memName}" name="memName">
						<input value="${mate.mateId}" name="mateId">
						<input type="submit" class="btn btn-success btn-sm" value="상세보기">
					</form>
					<br>
	</c:forEach>
</div>		
</body>
</html>
