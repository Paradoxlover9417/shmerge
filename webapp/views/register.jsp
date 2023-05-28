<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	body {
		padding: 50px;
	}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Register</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class=" panel panel-default">
				<div class="panel-heading">Board Register</div>
				<div class="panel-body">
					<form role="form" method="post" action="/result.do">
						<div class="form-group">
							<label>Title</label> <input class="form-control" name='title'>
						</div>
						<div>
							<label>Text area</label>
							<textarea class="form-control" rows="3" name='content'></textarea>
						</div>
						<div>
							<label>Writer</label> <input class="form-control" name='writer'>
						</div>
						<button type="submit" class="btn btn-default">Submit
							Button</button>
						<button type="reset" class="btn btn-default">Reset Button</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>