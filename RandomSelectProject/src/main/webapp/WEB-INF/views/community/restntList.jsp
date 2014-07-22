
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script>
$(document).ready(function() {
	
/* function restntList(){
		$.ajax({
			cache : false,
			async : false,
			type : 'post',
			url : 'ajaxRestntList.do',
			data : $('form').serialize(),
			dataType : 'json',
			error : function(){
				alert ("에러 : 데이터가 안넘어갑니다.");
			},
			success : function(json){
				alert("성공?");
			}
	})
}
 */	
	
	$('#mateListBtn').click(function() {
		$('#community').attr("action", "mateListProc.do").submit();
	});
});

function restntDetailGo(obj){
	
	
	var paramData = {
			restntId : $(obj).prev().prev().prev()	.attr("value")
	};
	$.ajax({
		
		cache : false,
		async : false,
		type : 'post',
		url : 'ajaxRestntDetail.do', 
		data : paramData,
		dataType : 'json',
		error : function(){
			alert ("에러 : 데이터가 안넘어갑니다.");
		},
		success : function(json){
			
			var restnt = json.restnt;
			var restntName=restnt.restntName;
			var restntEval = restnt.restntEval;
			var restntCate = restnt.restntCate;
			var restntTel = restnt.restntTel;
			
			var menuInfo = json.menuInfo;
			var menuName=menuInfo.menuName;
			var menuPrice=menuInfo.menuPrice;
			var menuCalorie=menuInfo.menuCalroie;
			var html = '<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h4 class="modal-title"><h4>"'+restntName+'"<small>의 상세정보</small></h4><form id="restntDetailForm"><table class="table"><input value="식당이름"><input value="식당평점"><br><input value="'+restntName+'"name="restntName"><input value="'+restntEval+'"name="restntEval"><br><input value="카테고리"><input value="전화번호"><br><input value="'+restntCate+'" name="restntCate"><input value="'+restntTel+'"name="restntTel"><br><br><h4>"'+restntName+'"<small>의 메뉴정보</small></h4><br><input value="메뉴이름"><input value="가격"><input value="칼로리"><br><input value="'+menuName+'"name="menuName"><input value="'+menuPrice+'"name="menuPrice"><input value="'+menuCalorie+'"name="menuCalorie"></table></form><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">확인</button></div></div></div></div>';
			
		 	 $('#restntDetailResult').html(html); 
		}
	});
}

</script>
<title>식당리스트</title>
</head>

<body>

<div class="container">
<div class="row">
<div class="span5">	
	<form id="community" method="post" >
		 <input type="button" class="btn btn-success btn-sm" value="친구 리스트" id="mateListBtn"/>
	</form>
	<div align="center">
		
	<table border=1>
	<tr>
		<td colspan="1" align="center"><h5>친구들이 평가한 식당리스트</h5></td>
	</tr>
				
			<tr>	
				<th><input value="식당이름"disabled="disabled" class="btn btn-primary btn-sm">
				<input value="평균별점"disabled="disabled" class="btn btn-primary btn-sm" >
				
				</th>
				
			</tr>
	<c:forEach var="restnt" items="${restnts}">
				<tr>
				<td>		
						<input type="hidden" value="${restnt.mateId }" name="mateId">
						<input type="hidden" value="${restnt.restntId }" name="restntId">
						<input class="btn btn-info btn-sm" disabled="disabled"value="${restnt.restntName}" name="restntName">
						<input class="btn btn-info btn-sm" disabled="disabled" value="${restnt.score}" name="score">
						<input type="button" class="btn btn-success btn-sm" value="상세보기" id="restntDetail" onclick="restntDetailGo(this);" 
						data-toggle="modal" data-target="#restntDetailResult"></td>
						</tr>

						
						<div class="modal fade" id="restntDetailResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						
						</div>
		</c:forEach>
	</table>
</div>				
</div>
</div>
</div>
</body>

</html>
