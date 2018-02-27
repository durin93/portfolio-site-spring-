<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!--header -->
<c:import url="../include/header.jsp" />


<body class="pt60 pb60">
	<!-- Main content -->
	<!--main content  -->
	<div id="wrap" class="w1800 h750 bd1_s_b mg3perauto pd_all1per">

		<!-- 센터 -->
		<div class="mg10auto fs20pt ftbold">MODIFY BOARD</div>

		<form role="form" action="modifyPage" method="post">
			<%-- 			<input type="hidden" name="bno" value="${boardVO.bno }" />  --%>
			<input type="hidden" name="page" value="${cri.page }" /> 
			<input	type="hidden" name="perPageNum" value="${cri.perPageNum }" />
			<input	type="hidden" name="searchType" value="${cri.searchType }" />
			<input	type="hidden" name="keyword" value="${cri.keyword }" />

		<div class="box-body">
			<div>
				<label class="input_header">글 번호</label> <input class="dp_b"
					type="text" name='bno' value="${boardVO.bno}" readonly="readonly">
			</div>
			<div>
				<label class="input_header">제 목</label> <input class="dp_b"
					type="text" name='title' value="${boardVO.title}"
					>
			</div>
			<div>
				<label class="input_header">내 용</label> <input class="content dp_b"
					type="text" name='content' value="${boardVO.content}"
					>
			</div>
			<div>
				<label class="input_header">작성자</label> <input class="dp_b"
					type="text" name='writer' value="${boardVO.writer}"
					readonly="readonly">
			</div>
		</div>
		
		</form>
		
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="submit" class="input_button btn modifyBtn">수정하기</button>
			<button type="submit" class="input_button btn goListBtn">취소하기</button>
		</div>




	</div>
	<!--  -->

	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$(".goListBtn").on("click", function(){
				self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});

			$(".modifyBtn").on("click", function(){
				formObj.submit();
			});
		});
	</script>

	<!-- 	 		$(".btn-warning").on("click", function() {
						formObj.attr("action", "/board/modify");
						formObj.attr("method", "get");
						formObj.submit();
					});
			
					$(".btn-danger").on("click", function() {
			 formObj.attr("action", "/board/remove");
			 formObj.submit();
			 }); 

					$(".btn-primary").on("click", function() {
			 self.location = "/board/list";
			 });  -->
</body>

<!--footer  -->
<%-- <jsp:include page="../include/footer.jsp" /> --%>
