<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집 : 내주변 밥집</title>
	</head>
	<body>

		<!-- Wrap -->
		<div id="wrap">
			<!-- Search -->
			<div id="search-box">
				<div class="search-area">
					<form id="searchForm" action="/search/searchList" method="post">
						<input type="text" style="display: none;">   
						<input type="text" id="search" name="search" class="search-bar" placeholder="지역, 식당 또는 음식" onkeypress="javascript:if( event.keyCode==13 ){onClickSearch();}">
						<input type="button" onclick="javascript:onClickSearch()" value=" " class="btn-search">
						<input type="hidden" id="search_gps_x" name="search_gps_x">
						<input type="hidden" id="search_gps_y" name="search_gps_y">
					</form>
				</div>
			</div>
			
			<!-- One -->
			<div id = "map"></div>
			<script>
	
				var container = document.getElementById('map');
				
				var options = {
						center: new kakao.maps.LatLng("${searchGps_x}", "${searchGps_y}"),
						level: 4
					};
				
				if(navigator.geolocation){
					navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
						$("#gps_x").val(lat);
						$("#gps_y").val(lon);
						
					});
				}else{
					console.error('geo error');
				}
				
				var map = new kakao.maps.Map(container, options);
				
				var geocoder = new kakao.maps.services.Geocoder();
	
				var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        console.log(result);
				    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
					}
				};
			</script>
			<c:forEach items="${list}" var="list">
			 	<div class="contents">
					<div class="contents_info" onclick="javascript:foodDetail('${list.sto_no}')">
					 	<ul>
						 	<li>${list.sto_name}</li>
						 	<li>음식종류 #해시태그</li>
		                    <li>${list.sto_comment}</li>
		                    <li>${list.average_price}</li> 
		                    <li>#해시태그 #해시태그 #해시태그</li>
						  	<li><script>geocoder.addressSearch('${list.sto_loc}', callback);</script></li>
					 	</ul>
					 </div>
					 <div class="contents_img_box">
				   			<img src="${list.sto_photo}" class="Img" onError="this.src='/resources/images/error_img.jpg'">
					 </div>
				</div>	
			</c:forEach>
			
			<script>
				if(!document.getElementsByClassName("contents")[0]){
					alert("검색결과가 없습니다.");
					location.href="/";
				}
			</script>
			<p style="border-top: 1px solid #ededed"></p>
		</div>
	</body>
</html>