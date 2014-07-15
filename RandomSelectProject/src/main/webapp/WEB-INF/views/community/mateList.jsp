
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(document).ready(function() {
	$('#restntListBtn').click(function() {
		$('#community').attr("action", "restntListProc.do").submit();
		});
});
function mateDetailGo(obj){
	alert($(obj).prev().attr("value"));
	alert($(obj).prev().prev().prev().attr("value"));
	var paramData = {
			mateId : $(obj).prev().attr("value"),
			memId : $(obj).prev().prev().prev().attr("value")
		};

	$.ajax({
		cache : false,
		async : false,
		type : 'post',
		url : 'ajaxMateDetail.do', 
		data : paramData,
		dataType : 'json',
		error : function(){
			alert ("에러 : 데이터가 안넘어갑니다.");
		},
		success : function(json){
			var mateInfo = json.mateInfo;
			var memName=mateInfo.memName;
			var memId = mateInfo.memId;
			var mate = json.mate;
			var infoStatus=mate.infoStatus;
			var html = '<form id="mateDetailForm"><input value="'+memName+'"name="memName"><input value="'+memId+'"name="memId">공유상태<input value="'+infoStatus+'" name="infoStatus"></td></tr>';
			alert(json.mateInfo);
		  $('#mateDetailResult').append(html); 
		}
	});
}
</script>
 <style>
       
    </style>
<title>mateList</title>
</head>
<body>	
<h1>친구리스트</h1>
<div>
	<form id="community" method="post" >
		 <input type="button" class="btn btn-success btn-sm" value="식당 리스트" id="restntListBtn"/>
	</form>

	<c:forEach var="mate" items="${mates}">		
					
						<input type="hidden" value="${mate.memId}" name="memId">				
						<input value="${mate.memName}" class="btn btn-primary btn-sm" name="memName" >
						<input type="hidden" value="${mate.mateId}" name="mateId">
						<input type="button" class="btn btn-success btn-sm" id="mateDetail" onclick="mateDetailGo(this);"value="상세보기">
					<br>
					<div id="mateDetailResult">	
						
					</div>
	</c:forEach>
</div>
</body>
</html>
