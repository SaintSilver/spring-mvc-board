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
								<em>#<c:out value="${board.bno}" /></em>
								<b><c:out value="${board.writer}" /></b>
							</div>
							<div>
							<small>
								<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.regDate}" />
								<c:if test="${board.regDate != board.updateDate}">
									 / <u>수정됨 <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.updateDate}" /></u>
								</c:if>
							</small>
							</div>
							<h3><c:out value="${board.title}"/></h3>
							<hr>
							<div class="container-fluid">
								<p><c:out value="${board.content}"/></p>
								<div class="row text-right">
								<form method="get">
									<input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">
									<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
									<%-- <input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>"> --%>
									<button type="submit" class="btn btn-primary" formaction="/board/modify">수정</button>
									<button type="submit" class="btn btn-success" formaction="/board/list">목록</button>
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

		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@ include file="../includes/footer.jspf"%>

</body>

</html>
