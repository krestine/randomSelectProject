<%@page import="java.util.List"%>
<%@page import="com.project.domain.RestntDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css' rel='stylesheet' type='text/css' />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
html {
	height: 100%;
}

body{
	font-family: 'Nanum Gothic', Helvetica, Arial, sans-serif;
	text-rendering: optimizeLegibility;
}

body,.container {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
  
<script type="text/javascript">
	var myLatitude, myLongitude, myLocation, myRestntName, myRestntId;
	var myAddress = new Array(10);
	var myInfoWindow = new google.maps.InfoWindow();
	var randomLatitude, randomLongitude;
	var map, myMarker, excMenu;
	var restntList;
	var pos, pos2;
	var sRadius;
	var login=1, isinit=0;
	var myLocationManual=0;
	var geocoder = new google.maps.Geocoder();
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	
	var restntImage1 = "http://www.googledrive.com/host/0B1_N1p_Ulcy_YV9sQldSU19ZLTQ";
	var restntImage2 = "http://www.googledrive.com/host/0B1_N1p_Ulcy_RTJnQ09sY0hQLXM";
	var markerImage1 = "http://www.googledrive.com/host/0B1_N1p_Ulcy_Ni15YkJId3lxUTg";
	
	var tempOKLatitude = new Array(100);
	var tempOKLongitude = new Array(100);
	var tempOKName = new Array(100);
	var tempOKId = new Array(100);
	
	var tempRestntMarker = new Array(100);
	var tempRestntInfoArray = new Array(100);
	
/* 	google.maps.event.addListener(map, 'bounds_changed', function(){
		map.setCenter(pos);
	}); */
	
	function visitList(){
		if(login==1){
			document.getElementById("visitList").action = "visitList.do";
			document.getElementById("visitList").submit();
		}
	}

	function ajaxRandomRestnt(obj) {

		if(isinit==0){
			 initialize();
			 myInfoWindow.close();
		}
		isinit=0;
		
		var tempDistance = 0;
		var tempCnt = 0;
		var tempRestntLatitude;
		var tempRestntLongitude
		var tempRestntName;
		var tempRestntId;

		var paramData = {
			adress1 : myAddress[1],
			adress2 : myAddress[2],
			adress3 : sRadius,
			adress4 : excMenu,
			latitude : myLatitude,
			longitude : myLongitude
		};

		$.ajax({
			cache : false,
			async : false,
			type : 'POST',
			url : 'ajaxRandomRestnt.do',
			data : paramData,
			dataType : 'json',
			error : function() {
				alert("error : ajax 통신 실패.");
			},
			success : function(json) {
				$("#restntTable > tbody").html("");
				var restnts = json.restnts;

				if (restnts != null) {
					
					$.each(restnts, function(key) {
									  
									  
									  
						tempRestntLatitude = restnts[key].latitude;
						tempRestntLongitude = restnts[key].longitude;
						tempRestntName = restnts[key].restntName;
						tempRestntId = restnts[key].restntId;

						tempDistance = calcDistance(myLatitude, myLongitude,
								tempRestntLatitude, tempRestntLongitude);

						if (tempDistance < sRadius) {
							
							tempOKLatitude[tempCnt] = tempRestntLatitude;
							tempOKLongitude[tempCnt] = tempRestntLongitude;
							tempOKName[tempCnt] = tempRestntName;
							tempOKId[tempCnt] = tempRestntId;

							var tempRestntPos = new google.maps.LatLng(
									tempRestntLatitude, tempRestntLongitude);
							
							//setTimeout(function() {
								
							tempRestntMarker[tempCnt] = new google.maps.Marker(
									{
										position : tempRestntPos,
										map : map,
										animation : google.maps.Animation.DROP,
										title : tempRestntName,
										restntId : tempRestntId
									});
							
										  tempRestntMarker[tempCnt].setMap(map);
										  markerEventParam=tempCnt;
										  
										  google.maps.event.addListener(tempRestntMarker[tempCnt], 'click', function(tempCnt) {
										      return function() {
										          //alert(tempRestntMarker[tempCnt].restntId);
										          
										          
										          
										          
										          
										      	var paramData = {
										    			restntId : tempRestntMarker[tempCnt].restntId
										    		};

										    	$.ajax({
										    		cache : false,
										    		async : false,
										    		type : 'post',
										    		url : 'ajaxRandomRestntDetail.do', 
										    		data : paramData,
										    		dataType : 'json',
										    		error : function(){
										    			alert ("에러 : 데이터가 안넘어갑니다.");
										    		},
										    		success : function(json){
										    			
										    			$('#randomRestntDetailResult').empty();
										    			
										    			var restntName = json.restntName;
										    			var restntAddress = json.adress1 + ' ' + json.adress2 + ' ' + json.adress3 + ' ' + json.adress4 + ' ' + json.adress5;
										    			var restntTel = json.restntTel;
										    			var restntCate = json.restntCate;
										    			var restntEval = json.restntEval;
										    			
										    			var html = '<div class="modal-dialog"><div class="modal-content"><div class="modal-header">'
										    			html+='<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'
										    			html+='<h4 class="modal-title">식당 상세정보</h4></div><div class="modal-body"><table class="table">'
										    			html+='<tr><td align="center" class="btn btn-primary" style="width: 100%">식당이름</td></tr><tr><td><input value="'+restntName+'"name="restntName" style="width: 100%"></td></tr>'
										    			html+='<tr><td align="center" class="btn btn-primary" style="width: 100%">식당종류</td></td></tr><tr><td><input value="'+restntCate+'"name="restntCate" style="width: 100%"></td></tr>'
										    			html+='<tr><td align="center" class="btn btn-primary" style="width: 100%">식당전화번호</td></tr><tr><td><input value="'+restntTel+'"name="restntTel" style="width: 100%"></td></tr>'
										    			html+='<tr><td align="center" class="btn btn-primary" style="width: 100%">식당평점</td></tr><tr><td><input value="'+restntEval+'"name="restntEval" style="width: 100%"></td></tr>'
										    			html+='<tr><td align="center" class="btn btn-primary" style="width: 100%">식당주소</td></tr>'
										    			html+='<tr><td><input value="'+restntAddress+'" name="restntAddress" style="width: 100%"></td></tr></table></div>'
										    			html+='<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">확인</button></div></div></div</div>';
										    		 	$('#randomRestntDetailResult').html(html); 
										    		}
										    	});
										    	
										    	$('#randomRestntDetailResult').modal({
										    		  keyboard: true
										    		});
								    	
										      }
										    }(tempCnt));
										  
										  //google.maps.event.addListener(tempRestntMarker[tempCnt], 'click', markerEvent);
										  
							//},tempCnt*100);
										  
							tempCnt = tempCnt + 1;

						}
						
						
						

					});

					//setTimeout(function() {
					
					var selection = Math.floor(Math.random() * tempCnt);

					tempRestntLatitude = tempOKLatitude[selection];
					tempRestntLongitude = tempOKLongitude[selection];
					tempRestntName = tempOKName[selection];
					tempRestntId = tempOKId[selection];

					tempRestntMarker[selection].setIcon(restntImage2);
					tempRestntMarker[selection]
							.setAnimation(google.maps.Animation.BOUNCE);
					myInfoWindow.close();

					var tempRestntInfo = new google.maps.InfoWindow();
					tempRestntInfo.setContent("오늘의 식당 : " + tempRestntName);
					tempRestntInfo.open(map, tempRestntMarker[selection]);

					myRestntName = tempRestntName;
					myRestntId = tempRestntId;
					
					//},(tempCnt+10)*100);

					//calcRoute(tempRestntLatitude, tempRestntLongitude);

				}

			}
		});

	}

	function confirmRestnt() {

		if (login == 1) {

			var paramData = {
				restntId : myRestntId
			};

			$.ajax({
				cache : false,
				async : false,
				type : 'POST',
				url : 'ajaxConfirmRestnt.do',
				data : paramData,
				dataType : 'json',
				error : function() {
					alert("에러 : 데이터가 안넘어갑니다.");
				},
				success : function(json) {

					if (json.restntId != '') {

						var html = '식당 방문정보가 추가되었습니다.';
						$('#restntConfirmed').html(html);

					}

				}
			});
		} else {
			var html = '<font color=red>식당 방문정보 기능을 이용하시려면 로그인을 해 주세요.</font>';
			$('#restntConfirmed').html(html);
		}
	}

	function showCurrentLocation(Lat, Lon) {
		$("#currentLocation").html(Lat + ' ' + Lon);
	}

	function calcRoute(tempRestntLatitude, tempRestntLongitude) {
		var start = new google.maps.LatLng(myLatitude, myLongitude);
		var end = new google.maps.LatLng(tempRestntLatitude,
				tempRestntLongitude);
		var request = {
			origin : start,
			destination : end,
			travelMode : google.maps.TravelMode.WALKING
		};
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				alert("direction service success");
				directionsDisplay.setDirections(response);
			}
		});
	}

	function calcDistance(lat1, lon1, lat2, lon2) {
		var EARTH_R, Rad, radLat1, radLat2, radDist;
		var distance, ret;

		EARTH_R = 6371000.0;
		Rad = Math.PI / 180;
		radLat1 = Rad * lat1;
		radLat2 = Rad * lat2;
		radDist = Rad * (lon1 - lon2);

		distance = Math.sin(radLat1) * Math.sin(radLat2);
		distance = distance + Math.cos(radLat1) * Math.cos(radLat2)
				* Math.cos(radDist);
		ret = EARTH_R * Math.acos(distance);

		return Math.round(ret);
	}
	
	function setMyCenter() {
		//map.setCenter(latlng) = 설정된 위치로 맵 중심 이동
		//map.setZoom(Int) = 설정된 숫자값으로 맵 확대율 조정
		map.setCenter(pos);
		myInfoWindow.setContent('내 위치 : ' + myLocation);
		myInfoWindow.open(map, myMarker);
		map.setZoom(18);
	}

	function newMyLocation() {
		var newMyAddress = document.getElementById('newMyAddress').value;
			
			geocoder.geocode({
				'address' : newMyAddress
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					myLocationManual=1;
					$("#accuracyAlert").empty();
					$.cookie('newLatitude', results[0].geometry.location.lat(),  {expires: 1});
					$.cookie('newLongitude', results[0].geometry.location.lng(), {expires: 1});
					onSuccess(results[0].geometry.location.lat(),
							results[0].geometry.location.lng(), 10);
				} else {
					$("#deleteMyLocationAlert").html('<h4><span class="label label-danger">입력한 주소에 해당하는 좌표가 없습니다.</span></h4>');
					setTimeout(removeDeleteMyLocationAlert, 3000);
				}
			});
	}

	function setSRadius() {
		var tempSRadius = "<c:out value="${loginUser.memWalkRange}" />";
		var tempExcMenu = "<c:out value="${loginUser.memExcMenu}" />";
		tempSRadius = Number(tempSRadius);
		if (tempSRadius == 0) {
			tempSRadius = 200;
			login = 0;
		}
		if(tempExcMenu==""){
			tempExcMen="00000000000000";
			login=0;
		}
		sRadius = tempSRadius;
		excMenu = tempExcMenu;
		//alert(sRadius);
	}

	function deleteMyLocation(){
		$.cookie('newLatitude', "deleted");
		$.cookie('newLongitude', "deleted");
		$("#deleteMyLocationAlert").html('<h4><span class="label label-success">초기화되었습니다.</span></h4>');
		setTimeout(removeDeleteMyLocationAlert, 3000);
	}
	
	function removeDeleteMyLocationAlert(){
		$("#deleteMyLocationAlert").html("");
	}
	
	function onSuccess(Lat, Lon, accuracy) {

		//alert('onSuccess');
		//var objDiv = document.getElementById("newMyLocationForm");

		myLatitude = Lat;
		myLongitude = Lon;
		cookieLatitude = $.cookie('newLatitude');
		cookieLongitude = $.cookie('newLongitude');
		pos = new google.maps.LatLng(myLatitude, myLongitude);

		$("#currentAccuracy").html("<h4>내 위치의 정확도 : " + accuracy + "m</h4>");
		if (accuracy > 200) {
			
			if(cookieLatitude==null || cookieLatitude=='deleted'){
				$("#accuracyAlert")
				.html(
						'<h4><font color=red>단순IP기반의 위치추적 서비스는 정확하지 않습니다.<br>정확한 위치를 위해서 WI-FI 네트워크 또는 3G/4G 데이터 네트워크에 접속하시거나,<br>현재 주소를 수동으로 입력해 주세요.</font></h4>');
			}
			else{
				onSuccess(cookieLatitude, cookieLongitude, 10);
			}
			
			//objDiv.style.display = "block";
		} else {
			$("#accuracyAlert").empty;
			//objDiv.style.display = "none";
		}

		//google.maps.Marker(option); = 맵 위에 마커를 표시
		myMarker = new google.maps.Marker({
			position : pos,
			map : map,
			icon : markerImage1,
			title : '내 위치'
		});
		myMarker.setMap(map);

		setSRadius();

		var searchRadius = {
			strokeColor : '#00FF00',
			strokeOpacity : 0.8,
			strokeWeight : 2,
			fillColor : '#00FF00',
			fillOpacity : 0.10,
			map : map,
			center : pos,
			radius : sRadius
		};

		//new google.maps.Circle(option) = 맵 위에 도형(이 경우엔 원)을 표시
		searchCircle = new google.maps.Circle(searchRadius);

		geocoder.geocode({
			'latLng' : pos
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {
					//google.maps.InfoWindow = Marker 위에 네모나게 말풍선으로 뜨는 정보창
					myInfoWindow = new google.maps.InfoWindow();
					myLocation = results[0].formatted_address;
					myInfoWindow.setContent('내 위치 : ' + myLocation);
					myInfoWindow.open(map, myMarker);
					splitMyAddress();
				} else {
					alert('결과를 찾을 수 없습니다.');
				}
			} else {
				alert('Geocoder failed due to: ' + status);
			}
		});

		google.maps.event.addListener(myMarker, 'click', function() {
			map.setCenter(myMarker.getPosition());
			myInfoWindow.setContent('내 위치 : ' + myLocation);
			myInfoWindow.open(map, myMarker);
		});

		map.setCenter(pos);
	}

	function onError2() {
		//alert('onError');
	}

	function splitMyAddress(){
		myAddress = myLocation.split(" ");
	}
	
	function initialize() {

		//alert('start init');
		
		isinit=1;

		/* google.maps.event.addDomListener(window, 'resize', function() {
			map.setCenter(pos);
		}); */
		/* window.onresize = function(event) {
			map.setCenter(pos);
		};*/
		$(window).resize(function () { map.setCenter(pos); });
		
		setSRadius();
		directionsDisplay = new google.maps.DirectionsRenderer();

		
		
		
		//$('#getAllRestnt').removeAttr('disabled');

		//myOptions = 구글 맵에 사용할 옵션
		//zoom = 초기 맵 확대값. 0 입력하면 지구본이 됨
		//center = 초기 맵 중심값
		//mapTypeId = 맵 종류
		var myOptions = {
			zoom : 16,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map_canvas'),
				myOptions);
		directionsDisplay.setMap(map);
		//alert('before geoloation');
		if (navigator.geolocation) {
			//alert('navigator.geolocation: ' + navigator.geolocation);

			//alert('geoloation success');
			var geolocationOption = {
				enableHighAccuracy : true,
				timeout : 5000,
				maximumAge : 0
			}

			navigator.geolocation.getCurrentPosition(function(position) {
				onSuccess(position.coords.latitude, position.coords.longitude,
						position.coords.accuracy);
			}, onError2(), geolocationOption);

		} else {
			alert('위치 추적 서비스 동작 실패');
		}

	}
	//windows가 'load'될때 initalize()함수를 불러와라
	google.maps.event.addDomListener(window, 'load', initialize);

	$(document).ready(function () {

	});

</script>
</head>
<body>
	<div class="container" id="container" style="width: 100%;" align="center">
		<div id="map_canvas" style="width: 80%; height: 100%"></div>
		<input type="button" id="randomSelectInitialize" value="맵 초기화"
			onclick="initialize()" class="btn btn-info"><input type="button"
			id="moveToMyLocation" value="내 위치로 이동" onclick="setMyCenter()" class="btn btn-info">
		<button id="getAllRestnt" onclick="ajaxRandomRestnt()" class="btn btn-primary">식당 골라주기</button>
<!-- 		<br> <input type="text" id="tempAddress" value=""> <input
			type="button" id="geocodeTempAddress" value="해당 주소 지도에 표시"
			onclick="findLocation()"> <input type="text" id=tempLatitude
			value=""> <input type="text" id="tempLongitude" value="">
		<input type="button" id="justShowMarker" value="해당 좌표 지도에 표시"
			onclick="justShowLocation()"> <br> 선택한 마커의 좌표 :
		<div id="currentLocation"></div> -->
		<div id="currentAccuracy"></div>
		<div id="accuracyAlert"></div>
		<div id="newMyLocationForm" class="input-group">
			<div style="display: inline;">
			<input type="text" id="newMyAddress" value="" style="width: 100%">
			<button class="btn btn-warning" id="newMyLocation"
				onclick="newMyLocation()">내 주소 수동으로 입력</button>
			<button class="btn btn-warning" id="deleteMyLocation"
				onclick="deleteMyLocation()">수동 입력 주소 초기화</button>
				</div>
		</div>
		<div id="deleteMyLocationAlert"></div>
		<button id="confirmRestnt" onclick="confirmRestnt()"
				class="btn btn-primary">식당 확정</button>
			<div id="restntConfirmed"></div>
			<%-- <div id="restnt_list">
		<c:forEach items="${restntList}" var="item">
			 ${item.restntName} ${item.latitude} ${item.longitude}<br>
		</c:forEach>
	</div> --%>
			<button id="visitList" onclick="visitList()">방문 정보</button>
			<div class="modal fade" id="randomRestntDetailResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
		</div></body>
</html>