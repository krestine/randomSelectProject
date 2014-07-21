
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
	restntList();

		function restntList(){
			$.ajax({
			cache : false,
			async : false,
			type : 'post',
			url : 'ajaxRestntListProc.do',
			data : $('form').serialize(),
			dataType : 'json',
			error : function(){
				alert ("에러 : 데이터가 안넘어갑니다.");
			},
			success : function(json){
				var lists=json.restnts; 
				var temp = "<thead><tr><td class='listth' ></td>"+"<td class='listth'></td></tr></thead>";
					 for (var i=0; i< lists.length; i++) {
					temp += '<tr><td class="listtd" align="center">'+'<input type="hidden" value="'+lists[i].mateId+'" name="mateId"><input type="hidden" value="'+lists[i].restntId+'" name="restntId"><input type="button" value="'+ lists[i].restntName +'"class="btn btn-info btn-sm" disabled="disabled"><input type="button" value="'+lists[i].score+'"class="btn btn-info btn-sm" disabled="disabled"><input type="button" class="btn btn-success btn-sm" value="상세보기" id="restntDetail" onclick="restntDetailGo(this);"data-toggle="modal" data-target="#restntDetailResult">'+'</td></tr>';
					
					}
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
		
		
		$('#mateListBtn').click(function() {
			$('#community').attr("action", "mateListProc.do").submit();
		});
	
});

	function restntDetailGo(obj){
	
	
	var paramData = {
			restntId : $(obj).prev().prev().prev().attr("value")
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
			var html = '<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h4 class="modal-title"><h4>"'+restntName+'"<small>의 상세정보</small></h4><form id="restntDetailForm"><table class="table"><input value="식당이름"><input value="식당평점"><br><input value="'+restntName+'"name="restntName"><input value="'+restntEval+'"name="restntEval"><br><input value="카테고리"><input value="전화번호"><br><input value="'+restntCate+'" name="restntCate"><input value="'+restntTel+'"name="restntTel"></table></form><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">확인</button></div></div></div></div>';
			
		 	 $('#restntDetailResult').html(html); 
		}
	});
}

</script>
<style type="text/css">
.clickable {cursor: pointer;}
.hover {text-decoration: underline;}
.odd{ background: #B4E5FF;}
.even{ background: #E1F6FA;}
.active{ width:10px; height:10px; background:#f60; color:white;}
</style>
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
		
	<table class="table paginated" id="tbl" style="width:50%;" align="center">
		<td colspan="1" align="center"><h5>친구들이 평가한 식당리스트</h5></td>	
	</table>	
	<c:forEach var="restnt" items="${restnts}">
				<form id="restntListForm">		
						<input type="hidden" value="${restnt.mateId }" name="mateId">
						<input type="hidden" value="${restnt.restntId }" name="restntId">
				</form>							
		</c:forEach>
		
		<div class="modal fade" id="restntDetailResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		</div>
			
</div>				
</div>
</div>
</div>
</body>

</html>
