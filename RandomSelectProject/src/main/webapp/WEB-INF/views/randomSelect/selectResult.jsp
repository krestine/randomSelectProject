<%@page import="java.util.List"%>
<%@page import="com.project.domain.RestntDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
html {
	height: 100%;
}

body,.container {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<!-- sensor=해당 단말기에 맵 성능 향상을 위한 센서가 있을 경우 강제로 사용
language=구글 맵 언어
-->
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true&language=ko">
</script>
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>



<script type="text/javascript">
	var myLatitude, myLongitude, myLocation, myRestntName, myRestntId;
	var randomLatitude, randomLongitude;
	var map;
	var restntList;
	var pos, pos2;
	var sRadius;
	var login=1;
	var geocoder = new google.maps.Geocoder();
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	
	var tempOKLatitude = new Array(100);
	var tempOKLongitude = new Array(100);
	var tempOKName = new Array(100);
	var tempOKId = new Array(100);
	
	var tempRestntMarker = new Array(100);
	
	function confirmRestnt() {
		
		if(login==1){
		
		var paramData = {
				restntId : myRestntId
		}

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
		} else{
			var html = '<font color=red>식당 방문정보 기능을 이용하시려면 로그인을 해 주세요.</font>';
			$('#restntConfirmed').html(html);
		}
	}
	
	function showCurrentLocation(Lat, Lon) {
		$("#currentLocation").html(Lat + ' ' + Lon);
	}

	function calcRoute(tempRestntLatitude, tempRestntLongitude) {
		  var start = new google.maps.LatLng(myLatitude, myLongitude);
		  var end = new google.maps.LatLng(tempRestntLatitude, tempRestntLongitude);
		  var request = {
		      origin:start,
		      destination:end,
		      travelMode: google.maps.TravelMode.WALKING
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
	
	function getAllRestntList() {
		//javascript에서도 c태그 및 EL태그 사용 가능.
		
		var tempDistance=0;
		var tempCnt=0;
		var tempRestntLatitude;
		var tempRestntLongitude
		var tempRestntName;
		var tempRestntId;
		
		<c:forEach items="${restntList}" var="item" varStatus="counter">
		
		//javascript 변수에 EL태그의 값을 직접 넣을 때는 직접 넣을 수 없고
		//<c:out value=""/> 태그를 통해 view를 거쳐서 넣을 수 있음.
		tempRestntLatitude = "<c:out value="${item.latitude}" />";
		tempRestntLongitude = "<c:out value="${item.longitude}" />";
		tempRestntName = "<c:out value="${item.restntName}" />";
		tempRestntId = "<c:out value="${item.restntId}" />";

		tempDistance=calcDistance(myLatitude, myLongitude, tempRestntLatitude, tempRestntLongitude);
		
		if(tempDistance<sRadius){
			tempOKLatitude[tempCnt] = tempRestntLatitude;
			tempOKLongitude[tempCnt] = tempRestntLongitude;
			tempOKName[tempCnt] = tempRestntName;
			tempOKId[tempCnt] = tempRestntId;
			
			
			var tempRestntPos = new google.maps.LatLng(tempRestntLatitude,
					tempRestntLongitude);
			tempRestntMarker[tempCnt] = new google.maps.Marker({
				position : tempRestntPos,
				map : map,
				animation: google.maps.Animation.DROP
			});	
			tempRestntMarker[tempCnt].setMap(map);

			/* var tempRestntInfo = new google.maps.InfoWindow();
			tempRestntInfo.setContent(tempRestntName);
			tempRestntInfo.open(map, tempRestntMarker[tempCnt]); */
			
			tempCnt = tempCnt + 1;
			
		}
		
		</c:forEach>
		
		var selection= Math.floor(Math.random() * tempCnt+1);
		
		tempRestntLatitude = tempOKLatitude[selection];
		tempRestntLongitude = tempOKLongitude[selection];
		tempRestntName = tempOKName[selection];
		tempRestntId = tempOKId[selection];
		
		tempRestntMarker[selection].setAnimation(google.maps.Animation.BOUNCE);
		
		var tempRestntInfo = new google.maps.InfoWindow();
		tempRestntInfo.setContent(tempRestntName);
		tempRestntInfo.open(map, tempRestntMarker[selection]);
		
		//google.maps.LatLng(latitude, longitude) = 위도와 경도 값을 '위치'개체로 바꾸는 것
		/* var tempRestntPos = new google.maps.LatLng(tempRestntLatitude,
				tempRestntLongitude);
		var tempRestntMarker = new google.maps.Marker({
			position : tempRestntPos,
			map : map,
			animation: google.maps.Animation.DROP
		});
		tempRestntMarker.setMap(map);
		var tempRestntInfo = new google.maps.InfoWindow();
		tempRestntInfo.setContent(tempRestntName);
		tempRestntInfo.open(map, tempRestntMarker); */
		
		myRestntName = tempRestntName;
		myRestntId = tempRestntId;
		
		calcRoute(tempRestntLatitude, tempRestntLongitude);
	}
	
	function setMyCenter() {
		//map.setCenter(latlng) = 설정된 위치로 맵 중심 이동
		//map.setZoom(Int) = 설정된 숫자값으로 맵 확대율 조정
		map.setCenter(pos);
		map.setZoom(18);
	}
	function redrawMap() {
		//맵을 강제로 다시 그리고 싶을 때 사용함.
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
		//docment.getElementById = view에서 해당 Id를 가진 컨트롤의 값을 가져옴
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
				$("#currentLocation").html(
						results[0].geometry.location.lat() + ' '
								+ results[0].geometry.location.lng());
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
				onSuccess(results[0].geometry.location.lat(),
						results[0].geometry.location.lng(), 10);
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
			login=0;
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
		if (accuracy > 200) {
			$("#accuracyAlert")
					.html(
							"<font color=red>단순IP기반의 위치추적 서비스는 정확하지 않습니다.<br>정확한 위치를 위해서 WI-FI 네트워크 또는 3G/4G 데이터 네트워크에 접속하시거나, 현재 주소를 수동으로 입력해 주세요.</font>");

			objDiv.style.display = "block";
		} else {
			$("#accuracyAlert").empty;
			objDiv.style.display = "none";
		}

		//google.maps.Marker(option); = 맵 위에 마커를 표시
		var myMarker = new google.maps.Marker({
			position : pos,
			map : map,
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
					var myInfoWindow = new google.maps.InfoWindow();
					myLocation = results[0].formatted_address;
					myInfoWindow.setContent('내 위치 : '
							+ myLocation);
					myInfoWindow.open(map, myMarker);
				} else {
					alert('결과를 찾을 수 없습니다.');
				}
			} else {
				alert('Geocoder failed due to: ' + status);
			}
		});

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

		//alert('start init');

		setSRadius();
		directionsDisplay = new google.maps.DirectionsRenderer();
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
</script>
</head>
<body>
	<div class="container" id="container" style="width: 100%">
		<div id="map_canvas" style="width: 100%; height: 600px"></div>
		<input type=button id=randomSelectInitialize value="아무거나!"
			onclick="initialize()"> <input type=button id=redrawMap
			value="맵 다시 그리기" onclick="redrawMap()"> <input type=button
			id=moveToMyLocation value="내 위치로 이동" onclick="setMyCenter()">
		<input type=button id=moveToRestntLocation value="식당 위치로 이동"
			onclick="setRestntCenter()"> <input type=button
			id=getAllRestnt value="식당 골라주기" onclick="getAllRestntList()">
		<br> <input type=text id=tempAddress value=""> <input
			type=button id=geocodeTempAddress value="해당 주소 지도에 표시"
			onclick="findLocation()"> <input type=text id=tempLatitude
			value=""> <input type=text id=tempLongitude value="">
		<input type=button id=justShowMarker value="해당 좌표 지도에 표시"
			onclick="justShowLocation()"> <br> 선택한 마커의 좌표 :
		<div id=currentLocation></div>
		<div id=currentAccuracy></div>
		<div id=accuracyAlert></div>
		<div id=newMyLocationForm style="display: none">
			<input type=text id=newMyAddress value=""> <input type=button
				id=newMyLocation value="내 주소 수동으로 입력" onclick="newMyLocation()">
		</div>
		<button id="confirmRestnt" onclick="confirmRestnt()">식당 확정</button>
		<div id="restntConfirmed"></div>
		<%-- <div id="restnt_list">
		<c:forEach items="${restntList}" var="item">
			 ${item.restntName} ${item.latitude} ${item.longitude}<br>
		</c:forEach>
	</div> --%>
	</div>
</body>
</html>