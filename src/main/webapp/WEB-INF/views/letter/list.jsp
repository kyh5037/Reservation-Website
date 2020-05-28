<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 마음의 편지</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnWrite").click(function(){
					location.href = "/letter/writeView";
				});
			});
			
			function listView(let_no) {
				var form = $("#letForm");
				$("#let_no").val(let_no);

				form.submit();
			}
			
// 			function listLetter() {
// 				var form = $("#listForm");
				
// 				form.submit();
// 			}
		</script>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
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
		
		
		<!-- Wrap -->
		<div id="wrap">
			<table border="1">
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) == 0}">
						<tr>
							<td colspan="4">등록하신 글이 없습니다.</td>
						</tr>
<<<<<<< HEAD
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.let_no}</td>
								<td>
									<a href="/letter/view?let_no=${list.let_no}">${list.let_title}</a>
								</td>
								<td>
									<fmt:formatDate value="${list.let_date}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${list.let_viewCnt}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4">
								<c:if test="${prev}">
									<a href="/letter/list?let_no_acc=${let_no_acc}&num=${startPageNum - 1}">[이전]</a>
								</c:if>
=======
					</c:forEach>
					<tr>
						<td colspan="4">
							<c:if test="${prev}">
								<a href="/letter/list?let_no_acc=${let_no_acc}&num=${startPageNum - 1}">[이전]</a>
							</c:if>
						
							<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
								<c:choose>	
									<c:when test="${select != num}">
										<a href="/letter/list">${num}</a>
<%-- 										<a onclick="javascript:listLetter()">${num}</a> --%>
									</c:when>
									<c:otherwise>
										<span style="color:red">${num}</span>
									</c:otherwise>	 
								</c:choose>
							</c:forEach>
>>>>>>> parent of c830136... modify
							
								<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
									<c:choose>	
										<c:when test="${select != num}">
											<a href="/letter/list?num=${num}">${num}</a>
										</c:when>
										<c:otherwise>
											<span style="color:red">${num}</span>
										</c:otherwise>	 
									</c:choose>
								</c:forEach>
								
								<c:if test="${next}">
									<a href="/letter/list?let_no_acc=${let_no_acc}&num=${endPageNum + 1}">[다음]</a>
								</c:if> 	
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan="4">
						<button type="button" id="btnWrite">글쓰기</button>
						<a href="/">처음으로</a>
					</td>
				</tr>
			</table>
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
		
		
		<form id="letForm" action="/letter/view" method="post">
	    	<input type="hidden" id="let_no" name="let_no" />
		</form>
	</body>
</html>