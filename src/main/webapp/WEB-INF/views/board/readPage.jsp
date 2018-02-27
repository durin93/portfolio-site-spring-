<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!--header -->

<c:import url="../include/header.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<body class="pt60 pb60">
	<!-- Main content -->
	<!--main content  -->
	<div id="wrap" class="w1800 h750 bd1_s_b mg3perauto pd_all1per">

		<!-- 센터 -->
		<div class="mg10auto fs20pt ftbold">READ BOARD</div>

		<form role="form" action="modifyPage" method="post">
			<input type="hidden" name="bno" value="${boardVO.bno }" /> <input
				type="hidden" name="page" value="${cri.page }" /> <input
				type="hidden" name="perPageNum" value="${cri.perPageNum }" /> <input
				type="hidden" name="searchType" value="${cri.searchType }" /> <input
				type="hidden" name="keyword" value="${cri.keyword }" />
		</form>


		<div class="box-body">
			<div>
				<label class="input_header">글 번호</label> <input class="dp_b"
					type="text" name='bno' value="${boardVO.bno}" readonly="readonly">
			</div>
			<div>
				<label class="input_header">제 목</label> <input class="dp_b"
					type="text" name='title' value="${boardVO.title}"
					readonly="readonly">
			</div>
			<div>
				<label class="input_header">내 용</label> <input class="content dp_b"
					type="text" name='content' value="${boardVO.content}"
					readonly="readonly">
			</div>
			<div>
				<label class="input_header">작성자</label> <input class="dp_b"
					type="text" name='writer' value="${boardVO.writer}"
					readonly="readonly">
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer">
			<button type="submit" class="input_button   modifyBtn">수정하기</button>
			<button type="submit" class="input_button   removeBtn">삭제하기</button>
			<button type="submit" class="input_button   goListBtn">목록으로</button>
		</div>


		<div class="reply apply">
		<div class="mg10auto fs20pt ftbold">ADD REPLY</div>
		<div class="box-body">
			<div>
				<label class="input_header">작성자</label> <input class="newReplyWriter dp_b"
					type="text"  placeholder="아이디" />
			</div>
			<div>
				<label class="input_header">내용</label> <input class="newReplyText dp_b"
					type="text" placeholder="내용" />
			</div>
			<button class="replyAddBtn">작성하기</button>
		</div>
		</div>
		
		<div class="reply list">
		<ul class="replies">
		</ul>
		
		<div>
			<ul class="pagination">
			
			</ul>
		</div>
		</div>
	<!-- reply list -->
	
	<div class="modReply dp_n">
		<div class="modal-title"></div>
		<div>
			<input type="text" class="replytext">
		</div>
		<div>
			<button type="button" class="replyModBtn">수정</button>
			<button type="button" class="replyDelBtn">삭제</button>
			<button type="button" class="closeBtn">닫기</button>
		</div>
	</div>
	
	</div>
	<!-- content -->
	
<!-- 					댓글			 -->

	
	<script>
		

		var bno = ${boardVO.bno	};
		var replyPage = 1;
		
		getPageList(1);		
		
		
		function getAllList(){
			$.getJSON("/replies/all/" + bno, function(data){
				
				var str="";
				console.log(data.length);
				
				$(data).each(function(){
					str+= "<li data-rno='"+this.rno+"' class='replyLi'>"
					+this.rno + ":" + this.replytext + "<button>수정</button></li>";
				});
				
				$(".replies").html(str);
			});
		}


		function getPageList(page){
			$.getJSON("/replies/" + bno +"/"+page, function(data){
				
				console.log(data.list.length);
				var str="";

				$(data.list).each(function(){
					str+= "<li data-rno='"+this.rno+"' class='replyLi'>"
					+this.rno + ":" + this.replytext + "<button>수정</button></li>";
				});
				
				$(".replies").html(str);
				printPaging(data.pageMaker);
			});
		}
		
		
		function printPaging(pageMaker){
			
			var str = "";
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
			
			for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.page == i?'class=active':'';
				str += "<li "+strClass+"><a href='"+i+"'>" +i+ "</a></li>";
			}
			
			if(pageMaker.next){
				str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
			}
			
			$(".pagination").html(str);
			
		}
		

		$(".pagination").on("click", "li a",  function(event) {

			//<ahref 태그의 기본동작인 페이지전환을 막음 
			//화면이동을 막고 현재 클릭된 페이지번호를 얻고 그걸로 getPageList를호출
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPageList(replyPage);
		});

		
		
		
		
		$(".replies").on("click", ".replyLi button", function(){
			var reply = $(this).parent();
			var rno = reply.attr("data-rno");
			var replytext = reply.text();
			
			$(".modal-title").html(rno);
			$(".replytext").val(replytext);
			$(".modReply").show("slow");
			
			alert(rno + " : " + replytext);
		});
		
		
		$(".replyAddBtn").on("click",function() {
							var replyer = $(".newReplyWriter").val();
							var replytext = $(".newReplyText").val();

							$.ajax({
										type : 'post',
										url : '/replies/',
										headers : {
											"Content-Type" : "application/json",
											"X-HTTP-Method-Override" : "POST" },
										dataType : 'text',
										data : JSON.stringify({	bno : bno,	replyer : replyer,		replytext : replytext }),
										success : function(result) {
											console.log("result: "	+ result);
											if (result == 'SUCCESS') {
												alert("등록 되었습니다.");
												getAllList();
											}
										}});
						});

		
		
		
		$(".replyModBtn").on("click",function(){
			  
			  var rno = $(".modal-title").html();
			  var replytext = $(".replytext").val();
			  
			  $.ajax({
					type:'put',
					url:'/replies/'+rno,
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "PUT" },
					data:JSON.stringify({replytext:replytext}), 
					dataType:'text', 
					success:function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("수정 되었습니다.");
							$(".modReply").hide("slow");
							getPageList(replyPage);
						}
				}});
		});

		$(".replyDelBtn").on("click",function(){
			  
			  var rno = $(".modal-title").html();
			  var replytext = $(".replytext").val();
			  
			  $.ajax({
					type:'delete',
					url:'/replies/'+rno,
					headers: { 
					      "Content-Type": "application/json",
					      "X-HTTP-Method-Override": "DELETE" },
					dataType:'text', 
					success:function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("삭제 되었습니다.");
							$(".modReply").hide("slow");
							getAllList();
						}
				}});
		});
		
		
		// 			댓글
	</script>


	<!--  -->

	<script>
		$(document).ready(	function() {

							var formObj = $("form[role='form']");

							console.log(formObj);

							$(".modifyBtn").on("click", function() {
								formObj.attr("action", "/board/modifyPage");
								formObj.attr("method", "get");
								formObj.submit();
							});

							$(".removeBtn").on("click", function() {
								formObj.attr("action", "/board/removePage");
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

<!--footer  -->
<%-- <jsp:include page="../include/footer.jsp" /> --%>
