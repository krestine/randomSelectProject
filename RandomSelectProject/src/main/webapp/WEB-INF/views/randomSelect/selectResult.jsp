<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	var myLatitude, myLongitude;
	var randomLatitude, randomLongitude;
	var sDistance;
	var map;
	var pos, pos2;
	var sRadius = 2000;
	var geocoder = new google.maps.Geocoder();

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

	function setMyCenter(){
		map.setCenter(pos);
		map.setZoom(16);
	}
	function setRestntCenter(){
		map.setCenter(pos2);
		map.setZoom(16);
	}
	
	function findLocation(){
		var tempAddress = document.getElementById('tempAddress').value;
		  geocoder.geocode( { 'address': tempAddress}, function(results, status) {
		    if (status == google.maps.GeocoderStatus.OK) {
		      map.setCenter(results[0].geometry.location);
		      var tempMarker = new google.maps.Marker({
		          map: map,
		          position: results[0].geometry.location
		      });
		    } else {
		      alert('Geocode was not successful for the following reason: ' + status);
		    }
		  });
	}
	
	function initialize() {
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
									fillOpacity : 0.25,
									map : map,
									center : pos,
									radius : sRadius
								};

								// Add the circle for this city to the map.
								searchCircle = new google.maps.Circle(
										searchRadius);

								/* do {
									randomLatitude = Math.random() + 37;
									randomLongitude = Math.random() + 127;

									sDistance = calcDistance(myLatitude,
											myLongitude, randomLatitude,
											randomLongitude);
								} while (sDistance > sRadius); */
								randomLatitude = 37.5051264143489;
								randomLongitude = 127.02609446644783;
								
								pos2 = new google.maps.LatLng(
										randomLatitude, randomLongitude);

								var restntMarker = new google.maps.Marker({
									position : pos2,
									map : map,
									title : '식당 위치'
								});

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
	<!-- <div id="map_canvas" style="width: 100%; height: 70%"></div> -->
	<div id="map_canvas"  width=1024 height=768></div>
	<input type=button id=moveToMyLocation value="내 위치로 이동"
		onclick=setMyCenter()></input>
	<input type=button id=moveToRestntLocation value="식당 위치로 이동"
		onclick=setRestntCenter()></input>
	<br>
	<input type=text id=tempAddress value=""></input>
	<input type=button id=geocodeTempAddress value="해당 주소 지도에 표시"
		onclick=findLocation()></input>
</body>
</html>