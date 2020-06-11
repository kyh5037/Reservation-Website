<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집: 관리자 공지사항 작성</title>
		<link rel="stylesheet" href="/resources/css/main.css" />
		<script type="text/javascript">
			$(document).ready(function(){	
				$("#btnSave").click(function(){
					var title = $("#notice_title").val();
					var content = $("#notice_content").val();
					var form = document.getElementById('writeForm');
					if(title == "" || title == null){
						alert("제목을 입력하세요.");
						return;
					}
					
					if(content == "" || content == null){
						alert("내용을 입력하세요.");
						return;
					}
					
					form.action = "/notice/write";
					form.submit();
				});
				
				$("#btnList").click(function(){
					var form = document.getElementById('writeForm');
					form.action = "/";
					form.method = "post";
					form.submit();
				});
				
				$("#btnCancel").click(function(){
					var cancel = confirm("취소하시겠습니까?");
					if(cancel){
						alert("취소되었습니다.");
						var form = document.getElementById('writeForm');
						form.action = "/";
						form.method = "post";
						form.submit();
					}
				});
			})
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
			<div class="acc_img"><img src="/resources/images/medical-mask.png"></div>
			<div class="acc_info">
				<div class="nick">
					<% if (no == null || no == "") { %>
						<a href="/member/login" class="button alt">로그인하세요</a>
					<% } else { %>	
					<%= session.getAttribute("acc_name") %>님
					<% } %>
				</div>
				<div>내정보 수정</div>
				<div>내가 쓴 리뷰</div>
				<div>예약확인</div>
				<div>
					<% if (level == 1) { %>
						<a href="javascript:edit(<%= session.getAttribute("acc_no") %>)">밥집등록</a>	
					<% } %>
				</div>
			</div>
		</nav>
		<div id="wrap">
			<form id="writeForm" method="post" action="/notice/write">
				<div class="input_row">
	                <h2 class="input_row_tit">제목<span class="point"></span></h2>
	                <input class="input" id="notice_title" name="notice_title" type="text" placeholder="제목을 입력해주세요 (최대100자)">
	            </div>
	            <div class="input_row">
	                <h2 class="input_row_tit">내용<span class="point"></span></h2>
	                <textarea class="input_content" id="notice_content" name="notice_content" maxlength="400" placeholder="내용을 입력해주세요 (최대400자)"></textarea>
	            </div>
	            <div class="input_row">
	                <input class="btn_global" type="button" id="btnSave" value="등록">
	            	<input class="btn_global" type="button" id="btnCancel" value="취소">
                </div>
            </form>
			
			
		</div>
		
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
	</body>
</html>