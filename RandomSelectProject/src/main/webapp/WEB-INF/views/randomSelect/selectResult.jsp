<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=false&language=ko">
	
</script>
<script type="text/javascript">
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

		//return Math.round(Math.round(ret) / 1000);
		return Math.round(Math.round(ret));
	}

	var map;
	function initialize() {
		var myOptions = {
			zoom : 12,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('map_canvas'),
				myOptions);

		if (navigator.geolocation) {
			//alert('navigator.geolocation: ' + navigator.geolocation);

			navigator.geolocation.getCurrentPosition(function(position) {
				//alert('position: ' + position);

				alert(position.coords.latitude + ', '
						+ position.coords.longitude);

				var pos = new google.maps.LatLng(position.coords.latitude,
						position.coords.longitude);

				//var infowindow = new google.maps.InfoWindow({map: map, position: pos, content: 'Location found using HTML5.'});
				var marker = new google.maps.Marker({
					position : pos,
					map : map,
					title : '내 위치'
				});

				var searchRadius = {
					strokeColor : '#00FF00',
					strokeOpacity : 0.8,
					strokeWeight : 1,
					fillColor : '#00FF00',
					fillOpacity : 0.25,
					map : map,
					center : pos,
					radius : 1000
				};
				// Add the circle for this city to the map.
				cityCircle = new google.maps.Circle(searchRadius);

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

		var infowindow = new google.map.InfoWindow(options);
		map.setCenter(options.position);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div id="map_canvas" style="width: 600; height: 480"></div>
</body>
</html>