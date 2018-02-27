<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>durin board</title>
</head>
<body class="pt60 pb60">
	<script type="text/javascript">
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리 완료")
		}
	</script>

	<!--header -->
	<c:import url="../include/header.jsp" />

	<!--main content  -->
	<div id="wrap" class="w1800 h750 bd1_s_b mg3perauto pd_all1per">


		<!-- 센터 -->
		<div class="mg10auto fs20pt ftbold">문의 게시판</div>
		<div class="divTable" style="border: 1px solid #000;">
			<div class="divTableCaption" style="display: none;">문의게시판</div>
			<div class="divTableHeading">
				<div class="divTableRow">
					<div class="divTableCell">글 번호</div>
					<div class="divTableCell">제목&nbsp;</div>
					<div class="divTableCell">작성자&nbsp;</div>
					<div class="divTableCell">작성일&nbsp;</div>
					<div class="divTableCell">조회수&nbsp;</div>
				</div>
			</div>

			<div class="divTableBody">
				<c:forEach items="${list }" var="boardVO">
					<div class="divTableRow">
						<div class="divTableCell">${boardVO.bno}</div>
						<div class="divTableCell">
							<a href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a>
						</div>
						<div class="divTableCell">${boardVO.writer }</div>
						<div class="divTableCell">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardVO.regdate}" />
						</div>
						<div class="divTableCell">${boardVO.viewcnt }</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="paging">
			<ul class="pagination">

				<c:if test="${pageMaker.prev }">
					<li><a href="listPage${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value ="${pageMaker.cri.page == idx?'class = active':'' }"/>>
						<a href="listPage${pageMaker.makeSearch(idx)}">${idx }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li><a href="listPage${pageMaker.makeSearch(pageMaker.endPage + 1 )}">&raquo</a></li>
				</c:if>

			</ul>
		</div>

	<!-- 검색 -->
	<div>
		<select name="searchType">
			<option value="a"
				<c:out value="${cri.searchType == null?'selected':'' }"/>>
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':'' }"/>>
				제목</option>
			
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>
				내용</option>
			
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>
				작성자</option>
			
			<option value="n"
				<c:out value="${cri.searchType eq 'n'?'selected':'' }"/>>
				글번호</option>
		</select>
		
		<input type="text" name="keyword" class="keywordInput" value="${cri.keyword  }">
		<button class="searchBtn">검색</button>
		<button class="newBtn">글쓰기</button>
	</div>

<!-- 	wrap -->
	</div>

	<form id="jobForm">
		<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
		<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
	</form>
	




<script>
$(document).ready(function(){

	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	$(".pagination ul  a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/board/listPage").attr("method", "get");
		jobForm.submit();
	});


	$(".searchBtn").on("click", function(event) {
		
		self.location = "listPage" + "${pageMaker.makeQuery(1)}"+"&searchType=" 
		+ $("select option:selected").val()+ "&keyword=" + encodeURIComponent($(".keywordInput").val());
		
		});
	
	$(".newBtn").on("click", function(evt){
		self.location = "register"+"${pageMaker.makeSearch(pageMaker.cri.page)}";
	});
	
	});
</script>
	<!--footer  -->
	<%-- 	<jsp:include page="../include/footer.jsp" /> --%>
</body>
</html>