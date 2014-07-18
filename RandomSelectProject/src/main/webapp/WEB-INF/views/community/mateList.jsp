
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var viewCount = 10;


$(document).ready(function(){
	function mateListPageInit() {
		var paramData= {
				pageNum : 1,
				viewCount : viewCount,
				memId : $('#memId').val()			
		};
		$ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxMateList.do',
			data : paramData,
			dataType : 'json',
			error : function()	{
				alert("error : ajax 통신 실패.");
			}, 
			success : function(json){
				var mates = json.mates;
				if(restnts != null){
					$('#mateList').show();		
					var html= '<tr>';
					
					$.each(mates, function(key){
						var mateName = mateName[key].mateName;
					});
					html=$('#mateList').html(html);
				}
			}
		});	
	} 
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


	$('#restntListBtn').click(function() {
		$('#community').attr("action", "restntListProc.do").submit();
		});

</script>
 <style>
       body{
	font-size: 12px;
	font-size: 1rem;
	font-family: 'Nanum Gothic', Helvetica, Arial, sans-serif;
	text-rendering: optimizeLegibility;
	color: #444;
}
    </style>
<title>mateList</title>
</head>
<body>	

 <div class="container">
<div class="row">
<div class="span5">
	<form id="community" method="post" >
		 <input type="button" class="btn btn-success btn-sm" value="식당 리스트" id="restntListBtn"/>
	</form>
<div align="center">	
			<table border=1>
					
					<tr>	
						<td align="center"><h5>친구리스트</h5></td>
					</tr>
					<tr>
						<td align="center" class="btn btn-primary btn-sm" disabled="disabled"style="width: 100%">이름</td>
					</tr>
				<c:forEach var="mate" items="${mates}">		
					<tr>
						<td>
						<input type="hidden" value="${mate.memId}" name="memId">
						<input type="hidden" value="${mate.mateId}" name="mateId">				
						<input type="button"value="${mate.memName}" id="mateName" class="btn btn-info btn-sm" name="memName" onclick="mateDetailGo(this);"value="상세보기"class="btn btn-danger" 
						data-toggle="modal" data-target="#mateDetailResult" style="width:100%"></td>
					</tr>	
				
						
					<div class="modal fade" id="mateDetailResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					</div>	
				</c:forEach>
			</table>
</div>
</div>
</div>
</div>
</body>
</html>
