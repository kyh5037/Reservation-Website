<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:if test="${check eq 777 }">
	<script>
		alert("밥집등록을 해주세요.");
		history.back();
	</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 예약관리</title>
	</head>
	<body>
		<div id="wrap">
			
			<div class="resTitle" style="height: 30px;">
				<span style="float: left;">예약 가능 수 : </span>
				<form id="maxTable"><input name="tb_maxTable" class="input" type="text" value="${tb.tb_maxTable}" style="width:25px;" onkeypress="javascript:if( event.keyCode==13 ){changeMax();}">
				<span style="float: right;">현재 예약 수 : ${tb.tb_curTable}</span>
				</form>
				
			</div>
			<script>
				function changeMax(){
				    var formData = $("#maxTable").serialize();
					ajaxPostAction("/information/changeMax", formData);
				}
			</script>
			<c:forEach items="${list}" var="list">	
				<div class="resInfoBox">
					<div class="resState">
						<span style="float: left;">
						<c:choose>
							<c:when test="${list.res_check eq 0}">${list.res_name }님 예약신청중</c:when>
							<c:when test="${list.res_check eq 2}">${list.res_name }님 예약거절됨</c:when>
							<c:otherwise>${list.res_name}님 예약완료</c:otherwise>
						</c:choose>
						</span>
						<span style="float: right;"><fmt:formatDate value="${list.res_cur_time}" pattern="yyyy년 MM월 dd일 " /></span>
					</div>
					<div class="resContent">
						<div class="input_row"><span class="resDate">${list.res_date}</span></div>
						<div class="input_row">
							<span class="resTime">시간 ${list.res_time}</span>
							<span>${list.res_people}명</span>
						</div>
						<c:if test="${list.res_check eq 0}">
							<input type="button" class="btn_global" style="border-radius: 0;"name="res_check" value="예약확인" onClick="javascript:resConfirm('${list.res_no}', 1)">
							<input type="button" class="btn_global" name="res_check" value="예약거절" onClick="javascript:resConfirm('${list.res_no}', 2)">			
						</c:if>					
					</div>	
				</div>
			</c:forEach>
		</div>
	</body>
</html>