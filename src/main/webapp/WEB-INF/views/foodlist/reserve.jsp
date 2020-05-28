<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예약</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		    
		<script type="text/javascript">
		
			$(document).ready(function(){
				$("#btnReserve").click(function(){
					var form = document.getElementById('reserveForm');
					form.action = "/store/afterReserve";
					form.method = "post";
					form.submit();
				});
				
				$( "#res_date" ).datepicker({
					dateFormat: 'yy-mm-dd' 
				});
			});
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
					<a href="javascript:logout()" class="button alt">Logout</a>
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
	
		<h2>${reserve.sto_name} 예약</h2>
		<form id="reserveForm">
			예약자 성명: <input type="text" id="res_name" name="res_name" maxlength="50"><br>
			예약 인원: <select id="res_people" name="res_people">
						<option value="">인원 수</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select><br>
			예약 날짜: <input type="text" id="res_date" name="res_date"><br>
			예약 시간: <input type="text" id="res_time" name="res_time" maxlength="50"><br>
			<input type="button" id="btnReserve" value="예약완료">
			<input type="button" id="btnCancel" value="취소">
		</form>
		
		<!-- Bottom_bar -->
		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="location.href='/foodlist/foodView'"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
	</body>
</html>