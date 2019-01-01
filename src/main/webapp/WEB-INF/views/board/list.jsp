<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<h1 class="page-header">/list</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="pull-left">
								<div class="col-xs-12">
									<form id="searchForm" action="/board/list" method="get">
										<select name="type">
											<option value="TC" <c:out value="${page.cri.type=='TC'?'selected':''}"/>>제목+내용</option>
											<option value="T" <c:out value="${page.cri.type=='T'?'selected':''}"/>>제목</option>
											<option value="C" <c:out value="${page.cri.type=='C'?'selected':''}"/>>내용</option>
											<option value="W" <c:out value="${page.cri.type=='W'?'selected':''}"/>>작성자</option>
										</select>
										<input type="text" name="keyword" value="<c:out value="${page.cri.keyword}"/>" />
										<input type="hidden" name="pageNum" value="<c:out value='${page.cri.pageNum}'/>">
										<button class="btn btn-default" id="searchBtn">검색</button>
									</form>
								</div>
							</div>
							<!-- /.search -->
							<a href="/board/register">
								<button type="button" id="regBtn" class="btn btn-primary pull-right">글쓰기</button>
							</a>
							<div class="clearfix"></div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="col-md-1">번호</th>
										<th class="col-md-7">제목</th>
										<th class="col-md-2">이름</th>
										<th class="col-md-1">작성일</th>
										<th class="col-md-1">수정일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="board">
										<tr>
											<td><c:out value="${board.bno}" /></td>
											<td>
												<a class="move" href="<c:out value='${board.bno}'/>"><c:out value="${board.title}" /></a>
											</td>
											<td><c:out value="${board.writer}" /></td>
											<td><fmt:formatDate pattern="MM-dd" value="${board.regDate}" /></td>
											<td><fmt:formatDate pattern="MM-dd" value="${board.updateDate}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- /.table-responsive -->
							
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${page.prev}">
										<li class="paginate_button previous"><a href="<c:out value='${page.startPage-1}'/>">Prev</a></li>
									</c:if>
									<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
										<li class='paginate_button ${page.cri.pageNum == num ? "active":"" }'>
											<a href='<c:out value="${num}"/>'><c:out value="${num}"/></a>
										</li>
									</c:forEach>
									<c:if test="${page.next}">
										<li class="paginate_button next"><a href="<c:out value='${page.endPage+1}'/>">Next</a></li>
									</c:if>
								</ul>
							</div>
							<!-- /. paging -->
							
							<form action="/board/list" method="get" id="actionForm">
								<input type="hidden" name="pageNum" value="<c:out value='${page.cri.pageNum}'/>">
								<input type="hidden" name="keyword" value="<c:out value="${page.cri.keyword}"/>" />
								<input type="hidden" name="type" value="<c:out value='${page.cri.type}'/>">
							</form>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModallabel">알림</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@ include file="../includes/footer.jspf"%>
	<script>
		$(function() {
			var result = '<c:out value="${result}" />';

			checkModal(result);
			history.replaceState({}, null, null);

			function checkModal(result) {
				if (result === '' || history.state) {
					return;
				}
				if (parseInt(result) > 0) {
					$('.modal-body').html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
				}
				$('#myModal').modal('show');
			}
		});
	</script>
</body>

</html>
