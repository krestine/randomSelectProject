<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true&language=ko">
	
</script>
<script type="text/javascript">
	var lat1 = "", lon1 = "", lat2 = "", lon2 = "";
	var myLatitude, myLongitude;
	var map;
	var lmarker, rmarker;
	var sRadius = 1000;

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

				//alert(position.coords.latitude + ', ' + position.coords.longitude);

				myLatitude = position.coords.latitude;
				myLongitude = position.coords.longitude;
				var pos = new google.maps.LatLng(myLatitude, myLongitude);

				//var infowindow = new google.maps.InfoWindow({map: map, position: pos, content: '내 위치'});
				var marker = new google.maps.Marker({
					position : pos,
					map : map,
					title : '내 위치'
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
				searchCircle = new google.maps.Circle(searchRadius);

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