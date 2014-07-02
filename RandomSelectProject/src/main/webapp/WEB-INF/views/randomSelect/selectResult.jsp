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
	var sRadius = 2000;
	var geocoder = new google.maps.Geocoder();

	function restntList() {
		var restntId = "";
		var restntName = "";
		var address = "";
		var restntTel = "";
		var restntCate = "";
		var restntEval = "";
	}

	function showCurrentLocation(Lat, Lon) {
		$("#currentLocation").html(Lat + ' ' + Lon);
	}
	function showCurrentLocation2(Location) {
		$("#currentLocation").html(Loation);
	}

	function showRestntInRange(restntList) {

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
		map.setCenter(pos);
		map.setZoom(16);
	}
	function setRestntCenter() {
		map.setCenter(pos2);
		map.setZoom(16);
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
				google.maps.event.addListener(tempMarker, 'click', function() {
					map.setCenter(tempMarker.getPosition());
					showCurrentLocation2(results[0].geometry.location);
				});
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

	function initialize() {

		setSRadius();
		var myOptions = {
			zoom : 14,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map_canvas'),
				myOptions);
		if (navigator.geolocation) {
			//alert('navigator.geolocation: ' + navigator.geolocation);

			navigator.geolocation
					.getCurrentPosition(
							function(position) {
								//alert('position: ' + position);

								//alert(position.coords.latitude + ', ' + position.coords.longitude);

								myLatitude = position.coords.latitude;
								myLongitude = position.coords.longitude;
								pos = new google.maps.LatLng(myLatitude,
										myLongitude);

								//var infowindow = new google.maps.InfoWindow({map: map, position: pos, content: '내 위치'});
								var myMarker = new google.maps.Marker({
									position : pos,
									map : map,
									title : '내 위치'
								});
								myMarker.setMap(map);

								geocoder
										.geocode(
												{
													'latLng' : pos
												},
												function(results, status) {
													if (status == google.maps.GeocoderStatus.OK) {
														if (results[0]) {
															var myInfoWindow = new google.maps.InfoWindow();
															myInfoWindow
																	.setContent('내 위치 : '
																			+ results[0].formatted_address);
															myInfoWindow.open(
																	map,
																	myMarker);
														} else {
															alert('결과를 찾을 수 없습니다.');
														}
													} else {
														alert('Geocoder failed due to: '
																+ status);
													}
												});

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

								searchCircle = new google.maps.Circle(
										searchRadius);

								randomLatitude = 37.5051264143489;
								randomLongitude = 127.02609446644783;

								pos2 = new google.maps.LatLng(randomLatitude,
										randomLongitude);

								var restntMarker = new google.maps.Marker({
									position : pos2,
									map : map,
									title : '식당 위치'
								});
								restntMarker.setMap(map);

								geocoder
										.geocode(
												{
													'latLng' : pos2
												},
												function(results, status) {
													if (status == google.maps.GeocoderStatus.OK) {
														if (results[0]) {
															var restntInfoWindow = new google.maps.InfoWindow();
															restntInfoWindow
																	.setContent('식당 위치 : '
																			+ results[0].formatted_address);
															restntInfoWindow
																	.open(map,
																			restntMarker);
														} else {
															alert('결과를 찾을 수 없습니다.');
														}
													} else {
														alert('Geocoder failed due to: '
																+ status);
													}
												});

								//var restntInfoWindow = new google.maps.InfoWindow({map: map, position: pos2, content: '식당 위치'});

								google.maps.event.addListener(myMarker,
										'click', function() {
											map.setCenter(myMarker
													.getPosition());
											showCurrentLocation(myLatitude,
													myLongitude);
										});
								google.maps.event.addListener(restntMarker,
										'click', function() {
											map.setCenter(restntMarker
													.getPosition());
											showCurrentLocation(randomLatitude,
													randomLongitude);
										});

								map.setCenter(pos);
							}, function() {
								handleNoGeolocation(true);
							});
		} else {
			handleNoGeolocation(false);
		}

	}

	function handleNoGeolocation(errorFlag) {
		alert(errorFlag);

		if (errorFlag) {
			var content = '위치 추적 서비스 동작 실패';
		} else {
			var content = '브라우저가 위치 추적 서비스를 지원하지 않습니다. 브라우저를 최신 버전으로 업데이트해 주세요.';
		}

		var options = {
			map : map,
			position : new google.maps.LatLng(37, 127),
			content : content
		};

		var errorInfoWindow = new google.map.InfoWindow(options);
		map.setCenter(options.position);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div id="map_canvas" style="width: 100%; height: 60%"></div>
	<div id="restnt_list" style="width: 100%; height: 15%">
		<c:forEach items="${restntList}" var="restnt">
		${restnt.restntName}
		</c:forEach>
		${loginUser.memId } ${loginUser.memName } ${loginUser.memGrade }
	</div>
	<input type=button id=randomSelectInitialize value="아무거나!"
		onclick="initialize()">
	<input type=button id=moveToMyLocation value="내 위치로 이동"
		onclick="setMyCenter()">
	<input type=button id=moveToRestntLocation value="식당 위치로 이동"
		onclick="setRestntCenter()">
	<br>
	<input type=text id=tempAddress value="">
	<input type=button id=geocodeTempAddress value="해당 주소 지도에 표시"
		onclick="findLocation()">
	<br> 선택한 마커의 좌표 :
	<div id=currentLocation></div>
	<br>
	<input type=button id=showRestntInRange value="범위 안 식당 표시"></input>

</body>
</html>