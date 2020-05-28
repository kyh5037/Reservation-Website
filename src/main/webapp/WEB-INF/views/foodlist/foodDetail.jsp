<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집: 상세보기</title>
		
		<script type="text/javascript">
			function foodReserve(sto_no) {
				var form = $("#reserveForm");
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
			<div> 
				${detail.sto_name}
			</div>
			<div>
				전화번호: ${detail.sto_tel}
			</div>
			<div>
				위치: ${detail.sto_loc}
			</div>
			<button type="button" id="btnReserve" onclick="javascript:foodReserve('${detail.sto_no}')">에약하기</button>
		
		<!-- Bottom_bar -->
		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="location.href='/foodlist/foodView'"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
		
		<form id="reserveForm" action="/foodlist/reserve" method="post">
	    	<input type="hidden" id="sto_no" name="sto_no" />
		</form>
	</body>
</html>