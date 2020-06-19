<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	String no = "";

	if (session.getAttribute("acc_no") != null)
		no = Integer.toString((int)session.getAttribute("acc_no"));
%>

<%	
	String sto_no = "";

	if (session.getAttribute("sto_no") != null)
		sto_no = Integer.toString((int)session.getAttribute("sto_no"));
%>

<%	
	int level = 0;

	if (session.getAttribute("acc_level") != null)
		level = (int)session.getAttribute("acc_level");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Script -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/skel.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery.scrolly.min.js"></script>
<script src="/resources/js/skel.min.js"></script>
<script src="/resources/js/util.js"></script>
<script src="/resources/js/main.js"></script>
<script src="/resources/js/kakao.js"></script>
<script src="/resources/js/common.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>	
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



		
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/main.css" />
<link rel="stylesheet" href="/resources/css/date.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">


<!-- Meta -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />


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
	<div class="acc_img"><img src="/resources/images/medical-mask.png"></div>
	<div class="acc_info">
		<div class="nick">
			<% if (no == null || no == "") { %>
				<a href="/member/login" class="button alt">로그인하세요</a>
			<% } else { %>	
			<%= session.getAttribute("acc_name") %>님
			
		</div>
		<div>내정보 수정<% } %></div>
		<div>
			<% if (level == 2) { %>
				<a href="/information/myReview">내가쓴리뷰</a>
			<% } %>	
		</div>
		<div>
			<% if (level == 2) { %>
				<a href="/information/resInfo">예약확인</a>	
			<% } else if (level == 1) {%>
				<a href="/information/resManage">예약관리</a>
			<% } %>
		</div>
		<div>
			<% if (level == 1 && session.getAttribute("sto_no") == null) { %>
				<a href="/information/enroll">밥집등록</a>	
			<% } else if(level == 1 && session.getAttribute("sto_no") != null) {%>
				<a href="/information/edit">밥집수정</a>	
			<% } %>
		</div>
	</div>
</nav>


<!-- Bottom_bar -->
<div id="bottom_bar">
	<ul>
		<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
		<li onclick="javascript:foodlist()"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
		<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
		<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
    </ul>
</div>

<!-- Hidden Form -->
<form id="letterForm" action="/letter/list" method="post">
   	<input type="hidden" id="let_no_acc" name="let_no_acc" value="<%= no %>" />
</form>

<form id="reserveForm" action="/foodlist/reserve?sto_no=${detail.sto_no}">
   	<input type="hidden" id="sto_no" name="sto_no" />
</form>

<form id="foodlistForm" action="/foodlist/foodView" method="post">
   	<input type="hidden" id="gps_x" name="gps_x" value="37.323442"/>
   	<input type="hidden" id="gps_y" name="gps_y" value="127.124766"/>
</form>
<%-- 
<form id="foodlistForm" action="/foodlist/foodView" method="post">
   	<input type="hidden" id="gps_x" name="gps_x" value="${gps_x}"/>
   	<input type="hidden" id="gps_y" name="gps_y" value="${gps_y}"/>
</form> --%>


<form id="noticeForm" action="/notice/noticeView" method="post">
   	<input type="hidden" id="notice_no" name="notice_no" />
</form>

<form id="informationForm">
	<input type="hidden" id="acc_no" name="acc_no" />
</form>

<form id="letForm" action="/letter/view" method="post">
   	<input type="hidden" id="let_no" name="let_no" />
</form>
