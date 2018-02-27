<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/reset.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css"
	type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/slider.css"
	type="text/css" media="screen" />
<title>durin</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body class="pt60">

	<!--header -->
	<c:import url="include/header.jsp" />
	<!--main content  -->
	<div id="wrap" class="w1800 h750 bd2_s_b mg3perauto pd_all1per">

		<!-- 왼쪽 -->
		<div id="row" class="fleft dp_ib w350  mt100 ml65">
			<div class="w350 h80 bd2_s_b mouse_cursor_pointer">
				<div class="fs35pt pl20 lh80">프로필</div>
			</div>
			<div class="w350 h80 bd2_s_b mt35per mouse_cursor_pointer"
				onclick="location.href='board/listPage';">
				<div class="fs35pt pl20 lh80">문의게시판</div>
			</div>
			<div class="w350 h80 bd2_s_b mt3per mouse_cursor_pointer"
				onclick="window.open('http://blog.naver.com/lsc401')">
				<div class="fs35pt pl20 lh80">블로그</div>
			</div>
			<div class="w350 h80 bd2_s_b mt3per mouse_cursor_pointer"
				onclick="window.open('https://github.com/durin93')">
				<div class="fs35pt pl20 lh80">github</div>
			</div>
		</div>

		<!-- 센터 -->
		<div class="mt50 ml3per fleft w70per bd2_s_b h80per">
		<ul id="gallery">
			<li><a href="#">
			<img
				src="${pageContext.request.contextPath }/resources/img/6.jpg"/>
				</a>
			</li>
			<li><a href="#">
			<img
				src="${pageContext.request.contextPath }/resources/img/test.jpg"/></a>
			</li>
			<li><a href="#"><img
				src="${pageContext.request.contextPath }/resources/img/fur.jpg"/></a>
			</li>
		</ul>
		<div id="btn_gallery" class="txt_deco_none">
			<a href="#" class="btn_gallery_prev off">◁</a> <a href="#"
				class="btn_gallery_next">▷</a>
		</div>
		</div>




	</div>

	<!--footer  -->
	<%-- 		<jsp:include page="include/footer.jsp" /> --%>
	
	<script type="text/javascript">
	$( ".btn_gallery_next" ).click(function() {
	    if(!$("#gallery li").last().is(":visible")){
	        $("#gallery li:visible").hide().next("li").fadeIn("80");
	        $(".btn_gallery_prev").removeClass("off");
	    }
	    if($("#gallery li").last().is(":visible")){
	        $(this).addClass("off");
	    }
	    return false;
	});
	$( ".btn_gallery_prev" ).click(function() {
	    if(!$("#gallery li").first().is(":visible")){
	        $("#gallery li:visible").hide().prev("li").fadeIn("80");
	        $(".btn_gallery_next").removeClass("off");
	    }
	    if($("#gallery li").first().is(":visible")){
	        $(this).addClass("off");
	    }
	    return false;
	});


	</script>
	
</body>
</html>



<%-- 	<c:set var="center" value="${param.center }" /> --%>

<!-- 	<!-- 처음 index.jsp페이지를 실행하면 당연히 param.값을 받아올 수 없기에 조건 주기 -->
<%-- 	<c:if test="${center == null }"> --%>
<!-- 		<!-- 넘겨받은 center값이 없으면.. 이동할 main.jsp주소를 center변수에 저장 -->
<%-- 		<c:set var="center" value="include/main.jsp" /> --%>
<%-- 	</c:if> --%>
<%-- 	<c:import url="${center}" /> --%>
