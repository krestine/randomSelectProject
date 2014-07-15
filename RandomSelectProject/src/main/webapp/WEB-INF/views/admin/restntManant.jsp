<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식당 관리</title>

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true&language=ko">
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
//전역 변수 : 메뉴 관련 기능에서 사용할 restntId
	var geocoder = new google.maps.Geocoder();
	var restntIdforMenu;
	var newMenuId;
	var addMenuFlag = 1;
	var addMenuKey = 0;
	var viewCount = 20;
	var longitude;
	var latitude;
	
	$(document).ready(function() {

		$('#restntList').hide();
		$('#restntInfo').hide();
		$('#newRestnt').hide(); 
	
		//검색 버튼
		$('#serch').click(function() {
			serchMode();
	
		});
	
		// 시/도 셀렉트 박스 기능 정의
		$('#adress1').click(function() {
			addMenuKey = 0;
			addMenuFlag = 1;
			$('#restntList').hide();
			$('#newRestnt').hide(); 
			if($('#adress1').val()!="서울특별시"){
				$('#adress2').empty();	
				$('#adress3').empty();
				$('#adress2').append('<option>서비스 준비중</option>');
				$('#adress3').append('<option>서비스 준비중</option>');
			}
			else{
				
				
				$.ajax({
					cache : false,
					async : false,
					type : 'POST',
					url : 'ajaxAdress2.do',
					data : ('adress1=' + $('#adress1').val()),
					dataType : 'json',
					error : function() {
						alert("error : ajax 통신 실패.");
					},
					success : function(json) {
						$('#adress2').empty();
						for (var idx = 0; idx < json.adress2.length; idx++) {
							var adress2 = json.adress2[idx];
							$('#adress2').append(
											'<option value="'+adress2+'">'
													+ adress2
													+ '</option>');
						}
						$('#adress3').empty();
						$('#adress3').append('<option>시/군/구를 선택하세요</option>');
					}
				});	
			}
			
	
		});
		// 시/군/구 셀렉트 박스 기능 정의
		$('#adress2').click(function() {
			addMenuKey = 0;
			addMenuFlag = 1;
			$('#restntList').hide();
			$('#newRestnt').hide();
			var paramData = {
				adress1 : $('#adress1').val(),
				adress2 : $('#adress2').val()
			};
			if ($('#adress2').val() != '서비스 준비중'){
				if ($('#adress2').val() != '시/도 를 선택하세요') {
					
					$.ajax({
						cache : false,
						async : false,
						type : 'POST',
						url : 'ajaxAdress3.do',
						data : paramData,
						dataType : 'json',
						error : function() {
							alert("error : ajax 통신 실패.");
						},
						success : function(
								json) {
							$('#adress3').empty();
							for (var idx = 0; idx < json.adress3.length; idx++) {
								var adress3 = json.adress3[idx];
		
								$('#adress3').append(
												'<option value="'+adress3+'">'
														+ adress3
														+ '</option>');
							}
		
						}
					});
				}	
			}	
			
		});
		//도로명 선택 셀렉트 박스 기능 정의
		$('#adress3').click(function() {
			drawRestntList();
			
		});
	
	});
	
	
	//관리 버튼 기능 정의
	function clickBtn(obj) {
		
		var paramData = {
			restntId : $(obj).prev().attr("value")
		};

		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxRestntInfo.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
	
			},
			//식당 정보 테이블 그리기
			success : function(json) {
				$("#restntInfoTable > tbody").html("");
				$("#menuTable > tbody").html("");
				$('#selectBox').hide();
				$('#restntList').hide();
				$('#restntInfo').show();
	
				if (json.restntId != '') {
	
					var restntName = json.restntName;
					var restntId = json.restntId;
					var adress1 = json.adress1;
					var adress2 = json.adress2;
					var adress3 = json.adress3;
					var adress4 = json.adress4;
					var adress5 = json.adress5;
					var restntCate = json.restntCate;
					var restntTel = json.restntTel;
					var restntEval = json.restntEval;
					restntIdforMenu = restntId;
					
					var html = '<tbody><form id="restntForm"><input type="hidden" value="'+restntId+'"name="restntId"><input type="hidden" value="'+adress1+'"name="adress1"><input type="hidden" value="'+adress2+'"name="adress2"><input type="hidden" value="'+adress3+'"name="adress3"><tr><th>식당명</th><td><input type="text"value="'+restntName+'" name="restntName"></td></tr>';
					html += '<tr><th>시/도</th><td><label>' + adress1
							+ '</label></td></tr>';
					html += '<tr><th>시/군/구</th><td><label>' + adress2
							+ '</label></td></tr>';
					html += '<tr><th>도로 명</th><td><label>' + adress3
							+ '</label></td></tr>';
					html += '<tr><th>건물번호</th><td><label>' + adress4
							+ '</label></td></tr>';
							
					html += '<tr><th>상세주소</th><td><label>' + adress5
							+ '</label></td></tr>';		
	
					html += '<tr><th>분류</th><td><label>' + restntCate
							+ '</label></td>';
	
					html += '</tr><tr><th>연락처</th><td><input type="text" value="'+restntTel+'"name="restntTel"></td></tr>';
					html += '<tr><th>평균 별점</th><td><label>'
							+ restntEval
							+ '</label></td></tr></form></tbody>';
					
					$('#restntInfoTable').append(html);
	
				}
	
			}
	
		});

		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxMenuList.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
			},
			success : function(json) {
				
				
				var menus = json.menus;
				if(menus!= null){
					
					addMenuFlag = 0;
					
					var html = '<tr><th>메뉴 이름</th><th>가격</th><th>칼로리</th><th>특이사항</th><th colspan="2">수정/삭제</th></tr>';
					$.each(menus,function(key) {
	
						var menuName = menus[key].menuName;
						var menuId = menus[key].menuId;
						var menuPrice = menus[key].menuPrice;
						var menuCalorie = menus[key].menuCalorie;
						var menuNote = menus[key].menuNote;
	
						html += '<tr class="item'+key+'"><form id="menuForm'+key+'"><td><input type="hidden" id="menuId'+key+'" value="'+menuId+'"name="menuId" "class="menuId"><input type="text" value="'+menuName+'"name="menuName" id="menuName'+key+'" class="menuName"></td>';
						html += '<td><input type="text" id="menuPrice'+key+'"  value="'+menuPrice +'"name="menuPrice"></td>';
						html += '<td><input type="text" id="menuCalorie'+key+'" value="'+menuCalorie +'"name="menuCalorie"></td>';
						html += '<td><input type="text" id="menuNote'+key+'" value="'+menuNote +'"name="menuNote"></td></form>';
						html += '<td><button type="button" onclick="addMenuConfirm('+key+')" id="menuModBtn'+key+'">수정</button></td>';
						html += '<td><button type="button" onclick="delMenu('+key+')" id="menuDelBtn'+key+'">삭제</button></td></tr>';
						addMenuKey = key;
					});
					$('#menuTbody').append(html);
					//$('#menuTable').append('</tbody>');
					
				}
			}
		});

	}
	//수정 버튼 기능 정의
	function modRestnt() {
		var paramData = $('#restInfoForm').serialize();

		$.ajax({
					cache : false,
					async : false,
					type : 'POST',
					url : 'ajaxRestntInfoUpdate.do',
					data : paramData,
					dataType : 'json',
					error : function() {
						alert("error : ajax 통신 실패.");
					},
					success : function(json) {
						$("#restntInfoTable > tbody").html("");

						$('#selectBox').hide();
						$('#restntList').hide();
						$('#restntInfo').show();

						if (json.restntId != '') {

							var restntName = json.restntName;
							var restntId = json.restntId;
							var adress1 = json.adress1;
							var adress2 = json.adress2;
							var adress3 = json.adress3;
							var adress4 = json.adress4;
							var restntCate = json.restntCate;
							var restntTel = json.restntTel;
							var restntEval = json.restntEval;
							var html = '<tbody><form id="restntForm"><input type="hidden" value="'+restntId+'"name="restntId"><input type="hidden" value="'+adress1+'"name="adress1"><input type="hidden" value="'+adress2+'"name="adress2"><input type="hidden" value="'+adress3+'"name="adress3"><tr><th>식당명</th><td><input type="text"value="'+restntName+'" name="restntName"></td></tr>';
							html += '<tr><th>시/도</th><td><label>' + adress1
									+ '</label></td></tr>';
							html += '<tr><th>시/군/구</th><td><label>' + adress2
									+ '</label></td></tr>';
							html += '<tr><th>도로 명</th><td><label>' + adress3
									+ '</label></td></tr>';
							html += '<tr><th>상세주소</th><td><label>' + adress4
									+ '</label></td></tr>';

							html += '<tr><th>분류</th><td><label>' + restntCate
									+ '</label><td>';

							html += '</td></tr><tr><th>연락처</th><td><input type="text" value="'+restntTel+'"name="restntTel"></td></tr>';
							html += '<tr><th>평균 별점</th><td><label>'
									+ restntEval
									+ '</label></td></tr></form></tbody>';

							$('#restntInfoTable').append(html);
						}

					}
				});

	}
	//삭제 버튼 기능 정의
	function delRestnt() {
		var paramData = $('#restInfoForm').serialize();
		
		$.ajax({
					cache : false,
					async : false,
					type : 'POST',
					url : 'ajaxRestntInfoDelete.do',
					data : paramData,
					dataType : 'json',
					error : function() {
						alert("error : ajax 통신 실패.");
					},
					success : function(json) {
						var deleteFlag = json.deleteFlag;
						
						if(deleteFlag != 0){
							drawRestntList();	
						}
						else{
							alert('삭제 실패');
						}
						
					}
				});
	}
	
	
	
	
	
	
	
	function addMode() {
		$('#selectBox').hide();
		$('#restntList').hide();
		
		$('#newRestnt').show(); 
		$('#adress1Input').attr("value",$('#adress1').val());
		$('#adress2Input').attr("value",$('#adress2').val());
		$('#adress3Input').attr("value",$('#adress3').val());
	}

	function serchMode() {
		$('#newRestnt').hide();
		$('#restntInfo').hide();
		$('#selectBox').show();
		$('#restntList').show();
		
	}
	
	function addRestnt(){
		var paramData = $('#newRestntInfoForm').serialize();	
		
		$('#selectBox').show(); 
		
		
		
		$('#newRestnt').hide();
		$('#restntList').hide();
		$('#restntInfo').hide();
		$("#restntTable > tbody").html("");
		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxRestntInfoInsert.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
			},
			success : function(json) {
				var insertFlag = json.insertFlag;
				
				if(insertFlag != 0){
					drawRestntList();	
				}
				else{
					alert('추가 실패');
				}
	
			}
		});
					
	}
	function addMenuForm(){
		
			
			$('#addMenu').attr('disabled',true);	
				
			
			
			//alert(restntIdforMenu);
			$.ajax({
				cache : false,
				async : false,
				type : 'POST',
				url : 'ajaxAddMenuForm.do',
				data : ('restntId=' + restntIdforMenu ),
				dataType : 'json',
				error : function() {
					alert("error : ajax 통신 실패.");
				},
				success : function(json) {
					var menuId = json.menuId;
					
					var newitem = '';	
					if(addMenuFlag == 0){
						newitem += '<tr class="item'+(addMenuKey+1)+'"><form id="menuForm'+addMenuKey+'"><td><input id="menuId'+(addMenuKey+1)+'" type="hidden" name="menuId" value="'+menuId+'" class="menuId"><input id="menuName'+(addMenuKey+1)+'" type="text" placeholder="메뉴 이름 입력" name="menuName" class="menuName" ></td>';
			        	newitem += '<td><input id="menuPrice'+(addMenuKey+1)+'" type="text" placeholder="가격 입력" name="menuPrice" ></td>';
			        	newitem += '<td><input id="menuCalorie'+(addMenuKey+1)+'" type="text" placeholder="칼로리 입력"name="menuCalorie" ></td>';
			        	newitem += '<td><input id="menuNote'+(addMenuKey+1)+'" type="text" placeholder="특이 사항 입력" name="menuNote" ></td>';
			        	newitem += '<td><button type="button" id="menuModBtn'+(addMenuKey+1)+'" onclick="addMenuConfirm('+(addMenuKey+1)+');">확인</button></td>';
			        	newitem += '<td><button type="button" id="menuDelBtn'+(addMenuKey+1)+'" onclick="addMenuCancel('+(addMenuKey+1)+')">취소</button></td></form></tr>';
			        	
			        	$("#menuTbody").append(newitem);	
			        	addMenuFlag = 1;
					}
					else{
						newitem += '<tr class="item'+addMenuKey+'"><form id="menuForm'+addMenuKey+'"><td><input id="menuId'+addMenuKey+'" type="hidden" name="menuId" value="'+menuId+'" class="menuId"><input id="menuName'+addMenuKey+'" type="text" placeholder="메뉴 이름 입력" name="menuName" class="menuName" ></td>';
			        	newitem += '<td><input id="menuPrice'+addMenuKey+'" type="text" placeholder="가격 입력" name="menuPrice" ></td>';
			        	newitem += '<td><input id="menuCalorie'+addMenuKey+'" type="text" placeholder="칼로리 입력"name="menuCalorie" ></td>';
			        	newitem += '<td><input id="menuNote'+addMenuKey+'" type="text" placeholder="특이 사항 입력" name="menuNote" ></td>';
			        	newitem += '<td><button type="button" id="menuModBtn'+addMenuKey+'" onclick="addMenuConfirm('+addMenuKey+');">확인</button></td>';
			        	newitem += '<td><button type="button" id="menuDelBtn'+addMenuKey+'" onclick="addMenuCancel('+addMenuKey+')">취소</button></td></form></tr></tbody>';
					
			        	$("#menuTbody").append(newitem);
			        	addMenuFlag = 1;
					}
				}
			});
				
		}
	
		
		
		
	
	
	
	
	function addMenuConfirm(lastItemNo) {
		$('#addMenu').removeAttr('disabled');
		/* alert('menuId:'+$("#menuId"+lastItemNo).val());
		alert('menuName:'+$("#menuName"+lastItemNo).val());
		alert('menuPrice:'+$("#menuPrice"+lastItemNo).val());
		alert('menuCalorie:'+$("#menuCalorie"+lastItemNo).val());
		alert('menuNote:'+$("#menuNote"+lastItemNo).val());
		alert('restntId:'+restntIdforMenu); */
		
		var paramData = {
				menuId : $("#menuId"+lastItemNo).val(),
				menuName : $("#menuName"+lastItemNo).val(),
				menuPrice : $("#menuPrice"+lastItemNo).val(),
				menuCalorie : $("#menuCalorie"+lastItemNo).val(),
				menuNote : $("#menuNote"+lastItemNo).val(),
				restntId : restntIdforMenu
				
			};
		$.ajax({
			
			
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxAddMenuConfirm.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
			},
			success : function(json) {
				$("#menuTable > tbody").html("");
				//
				
				var menus = json.menus;
				if(menus[0].menuId!=''){
					
					addMenuFlag = 0;
					
					var html = '<tr><th>메뉴 이름</th><th>가격</th><th>칼로리</th><th>특이사항</th><th colspan="2">수정/삭제</th></tr>';
					$.each(menus,function(key) {
	
						var menuName = menus[key].menuName;
						var menuId = menus[key].menuId;
						var menuPrice = menus[key].menuPrice;
						var menuCalorie = menus[key].menuCalorie;
						var menuNote = menus[key].menuNote;
	
						html += '<tr class="item'+key+'"><form id="menuForm'+key+'"><td><input type="hidden" id="menuId'+key+'" value="'+menuId+'"name="menuId" "class="menuId"><input type="text" value="'+menuName+'"name="menuName" id="menuName'+key+'" class="menuName"></td>';
						html += '<td><input type="text" id="menuPrice'+key+'"  value="'+menuPrice +'"name="menuPrice"></td>';
						html += '<td><input type="text" id="menuCalorie'+key+'" value="'+menuCalorie +'"name="menuCalorie"></td>';
						html += '<td><input type="text" id="menuNote'+key+'" value="'+menuNote +'"name="menuNote"></td></form>';
						html += '<td><button type="button" onclick="addMenuConfirm('+key+')" id="menuModBtn'+key+'">수정</button></td>';
						html += '<td><button type="button" onclick="delMenu('+key+')" id="menuDelBtn'+key+'">삭제</button></td></tr>';
						addMenuKey = key;
					});
					$('#menuTbody').append(html);
					//$('#menuTable').append('</tbody>');
					
				}
			}
		});
	
	}
	
	function addMenuCancel(lastItemNo){
		$('#addMenu').removeAttr('disabled');
		
		var paramData = {
				menuId : $("#menuId"+lastItemNo).val(),
				restntId : restntIdforMenu
		};
		//alert(paramData);
		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxAddMenuCancel.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
			},
			success : function(json) {
				$("#menuTable > tbody").html("");
				//
				
				
				var menus = json.menus;
				if(menus[0].menuId!=''){
					
					addMenuFlag = 0;
					
					var html = '<tr><th>메뉴 이름</th><th>가격</th><th>칼로리</th><th>특이사항</th><th colspan="2">수정/삭제</th></tr>';
					$.each(menus,function(key) {
	
						var menuName = menus[key].menuName;
						var menuId = menus[key].menuId;
						var menuPrice = menus[key].menuPrice;
						var menuCalorie = menus[key].menuCalorie;
						var menuNote = menus[key].menuNote;
	
						html += '<tr class="item'+key+'"><form id="menuForm'+key+'"><td><input type="hidden" id="menuId'+key+'" value="'+menuId+'"name="menuId" "class="menuId"><input type="text" value="'+menuName+'"name="menuName" id="menuName'+key+'" class="menuName"></td>';
						html += '<td><input type="text" id="menuPrice'+key+'"  value="'+menuPrice +'"name="menuPrice"></td>';
						html += '<td><input type="text" id="menuCalorie'+key+'" value="'+menuCalorie +'"name="menuCalorie"></td>';
						html += '<td><input type="text" id="menuNote'+key+'" value="'+menuNote +'"name="menuNote"></td></form>';
						html += '<td><button type="button" onclick="addMenuConfirm('+key+')" id="menuModBtn'+key+'">수정</button></td>';
						html += '<td><button type="button" onclick="delMenu('+key+')" id="menuDelBtn'+key+'">삭제</button></td></tr>';
						addMenuKey = key;
					});
					$('#menuTbody').append(html);
					//$('#menuTable').append('</tbody>');
					
				}
			}
		});
	}
	 
	function delMenu(lastItemNo) {
		var paramData = {
				menuId : $("#menuId"+lastItemNo).val(),
				restntId : restntIdforMenu
		};
		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxDelMenu.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
			},
			success : function(json) {
				$("#menuTable > tbody").html("");
				//
				var menus = json.menus;
				if(menus[0].menuId!=''){
					
					addMenuFlag = 0;
					
					var html = '<tr><th>메뉴 이름</th><th>가격</th><th>칼로리</th><th>특이사항</th><th colspan="2">수정/삭제</th></tr>';
					$.each(menus,function(key) {
	
						var menuName = menus[key].menuName;
						var menuId = menus[key].menuId;
						var menuPrice = menus[key].menuPrice;
						var menuCalorie = menus[key].menuCalorie;
						var menuNote = menus[key].menuNote;
	
						html += '<tr class="item'+key+'"><form id="menuForm'+key+'"><td><input type="hidden" id="menuId'+key+'" value="'+menuId+'"name="menuId" "class="menuId"><input type="text" value="'+menuName+'"name="menuName" id="menuName'+key+'" class="menuName"></td>';
						html += '<td><input type="text" id="menuPrice'+key+'"  value="'+menuPrice +'"name="menuPrice"></td>';
						html += '<td><input type="text" id="menuCalorie'+key+'" value="'+menuCalorie +'"name="menuCalorie"></td>';
						html += '<td><input type="text" id="menuNote'+key+'" value="'+menuNote +'"name="menuNote"></td></form>';
						html += '<td><button type="button" onclick="addMenuConfirm('+key+')" id="menuModBtn'+key+'">수정</button></td>';
						html += '<td><button type="button" onclick="delMenu('+key+')" id="menuDelBtn'+key+'">삭제</button></td></tr>';
						addMenuKey = key;
					});
					$('#menuTbody').append(html);
					//$('#menuTable').append('</tbody>');
					
				}
			}
		});
	}

	function restntListPage(obj) {
		
		
	
		var paramData = {
				pageNum : parseInt(obj.id),
				viewCount : viewCount, 
				
				adress1 : $('#adress1').val(),
				adress2 : $('#adress2').val(),
				adress3 : $('#adress3').val()
		};
		
		
		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxRestntList.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
			},
			success : function(json){
				addMenuKey = 0;
				addMenuFlag = 1;
				$('#newRestnt').hide();
				$('#restntList').hide();
				$('#restntInfo').hide(); 
				$("#restntTable > tbody").html("");
				
				
				var restnts = json.restnts;
				
				if (restnts != null) {
					$('#restntList').show();
					 var html = '<tr>';
					 
					 $.each(restnts,function(key) {
						var restntName = restnts[key].restntName;
						var restntId = restnts[key].restntId;

						html += '<td>'+ restntName
						+ '</td><td><input type = "hidden" id="restntId'+key+'" name="restntId" value="'+restntId+'" class="restntId"><button id="restntInfo'
						+ key
						+ '" class="restntInfo" onclick="clickBtn(this);">관리</button></td></tr>';

					});
			 		html += '<tr><td colspan=2><button id="addMode" type="button" onclick="addMode()">추가</button></td></tr>';
					$('#restntListResult').append(html);
								 
						

					

				}
				
				

			}
		});
	
	}
	
	function drawRestntList() {
		addMenuKey = 0;
		addMenuFlag = 1;
		$('#newRestnt').hide();
		$('#restntList').hide();
		$('#restntInfo').hide(); 
		$("#restntTable > tbody").html("");
		
		var paramData = {
			viewCount : viewCount,
			pageNum : 1,	
			adress1 : $('#adress1').val(),
			adress2 : $('#adress2').val(),
			adress3 : $('#adress3').val()
		};
		if ($('#adress3').val() != '서비스 준비중'){
			if ($('#adress3').val() != '시/군/구를 선택하세요') {
				
				$.ajax({
					cache : false,
					async : false,
					type : 'POST',
					url : 'ajaxRestntListPaging.do',
					data : paramData,
					dataType : 'json',
					error : function() {
						alert("error : ajax 통신 실패.");
					},
					success : function(json){
						$('#restntList').show();
						$("#restntListPage").html("");
						var totalCount = json.totalCount;
						
						var pageCount = Math.ceil(totalCount / viewCount);
						
						var link = '';
						
						for(var idx = 1; idx <= pageCount; idx++){
							link +=	'<a id="'+idx+'" onclick="restntListPage(this)" >['+idx+']</a>';
						}
						
						
						
						$('#restntListPage').append(link);
						
					}
			 });
				
				
				
				
				
					$.ajax({
						cache : false,
						async : false,
						type : 'POST',
						url : 'ajaxRestntList.do',
						data : paramData,
						dataType : 'json',
						error : function() {
							alert("error : ajax 통신 실패.");
						},
						success : function(json){
		
							var restnts = json.restnts;
		
							if (restnts != null) {
								$('#restntList').show();
								 var html = '<tr>';
								 
								 $.each(restnts,function(key) {
									var restntName = restnts[key].restntName;
									var restntId = restnts[key].restntId;
	
									
											 
									html += '<td>'+ restntName
											+ '</td><td><input type = "hidden" id="restntId'+key+'" name="restntId" value="'+restntId+'" class="restntId"><button id="restntInfo'
											+ key
											+ '" class="restntInfo" onclick="clickBtn(this);">관리</button></td></tr>';
	
								});
								 html += '<tr><td colspan=2><button id="addMode" type="button" onclick="addMode()">추가</button></td></tr>';
								$('#restntListResult').append(html);
		
							}
		
						}
					});
				 
			 }	
		}
		
	}
	
	
	
	

	
	</script>

</head>
<body>
	<button onclick="addressTransfer()">위도, 경도 환산</button>
	<input type="text" id="transTest">
	<button onclick="findLocationTest()">위도, 경도 환산 테스트</button>
	
	<div id="selectBox" align="center" >
		주소 선택<br> <select id="adress1" class="adress1">
			<c:forEach items="${adress1}" var="adress1">

				<option value="${adress1}">${adress1}</option>

			</c:forEach>
		</select> <select id="adress2" class="adress2">
			<option>시/도 를 선택하세요</option>

		</select> <select id="adress3" class="adress3">
			<option>시/군/구를 선택하세요</option>
		</select>
	</div>


	<div id="restntList" align="center">

		<table border="2" id="restntTable" class="table">
			<caption>식당 리스트</caption>
			<tbody id="restntListResult">
			</tbody>

		</table>
		<div id="restntListPage" align="center" ></div>	
	</div>

	<div id="restntInfo" align="center">
		<form id="restInfoForm">
			<table border="2" id="restntInfoTable" class="table">
				<caption>식당 정보</caption>


			</table>
		</form>
		
		<div id="infoButton" align="center">

			<button id="modRestnt" onclick="modRestnt()">수정</button>
			<button id="delRestnt" onclick="delRestnt()">삭제</button>
		</div>
		<br> <br>

		<div id="menuInfo" align="center">
		<table border="2" id="menuTable" style="width: 30%;">
			<caption>메뉴 정보</caption>
			<tbody id="menuTbody">
			</tbody>

		</table>
		</div>
		<button id="addMenu" onclick="addMenuForm()">메뉴 추가</button>
		
		<br>
		<br>
		<button id="serch">주소 검색</button>
	</div>

	<div id="newRestnt" align="center">

		식당 정보 입력
		<form id="newRestntInfoForm">
		<table border="2">
			
			<tbody>
				
				<tr>
					<th>식당명</th>


					<td><input type="text"
						value="${restnt.restntName}" name="restntName" id="restntNameInput" placeholder="식당 이름을 입력하세요"></td>
				</tr>


				<tr>
					<th>주소1</th>

					<td><input type="text" id="adress1Input"
						name="adress1"></td>
				</tr>
				<tr>
					<th>주소2</th>
					<td><input type="text"  id="adress2Input"
						name="adress2"></td>
				</tr>
				<tr>
					<th>주소3</th>
					<td><input type="text"  id="adress3Input"
						name="adress3"></td>
				</tr>
				<tr>
					<th>주소4</th>
					<td><input type="text" name="adress4" id="adress4Input" placeholder="상세 주소를 입력하세요"></td>
				</tr>

				<tr>
					<th>분류</th>
					<td>
						 <select name="restntCate">
							<c:forEach items="${restntCates}" var="menu">
								<c:choose>
									<c:when test="${restnt.restntCate==menu.excMenu}">
										<option selected="selected">${menu.excMenu}</option>
									</c:when>
									<c:otherwise>
										<option>${menu.excMenu}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select>
					</td>
				</tr>

				<tr>
					<th>연락처</th>
					<td><input type="text" 
						name="restntTel" id="restntTelInput" placeholder="전화번호를 입력하세요"></td>
				</tr>

				
				<tr><td><button type="button" onclick="addRestnt();">확인</button></td></tr>




			</tbody>
			
		</table>
		</form>
		<br>
		<br>
		<button onclick="serchMode()">주소 검색</button>
	</div>

	
	

</body>
</html>
