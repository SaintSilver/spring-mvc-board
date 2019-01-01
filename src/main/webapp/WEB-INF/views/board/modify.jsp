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
					<h1 class="page-header">/modify</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
						<p>#<c:out value="${board.bno}"/>번 글 수정</p>
							<form role="form" method="post" id="modifyForm">
							
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title" value="<c:out value='${board.title}'/>">
								</div>
								
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="15" name="content"><c:out value='${board.content}'/></textarea>
								</div>
								
								<div class="form-group">
									<label>이름</label>
									<input class="form-control" name="writer" readonly="readonly" value="<c:out value='${board.writer}'/>">
								</div>
								
								<input type="hidden" name="bno" value="${board.bno}">
								<input type="hidden" name="regDate" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regDate}"/>">
								<input type="hidden" name="updateDate" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>">
								
								<div class="row">
									<button type="submit" class="btn btn-primary" formaction="/board/modify">수정</button>
									<button type="submit" class="btn btn-danger" formaction="/board/remove">삭제</button>
									<a href="/list"><button type="button" class="btn btn-success">취소</button></a>
								</div>
								
							</form>
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
