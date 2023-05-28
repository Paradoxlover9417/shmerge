<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

</head>
<style>
* {
	font-family: 'Title_Medium';
}

main {
	margin: 80px auto 100px;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: 0px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.text-muted {
	margin: 0 7px;
}
.searchButton {
	margin-top: 20px;
}
</style>
<body>
		<c:import url="../header.jsp" />
		<main class="form-signin w-100 text-center" >
			<form method="post" action="result.do">
			
				<h4 class="h3 mb-3 fw-normal">아이디 찾기</h4>
				<div class="form-floating">
					<input type="text" class="form-control" name="name"
						placeholder="이름" />

				</div>
				<div class="form-floating">
					<input type="text" class="form-control" name="email"
						placeholder="이메일 아이디" />

				</div>
				<div class="form-floating">
					<select name="domain" class="form-control">
						<option value="">이메일 도메인 선택</option>
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@nate.com">nate.com</option>
						<option value="@gmail.com">gmail.com</option>
					</select> <input type="submit" class="w-100 btn btn-lg btn-primary searchButton"
						name="action" value="아이디 찾기" />
				</div>
							<div class="my-2 text-center text-small text-decoration: none">
				<a href="MemberLogin.do" class="text-muted">로그인</a> 
				<a href="finduserpwd.do" class="text-muted">비밀번호 찾기</a> 
				<a href="member_form.do" class="text-muted">회원가입</a>
			</div>
			</form>
		</main>
<div class="footerBox">
		<c:import url="../footer.jsp" />

	</div>
	
</body>
</html>