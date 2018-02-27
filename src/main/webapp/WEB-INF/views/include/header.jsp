<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/reset.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css"
	type="text/css" media="screen" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
	$(function() {
		var lastScrollTop = 0, delta = 15;
		$(window).scroll(function(event) {
			var st = $(this).scrollTop();
			if (Math.abs(lastScrollTop - st) <= delta)
				return; // 스크롤값을 받아서 리턴한다. 
			if ((st > lastScrollTop) && (lastScrollTop > 0)) {
				$(".header").css("top", "-40px"); // 스크롤을 내렸을때 #header의 CSS 속성중 top 값을 -50px로 변경한다. 
			} else {
				$(".header").css("top", "0px"); // 스크롤을 올렸을때 #header의 CSS 속성중 top 값을 0px로 변경한다. 
			}
			lastScrollTop = st;
		});

		$('.drop_login').hide();

		$('.login').click(function() {
			$('.drop_login').toggle(function() {
				$(this).addClass('active').next('form').animate({
					'height' : 'show'
				}, {
					duration : 'slow',
					easing : 'easeOutBounce'
				});
			}, function() {
				$(this).removeClass('active').next('form').slideUp();
			});
		});

		var placeholderTarget = $('.textbox input[type="text"], .textbox input[type="password"]'); //포커스시 
		placeholderTarget.on('focus', function(){ $(this).siblings('label').fadeOut('fast'); }); //포커스아웃시 
		placeholderTarget.on('focusout', function(){ if($(this).val() == ''){ $(this).siblings('label').fadeIn('fast'); } });
		
	});
</script>

<div class="header">

	<!-- 	<div class="dp_ib fleft ml30 mt15"> -->
	<%-- 		<a class="fs25pt txt_deco_none" href="${path}/">durin</a> --%>
	<!-- 	</div> -->
	<div class="header_menu fright mr30 mt15 w350">
		<div>
			<ul>
				<li><a href="${path}/" class="txt_deco_none">홈으로</a></li>
				<li><a class="txt_deco_none">테스트</a></li>
				<li><a class="txt_deco_none">테스트</a></li>
				<c:choose>
					<c:when test="${sessionScope.user_id == null}">
						<li>
							<div class="master dp_ib">
								<a class="login mouse_cursor_pointer txt_deco_none">로그인</a>
							</div>
						</li>
					</c:when>
					<c:when test="${sessionScope.user_id == 'durin93'}">
						<li><a href="${path}/" class="txt_deco_none">회원관리</a></li>
						<li><a class="txt_deco_none" href='/login/logout'>로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="mouse_cursor_pointer txt_deco_none">${sessionScope.user_id}</a>
						</li>
						<li><a class="txt_deco_none" href='/login/logout'>로그아웃</a></li>
					</c:otherwise>
				</c:choose>

			</ul>

			<!-- 로그인창 -->
			<div class="drop_login bd1_s_b mt10 w250 h180 ">
				<form role="search" action="/login/loginCheck">
					<div class="textbox">
					<label for="user_id">아이디</label> 
					<input type="text" id="user_id" name="user_id" class="login_text" /> 
					</div>
					<div class="textbox">
					<label for="user_pw">패스워드</label> 
					<input type="password" id="user_pw" name="user_pw"class="login_text" /> 
					</div>
					<input type="submit"value="로그인" onclick="location.href='#'" class="login_text" />
				</form>
			</div>


		</div>
	</div>
</div>