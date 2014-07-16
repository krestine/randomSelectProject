
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
	
	
	var paramData = {
			mateId : $(obj).prev().attr("value"),
			memId : $(obj).prev().prev().attr("value")
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
			$('#mateDetailResult').empty();
			
			var mateInfo = json.mateInfo;
			var memName=mateInfo.memName;
			var memId = mateInfo.memId;
			var mate = json.mate;
			var infoStatus=mate.infoStatus;
			var html = '<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h4 class="modal-title">"'+memName+'"님의 상세정보</h4></div><div class="modal-body"><table class="table"><input value="친구이름"><input value="친구아이디"><br><input value="'+memName+'"name="memName"><input value="'+memId+'"name="memId"><br><input value="상태정보"><br><input value="'+infoStatus+'" name="infoStatus"></table></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">확인</button></div></div></div</div>';
		 	$('#mateDetailResult').html(html); 
		}
	});
}
</script>
 <style>
       
    </style>
<title>mateList</title>
</head>
<body>	
<h3>친구리스트</h3>
<div container>
	<form id="community" method="post" >
		 <input type="button" class="btn btn-success btn-sm" value="식당 리스트" id="restntListBtn"/>
	</form>

	<c:forEach var="mate" items="${mates}">		
					<form id="mateName">
						<input type="hidden" value="${mate.memId}" name="memId">
						<input type="hidden" value="${mate.mateId}" name="mateId">				
						<input type="button "value="${mate.memName}" id="mateName" class="btn btn-primary btn-sm" name="memName" onclick="mateDetailGo(this);"value="상세보기"class="btn btn-danger" 
						data-toggle="modal" data-target="#mateDetailResult">
						
						
						
					</form>
					<br>	
					<div class="modal fade" id="mateDetailResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					</div>	
	</c:forEach>
	
</div>
</body>
</html>
