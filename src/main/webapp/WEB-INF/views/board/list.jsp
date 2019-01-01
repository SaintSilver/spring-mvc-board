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
							<button type="button" id="regBtn" class="btn btn-primary pull-right">글쓰기</button>
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
											<td><c:out value="${board.title}" /></td>
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
									<li class="paginate_button previous"><a href="#">Prev</a></li>
									<li><a href='#'>1</a></li>
									<li class="paginate_button next"><a href="#">Next</a></li>
								</ul>
							</div>
							<!-- paging -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@ include file="../includes/footer.jspf"%>

</body>

</html>
