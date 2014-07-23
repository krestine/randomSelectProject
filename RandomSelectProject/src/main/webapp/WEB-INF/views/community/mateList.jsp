<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8 initial-scale=1.0" />


<script>

$(document).ready(function() {
	mateList();
	function mateList(){
			
		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxMateList.do',
			data : $('form').serialize(),
			dataType : 'json',
			error : function(){
				alert ("에러 : 데이터가 안넘어갑니다.");
			},
			success : function(json){
					
					var lists=json.mates; 
					var temp = "<thead><tr><td class='listth' align='center'></td></tr></thead>";
						 for (var i=0; i< lists.length; i++) {
						temp += '<tr><td class="listtd" align="center">'+'<input type="hidden" value="'+lists[i].memId+'" name="memId"><input type="hidden" value="'+lists[i].mateId+'" name="mateId"><input type="button" value="'+ lists[i].memName +'"class="btn btn-info btn-sm" disabled="disabled" style="float:left;"><input type="button" class="btn btn-info btn-sm"  value="상세보기"style="float:right;" onclick="mateDetail(this);" data-toggle="modal" data-target="#mateDetailResult"></div>'+'</td></tr>';
						
						}
 						
						
					/* $.each(lists, function(key){
						var mateName = mateName[key].mateName;
						var mateId = mateId[key].mateId;
						
						temp += '<tr><td class="listtd">'+mateName+'</t><td><input type="hidden" id="mateId'+key+'" name="mateId" value="'+mateId+'"><input type="button" id="mateName'+key+'"name="mateName" value="'+mateName+'" class="btn btn-info btn-sm"></td></tr>';
					 
					
					});*/ 
					
					$("#tbl").html(temp);
					
					page();
				
			}
		});
		
	} 
	
	// 만들어진 테이블에 페이지 처리
	function page(){
		var reSortColors = function($table){
			$('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
			  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
			 };
			 $('table.paginated').each(function() {
			  var pagesu = 10;  //페이지 번호 갯수
			  var currentPage = 0;
			  var numPerPage = 10;  //목록의 수
			  var $table = $(this);    
			  
			  //length로 원래 리스트의 전체길이구함
			  var numRows = $table.find('tbody tr').length;
			  //Math.ceil를 이용하여 반올림
			  var numPages = Math.ceil(numRows / numPerPage);
			  //리스트가 없으면 종료
			  if (numPages==0) return;
			  //pager라는 클래스의 div엘리먼트 작성
			  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
			  
			  var nowp = currentPage;
			  var endp = nowp+10;
			  
			  //페이지를 클릭하면 다시 셋팅
			  $table.bind('repaginate', function() {
			  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			  
			   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
			   $("#remo").html("");
			   
			   if (numPages > 1) {     // 한페이지 이상이면
			    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
			     nowp = 0;     // 1부터 
			     endp = pagesu;    // 10까지
			    }else{
			     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
			     endp = nowp+pagesu;   // 10까지
			     pi = 1;
			    }
			    
			    if (numPages < endp) {   // 10페이지가 안되면
			     endp = numPages;   // 마지막페이지를 갯수 만큼
			     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
			    }
			    if (nowp < 1) {     // 시작이 음수 or 0 이면
			     nowp = 0;     // 1페이지부터 시작
			    }
			   }else{       // 한페이지 이하이면
			    nowp = 0;      // 한번만 페이징 생성
			    endp = numPages;
			   }
			   // [처음]
			   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
			          currentPage = 0;   
			          $table.trigger('repaginate');  
			          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
			      }).appendTo($pager).addClass('clickable');
			    // [이전]
			      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
			          if(currentPage == 0) return; 
			          currentPage = currentPage-1;
			    $table.trigger('repaginate'); 
			    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			    // [1,2,3,4,5,6,7,8]
			   for (var page = nowp ; page < endp; page++) {
			    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
			     currentPage = event.data['newPage'];
			     $table.trigger('repaginate');
			     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			     }).appendTo($pager).addClass('clickable');
			   } 
			    // [다음]
			      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
			    if(currentPage == numPages-1) return;
			        currentPage = currentPage+1;
			    $table.trigger('repaginate'); 
			     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			    // [끝]
			   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
			           currentPage = numPages-1;
			           $table.trigger('repaginate');
			           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
			   }).appendTo($pager).addClass('clickable');
			     
			     $($(".page-number")[2]).addClass('active');
			reSortColors($table);
			  });
			   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
			   $pager.appendTo($table);
			   $table.trigger('repaginate');
			 });
			}
		
	
		
	
});	


function mateDetail(obj){


var paramData = {
			mateId : $(obj).prev().prev().attr("value"),
			memId : $(obj).prev().prev().attr("value"),
			
		}; 

	$.ajax({
		cache : false,
		async : false,
		type : 'post',
		url : 'ajaxMateDetail.do', 
		//data : $('form').serialize(),
		data : paramData,
		dataType : 'json',
		error : function(){
			alert ("에러 : 데이터가 안넘어갑니다.");
		},
		success : function(json){
		
			var mateInfo = json.mateInfo;
			var memName=mateInfo.memName;
			var memId = mateInfo.memId;
			var memGrade = mateInfo.memGrade;
			var memBirth = mateInfo.memBirth;
			var infoStatus=mateInfo.infoStatus;
			var mateStatus=mateInfo.mateStatus;
			var html = '<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h4 class="modal-title"><h4>"'+memName+'"님의 상세정보<br><table class="table" align="center"><input value="친구이름"><input value="친구아이디"><br><input value="'+memName+'"name="memName"><input value="'+memId+'"name="memId"><br><input value="생일"><input value="등급"><br><input value="'+memBirth+'" name="memBirth"><input value="'+memGrade+'" name="memGrade"></table><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">확인</button></div></div></div>';
		 	$('#mateDetailResult').html(html); 
		}
	});
}


</script>
<style type="text/css">
.clickable {cursor: pointer;}
.hover {text-decoration: underline;}
.odd{ background: #E8F5FF;}
.even{ background: #E1F6FA;}
.active{ width:10px; height:10px; background:#C8C8FF; color:white;}
</style>
<title>mateList</title>
</head>
<body>	
<div class="row">
<div class="col-md-12"><a href="mateListProc.do"><img src="/myapp/resources/img/community.png" style="width:100%;"></a></div>	
</div>

	
	<div align="center">
	<h4>친구리스트</h4>
	<table class="table paginated" id="tbl" style="width:30%;" align="center">	
				
		</table>	
	<c:forEach var="mate" items="${mates}">		
					<form id="mateName">
						<input type="hidden" value="${mate.memId}" name="memId">
						<input type="hidden" value="${mate.mateId}" name="mateId">
										
					</form>				
	</c:forEach>
		
	<div class="modal fade" id="mateDetailResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						
	</div>
	</div>			
						

</body>
</html>
