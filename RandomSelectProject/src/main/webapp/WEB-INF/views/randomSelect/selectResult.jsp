<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0;
	padding: 0
}

#map_canvas {
	height: 100%
}
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true&language=ko">
	
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	var myLatitude, myLongitude;
	var randomLatitude, randomLongitude;
	var sDistance;
	var map;
	var restntList;
	var pos, pos2;
	var sRadius;
	var geocoder = new google.maps.Geocoder();

	function showCurrentLocation(Lat, Lon) {
		$("#currentLocation").html(Lat + ' ' + Lon);
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

	
	function getAllRestntList(){
		var tempRestntLatitude, tempRestntLongitude, tempRestntPos;
		var tempRestntMarker;
		<c:forEach items="${restntList}" var="item" varStatus="counter">
			tempRestntLatitude = "${item.latitude}";
			tempRestntLongitude = "${item.longitude}";
			alert(tempRestntLatitude + ' ' + tempRestntLongitde);
			tempRestntPos = new google.maps.LatLng(tempRestntLatitude, tempRestntLongitude);
			tempRestntMarker = new google.maps.Marker({
				position : tempRestntpos,
				map : map,
			});
			tempRestntMarker.setMap(map);
		</c:forEach>
	}
	
	function setMyCenter() {
		map.setCenter(pos);
		map.setZoom(16);
	}
	function setRestntCenter() {
		map.setCenter(pos2);
		map.setZoom(16);
	}
	function redrawMap() {
		google.maps.event.trigger(map, 'resize');
	}

	function justShowLocation() {

		var tempLatitude = document.getElementById('tempLatitude').value;
		var tempLongitude = document.getElementById('tempLongitude').value;
		var tempPos = new google.maps.LatLng(tempLatitude, tempLongitude);

		var tempMarker2 = new google.maps.Marker({
			map : map,
			position : tempPos
		});
		tempMarker2.setMap(map);
		map.setCenter(tempPos);
		google.maps.event.addListener(tempMarker2, 'click', function() {
			map.setCenter(tempMarker2.getPosition());
			showCurrentLocation2(tempPos);
		});

	}

	function findLocation() {
		var tempAddress = document.getElementById('tempAddress').value;
		geocoder.geocode({
			'address' : tempAddress
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				var tempMarker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				tempMarker.setMap(map);
				$("#currentLocation").html(results[0].geometry.location.lat() + ' ' + results[0].geometry.location.lng());
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}

	function newMyLocation() {
		var newMyAddress = document.getElementById('newMyAddress').value;
		$("#accuracyAlert").empty();
		geocoder.geocode({
			'address' : newMyAddress
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				onSuccess(results[0].geometry.location.lat(), results[0].geometry.location.lng(), 10);
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}
	
	function setSRadius() {
		var tempSRadius = "<c:out value="${loginUser.memWalkRange}" />";
		tempSRadius = Number(tempSRadius);
		if (tempSRadius == 0) {
			tempSRadius = 1000;
		}
		sRadius = tempSRadius;
	}

	function onSuccess(Lat, Lon, accuracy) {

		//alert('onSuccess');
		var objDiv = document.getElementById("newMyLocationForm");
			
		myLatitude = Lat;
		myLongitude = Lon;
		pos = new google.maps.LatLng(myLatitude, myLongitude);

		$("#currentAccuracy").html("내 위치의 정확도 : " + accuracy + "m");
		if(accuracy>200){
			$("#accuracyAlert").html("<font color=red>단순IP기반의 위치추적 서비스는 정확하지 않습니다.<br>정확한 위치를 위해서 WI-FI 네트워크 또는 3G/4G 데이터 네트워크에 접속하시거나, 현재 주소를 수동으로 입력해 주세요.</font>");

			objDiv.style.display="block";
		}
		else{
			$("#accuracyAlert").empty;
			objDiv.style.display="none";
		}

		//var infowindow = new google.maps.InfoWindow({map: map, position: pos, content: '내 위치'});
		var myMarker = new google.maps.Marker({
			position : pos,
			map : map,
			title : '내 위치'
		});
		myMarker.setMap(map);

		geocoder.geocode({
			'latLng' : pos
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {
					var myInfoWindow = new google.maps.InfoWindow();
					myInfoWindow.setContent('내 위치 : '
							+ results[0].formatted_address);
					myInfoWindow.open(map, myMarker);
				} else {
					alert('결과를 찾을 수 없습니다.');
				}
			} else {
				alert('Geocoder failed due to: ' + status);
			}
		});

		getAllRestntList();
		
		google.maps.event.addListener(myMarker, 'click', function() {
			map.setCenter(myMarker.getPosition());
			showCurrentLocation(myLatitude, myLongitude);
		});


		map.setCenter(pos);
	}

	function onError2() {
		//alert('onError');
	}

	function initialize() {

		alert('start init');

		setSRadius();
		var myOptions = {
			zoom : 14,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map_canvas'),
				myOptions);
		alert('before geoloation');
		if (navigator.geolocation) {
			alert('navigator.geolocation: ' + navigator.geolocation);

			alert('geoloation success');
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

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div id="map_canvas" style="width: 100%; height: 70%"></div>
	<input type=button id=randomSelectInitialize value="아무거나!"
		onclick="initialize()">
	<input type=button id=redrawMap value="맵 다시 그리기" onclick="redrawMap()">
	<input type=button id=moveToMyLocation value="내 위치로 이동"
		onclick="setMyCenter()">
	<input type=button id=moveToRestntLocation value="식당 위치로 이동"
		onclick="setRestntCenter()">
	<br>
	<input type=text id=tempAddress value="">
	<input type=button id=geocodeTempAddress value="해당 주소 지도에 표시"
		onclick="findLocation()">
	<input type=text id=tempLatitude value="">
	<input type=text id=tempLongitude value="">
	<input type=button id=justShowMarker value="해당 좌표 지도에 표시"
		onclick="justShowLocation()">
	<br> 선택한 마커의 좌표 :
	<div id=currentLocation></div>
	<div id=currentAccuracy></div>
	<div id=accuracyAlert></div>
	<div id=newMyLocationForm style="display:none">
	<input type=text id=newMyAddress value="">
	<input type=button id=newMyLocation value="내 주소 수동으로 입력" onclick="newMyLocation()">	
	</div>
	<div id="restnt_list">
		<c:forEach items="${restntList}" var="item">
			${item.adress1} ${item.adress2} ${item.adress3} ${item.adress4} <br>
		</c:forEach>
	</div>
</body>
</html>