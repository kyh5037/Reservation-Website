<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내가 쓴 리뷰</title>
	</head>
	<body>
		<div id="wrap">
			<c:forEach items="${review}" var="review">
				<div class="resInfoBox">
					<div class="resState">
						<span class="resTitle">${review.sto_name}의 리뷰</span>
						<div id="starRev" class="starRev">
							<c:forEach begin="1" end="${review.review_star}" step="1">
							<span class="starR on" style="margin:0 0 0 10px; float: left;">1</span>
							</c:forEach>
							<span style="float: right;"><fmt:formatDate value="${review.review_date}" pattern="yyyy년 MM월 dd일 " /></span>
						</div>
						
					</div>
					<div class="resContent">
						<div class="input_row">
							<span>${review.review_content}</span><br>
							
							<span>${review.review_tag}</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>	
	</body>
</html>