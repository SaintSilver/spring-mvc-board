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
										<th>번호</th>
										<th>제목</th>
										<th>이름</th>
										<th>작성일</th>
										<th>최근수정일</th>
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
							<div class="pull-right">
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
							<form action="/board/list" method="get" id="actionForm">
								<input type="hidden" name="pageNum" value="<c:out value='${page.cri.pageNum}'/>">
								<%-- <input type="hidden" name="amount" value="<c:out value='${page.cri.amount}'/>"> --%>
							</form>
							<!-- /. paging -->
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
