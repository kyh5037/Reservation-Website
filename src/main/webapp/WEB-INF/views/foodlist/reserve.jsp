<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 예약</title>
		<%	String acc_no = String.valueOf(session.getAttribute("acc_no"));
			if(acc_no.equals("null")){%>
			<script>alert('로그인 후 이용가능합니다.');history.back();</script>
			<%}	
		%>
		<script>
	
			$(document).ready(function(){
				$("#btnReserve").click(function(){
					var form = document.getElementById('afterReserveForm');
					form.action = "/store/afterReserve";
					$("#res_no_sto").val('${reserve.sto_no}');
					form.method = "post";
					
					form.submit();
				});
				
				$( "#res_date" ).datepicker({
					dateFormat: 'yy-mm-dd' 
				});
				
				$("#btnCancel").click(function(){
					
					history.back();
				});
			});
		</script>
	</head>
	<body>
		<div class="letter_info" style="padding-left: 30px; text-align: center; font-size: 1.7em;">
				예약 : ${reserve.sto_name}
		</div>
		<div id="wrap">
			<form id="afterReserveForm">
				<div class="input_row">
					<input type="hidden" id="res_no_sto" name="res_no_sto"/>
	                <h2 class="input_row_tit">예약자 성명<span class="point"></span></h2>
	                <input class="input" id="res_name" name="res_name" type="text" placeholder="이름을 입력해주세요.">
	            </div>
	            <div class="input_row">
	                <h2 class="input_row_tit">예약 인원<span class="point"></span></h2>
	                <div class="input_row">
						<div class="level_code">
							<select class="sel" id="acc_level" name="res_people">
                               	<option value="">인원 수</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
	                        </select>
						</div>
					</div>
	            </div>
				<div class="input_row">
	            	<h2 class="input_row_tit">예약 날짜<span class="point"></span></h2>
					<input class ="input" type="text" id="res_date" name="res_date">
	            </div>
	            <div class="input_row">
	            	<h2 class="input_row_tit">예약 시간<span class="point"></span></h2>
	            	<input class="input" type="time" id="res_time" name="res_time" maxlength="50"><br>
	            </div>
	            <div class="input_row">
	                <input class="btn_global" type="button" id="btnReserve" value="예약등록">
	            	<input class="btn_global" type="button" id="btnCancel" value="취소">
                </div>
            </form>
		</div>
	</body>
</html>