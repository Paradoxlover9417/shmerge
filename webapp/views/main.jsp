<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/style.css">
<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
<script src="./js/mymother.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<style>
.seoul {
	width: 600px;
}

.body {
	height: 100%;
}

.body .wrap {
	position: relative;
	min-height: 100%;
}

.footerBox {
	width: 100%;
	position: absolute;
	bottom: 0;
}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="header.jsp"%>

		<div class="d-flex justify-content-center"></div>
		<section>
			<h1>
				환영합니다.<br>GO SEOUL 홈페이지 입니다.
			</h1>
		</section>

		<div class="footerBox">
			<%@ include file="footer.jsp"%>
		</div>
	</div>

</body>
</html>