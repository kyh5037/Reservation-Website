<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 회원가입</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/css/main.css" />
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.scrolly.min.js"></script>
		<script src="/resources/js/skel.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>
		<script src="/resources/js/kakao.js"></script>
		
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>		
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
			// Ajax Post
			function ajaxPostAction(url, formData) {
				$.ajax({
			        url: url,
			        type: "POST",
			        data: formData,
			        dataType: "json",
			        success: function(data) {
			        	/**
			        	 * data[0] : success message
			        	 * data[1] : redirect action
			        	 * data[2] : redirect parameter 
			        	 */
			        	alert(data[0]);
			        	callbackPage(data[1], data[2]);
			        },
			        error: function(data) {
			            alert("오류가 발생했습니다.\n잠시후 다시 시도하세요.");
			        }
			    });
			}
			
			function callbackPage(url, data) {
				if (url == null || url == undefined)
					return;
				
				var form = document.createElement('form');
				form.setAttribute('method', "post");
				form.setAttribute('action', url);
				
				for (var key in data) {
					if (data.hasOwnProperty(key)) {
						var hiddenField = document.createElement('input');
			            hiddenField.setAttribute('type', 'hidden');
			            hiddenField.setAttribute('name', key);
			            hiddenField.setAttribute('value', data[key]);
			            
			            form.appendChild(hiddenField);
					}
				}
				
				document.body.appendChild(form);
			    form.submit();
			}

			//TODO 1 기본적인 입력값 체크
			//TODO 2 비밀번호 확인값 체크
			$(document).ready(function(){
				$("#regBtn").click(function(){
					var id = $("#acc_id").val();
					var pw = $("#acc_pw").val();
					var pw_check = $("#acc_pw_check").val();
					var name = $("#acc_name").val();
					var acc_level = $("#acc_level").val();
					
					if (id == "" || id == null) {
						document.getElementById("err_empty_id").style.display = "block"
						return;
					}
					document.getElementById("err_empty_id").style.display = "none"
					
					if (pw == "" || pw == null) {
						document.getElementById("err_empty_pw").style.display = "block"
						return;
					}
					document.getElementById("err_empty_pw").style.display = "none"
					
					if (pw_check == "" || pw_check == null) {
						document.getElementById("err_empty_pw_check").style.display = "block"
						return;
					}
					document.getElementById("err_empty_pw_check").style.display = "none"
					
					if (pw != pw_check){
						alert("비밀번호가 일치하지 않습니다.");
						return;
					}
					
					if (name == "" || name == null) {
						alert("이름을 입력해주세요.");
						return;
					}

					if (acc_level == "") {
						alert("회원 구분을 선택해주세요.");
						return;
					}
					
					var formData = $("#signupForm").serialize();
					
					ajaxPostAction("/member/register", formData);
				});
			});
			
</script>
	</head>
	<body>
		
	  	<!-- Wrapper -->
		<div id="wrap_">
		
			<!-- Header -->
			<header id="header_">
				<a href="/" class="logo"><img src="/resources/images/home.png"></a>
			</header>
			
			<!-- Container -->
			<div id="container">
				<form id="signupForm" action="/member/register" method="post">
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="text" id="acc_id" name="acc_id" placeholder="아이디" maxlength="35">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_id" style="display: none;">아이디를 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="password" id="acc_pw" name="acc_pw" placeholder="비밀번호" maxlength="16">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_pw" style="display: none;">비밀번호를 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="password" id="acc_pw_check" name="acc_pw_check" placeholder="비밀번호 재확인" maxlength="16">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_pw_check" style="display: none;">비밀번호 재확인을 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="text" id="acc_name" name="acc_name" placeholder="이름" maxlength="20">
						</span>
					</div>
					<div class="input_row">
						<div class="level_code">
							<select class="sel" id="acc_level" name="acc_level">
	                               	<option value="" selected>회원유형</option>
	                        	    <option value="1">밥집사장</option>
	                      			<option value="2">손님</option>
	                        </select>
						</div>
					</div>
					<div class="btn_login"><input type="button" title="가입하기" alt="가입하기" value="가입하기" class="btn_global" id="regBtn"></div>
				</form>
			</div>
		</div>
	</body>
</html>