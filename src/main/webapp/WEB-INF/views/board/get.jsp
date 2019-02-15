<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../includes/head.jspf"%>
</head>

<body>

	<div id="wrapper">

		<%@ include file="../includes/nav.jspf"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">/get</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div>
								<em>#<c:out value="${board.bno}" /></em> <b><c:out value="${board.writer}" /></b>
							</div>
							<div>
								<small> <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regDate}" /> <c:if test="${board.regDate != board.updateDate}">
									 / <u>수정됨 <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.updateDate}" /></u>
									</c:if>
								</small>
							</div>
							<h3>
								<c:out value="${board.title}" />
							</h3>
							<hr>
							<div class="container-fluid">
								<p>
									<c:out value="${board.content}" escapeXml="false" />
								</p>
								<div class="row text-right">
									<form class="form-inline" method="get" action="/board/modify">
										<input type="hidden" name="bno" value="<c:out value='${board.bno}'/>"> <input type="hidden" name="pageNum"
											value="<c:out value='${cri.pageNum}'/>"> <input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"> <input
											type="hidden" name="type" value="<c:out value='${cri.type}'/>">
										<button type="submit" class="btn btn-primary">수정</button>
									</form>
									<form class="form-inline" method="get" action="/board/list">
										<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>"> <input type="hidden" name="keyword"
											value="<c:out value='${cri.keyword}'/>"> <input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
										<button type="submit" class="btn btn-success">목록</button>
										<a href="/board/list">
											<button type="button" class="btn btn-warning">최근 글</button>
										</a>
									</form>
								</div>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i>댓글
						</div>
						<div class="panel-body">
							<ul class="chat">
								<li class="left clearfix" data-rno="12">
									<div>
										<div class="header">
											<strong class="primary-font">user</strong>
											<small class="pull-right text-muted">2018-01-01 13:13</small>
										</div>
										<p>댓글 내용</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@ include file="../includes/footer.jspf"%>
	<script src="/resources/js/reply.js"></script>
	<script>
	$(function(){
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $('.chat');
		
		showList(1);
		
		function showList(page){
			//댓글목록
			replyService.getList({
				bno : bnoValue,
				page : page||1
			}, function(list) {
				
				var str = "";
				var len = list.length || 0;
				
				if(list === null || len === 0){
					replyUL.html("");
					return;
				}
				
				for (var i = 0; i < len; i++) {
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "	<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str += "		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str += "		<p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
			});				
		}
	
	})

	</script>

</body>

</html>
