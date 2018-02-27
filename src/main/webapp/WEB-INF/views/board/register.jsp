<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--header -->
<c:import url="../include/header.jsp" />


<body class="pt60 pb60">
	<!-- Main content -->
	<!--main content  -->
	<div id="wrap" class="w1800 h750 bd1_s_b mg3perauto pd_all1per">

		<!-- 센터 -->
		<div class="mg10auto fs20pt ftbold">WRITE BOARD</div>
		
		<form role="form" method="post">
		<input	type="hidden" name="page" value="${cri.page }" /> 
		<input	type="hidden" name="perPageNum" value="${cri.perPageNum }" />
		<input	type="hidden" name="searchType" value="${cri.searchType }" />
		<input	type="hidden" name="keyword" value="${cri.keyword }" />
		
		
			<div class="box-body">
				<div>
					<label class="input_header">제목</label> 
					<input class="dp_b" type="text"	name='title' class="form-control" placeholder="Enter Title">
				</div>
				<div>
					<label class="input_header">내용</label>
					<textarea class="dp_b" class="form-control" name="content" rows="3"
						placeholder="Enter ..."></textarea>
				</div>
				<div>
					<label class="input_header">작성자</label> 
					<input class="dp_b" type="text"	name="writer" class="form-control" placeholder="Enter Writer">
				</div>
			</div>
			<!-- /.box-body -->

		</form>
			<div class="box-footer">
				<button type="submit" class="input_button  registerBtn">작성하기</button>
				<button type="submit" class="input_button  goListBtn">취소하기</button>
			</div>
		</div>
		
		
		
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");
			console.log(formObj);

			$(".registerBtn").on("click", function() {
				formObj.attr("action", "/board/register");
				formObj.attr("method", "post");
				formObj.submit();
			});
			
				
			$(".goListBtn").on("click", function() {
				formObj.attr("action", "/board/listPage");
				formObj.attr("method", "get");
				formObj.submit();
			});

		});
	</script>
		
		
</body>