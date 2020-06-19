<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집: 상세보기</title>
	</head>
	<body>
		<div id="wrap">
			<div class="stoDetail">
				<div class="sto_name">${detail.sto_name}</div>
				<div class="sto_sub"><a href="tel:${detail.sto_tel}"><img src="/resources/images/tel.png" style="width: 0.9em;">&nbsp;${detail.sto_tel}</a></div>
				<div id = "map"></div>
				<script>
		
					var container = document.getElementById('map');
					var coords = new kakao.maps.LatLng(${detail.sto_gps_x}, ${detail.sto_gps_y});
					var options = {
						center: coords,
						level: 4
					};
					var map = new kakao.maps.Map(container, options);
					
					
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        var star;
				</script>
				<div class="sto_sub" >${detail.sto_loc}</div>
				<div class="menu_title">메 뉴</div>
				<div class="stoMenu">
					<c:forEach items="${menu}" var="menu">
						<div class="menu_box">
							<div class="menu_name">${menu.menu_name}</div>
							<div class="menu_price">${menu.menu_price} 원</div>
						</div>
					</c:forEach>
				</div>
				<c:choose>
					<c:when test="${res eq 1 }"><button type="button" class="btn_global" id="btnReserve">예약이 불가능 합니다.</button></c:when>
					<c:otherwise><button type="button" class="btn_global" id="btnReserve" onclick="javascript:foodReserve('${detail.sto_no}')">예약하기</button></c:otherwise>
				</c:choose>
				<%	String acc_no = String.valueOf(session.getAttribute("acc_no"));
			if(!acc_no.equals("null")){%>
				<form id="reviewForm" method="post">
					<div class="menu_title">리 뷰 등 록</div>
					<div class="review">
						<div class="reviewContent">
							<div id="starRev" class="starRev">
								<span class="starR on">1</span>
								<span class="starR">2</span> 
								<span class="starR">3</span> 
								<span class="starR">4</span> 
								<span class="starR">5</span>
								<input type="hidden" name="review_star" id="review_star" value="1">
								<script>
									$('.starRev span').click(function(){
									  	$(this).parent().children('span').removeClass('on');
									  	$(this).addClass('on').prevAll('span').addClass('on');
									  	$('#review_star').val($(this).text());
									  	console.log($(this).text());
									  	return false;
									});
								</script>
							</div>
							<textarea class="input_content" name="review_content" maxlength="400" placeholder="내용을 입력해주세요 (최대400자)"></textarea>
							<div class="input_row">
								<input class="input" name="review_tag" placeholder="해시태그를 입력해주세요.">
							</div>
							<input type="button" class="btn_global" value="등록하기" onClick="reviewEnroll()">
						</div>
					</div>
				</form>
				
			<%}	
		%>
				<div id="reviewList">
					<c:forEach items="${review}" var="review">
						<div id="reviewContent">
							<div>
								<span class="rev_name">이름 : ${review.acc_name}</span>
								<span class="rev_star">별점 : ${review.review_star}</span>
								<span class="rev_date"><fmt:formatDate value="${review.review_date}" pattern="yyyy년 MM월 dd일 " /></span>
								<span class="rev_cont">내용 : ${review.review_content}</span>
								<span class="rev_tag">태그 : ${review.review_tag}</span>
							</div>
						</div>	
					</c:forEach>
				</div>
				
			</div>
		</div>
	</body>
</html>