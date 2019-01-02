<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../includes/head.jspf"%>
<script src="/resources/vendor/ckeditor/ckeditor.js"></script>
</head>

<body>

	<div id="wrapper">

		<%@ include file="../includes/nav.jspf"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">/register</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form role="form" action="/board/register" method="post">
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="15" name="content" id="content"></textarea>
								</div>
								<div class="form-group">
									<label>이름</label>
									<input class="form-control" name="writer">
								</div>
								<button type="submit" class="btn btn-success">등록</button>
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
	<script>
		CKEDITOR.replace('content',{
			language: 'ko'
		});
		$('form').on('submit',function(){
			for (instance in CKEDITOR.instances) {
	            CKEDITOR.instances[instance].updateElement();
	    	}
		})
	</script>
</body>

</html>
