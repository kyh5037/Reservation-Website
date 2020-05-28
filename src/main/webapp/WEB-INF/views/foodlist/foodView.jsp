<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집 : 내주변 밥집</title>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>
		
		<script type="text/javascript">
			function listLetter(acc_no) {
            
				if (acc_no == undefined) {
               		alert("로그인한 후 이용가능합니다.");
               		return;
            	}
            
            	var form = $("#letterForm");
            	form.submit();
         	}

			function foodDetail(sto_no) {
				var form = $("#detailForm");
				$("#sto_no").val(sto_no);

				form.submit();
			}
      	</script>
	</head>
	<body>

		<!-- Header -->
		<header id="header">
			<nav class="left">
				<a href="#menu"><span>Menu</span></a>
			</nav>
			<a href="/"><img class="logo" src="/resources/images/home.png"></a>
			<nav class="right">	
				<% if (no == null || no == "") { %>
					<a href="/member/login" class="button alt">Login</a>
				<% } else { %>
					<a href="/member/logout" class="button alt">Logout</a>
				<% } %>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="main">Home</a></li>
				<li><a href="generic.html">내주변밥집</a></li>
				<li><a href="elements.html">밥집해시태그</a></li>
			</ul>
		</nav>
	
		<!-- Search -->
		<div id="search-box">
			<div class="search-area">
				<form id="searchForm" action="/search/searchList">   
					<input type="text" id="search" name="search" class="search-bar" placeholder="지역, 식당 또는 음식">
					<input type="submit" value=" " class="btn-search">
				</form>
			</div>
		</div>
	
		<!-- One -->
		<div id = "map"></div>
		<script>
				var container = document.getElementById('map');
				
				var gps_x = 37.322843;
				var gps_y = 127.127846;
				
				$("#gps_x").val(gps_x);
				$("#gps_y").val(gps_y);
				
				var options = {
					center: new kakao.maps.LatLng(gps_x, gps_y),
					level: 4
				};
		
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
			<c:forEach items="${view}" var="view">
			 	<div class="contents">
					<div class="contents_info" onclick="javascript:foodDetail('${view.sto_no}')">
					 	<ul>
						 	<li>${view.sto_name}</li>
						 	<li>음식종류 #해시태그</li>
		                    <li>사장 한마디</li>
		                    <li>"       "</li> 
		                    <li>#해시태그 #해시태그 #해시태그</li>
						  	<li><script>geocoder.addressSearch('${view.sto_loc}', callback);</script></li>
					 	</ul>
					 </div>
					 <div class="contents_img_box">
				   			<img src="/resources/images/ban.png">
					 </div>
				</div>	
			</c:forEach>
			
			<p style="border-top: 1px solid #ededed"></p>
		
		<!-- Bottom_bar -->

		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="location.href='/foodlist/foodView'"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
		
		<!-- Hidden Form -->
		<form id="letterForm" action="/letter/list" method="post">
	    	<input type="hidden" id="let_no_acc" name="let_no_acc" value="<%= no %>" />
		</form>
		
		<form id="detailForm" action="/foodlist/foodDetail" method="post">
	    	<input type="hidden" id="sto_no" name="sto_no" />
		</form>
	</body>
</html>