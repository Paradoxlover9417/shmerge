<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			let id = $("input[name='ui_id']").val();
			let email = $("input[name='ui_email']").val();
			let domain = $("select[name='domain']").val();
			/* let obj = {"name":id, "email":email}; */
			$.ajax({
				url : "find.do",
				dataType : 'json',
				type : 'post',
				data : {
					"id" : id,
					"email" : email,
					"domain" : domain
				},
				success : function(data) {
					if (JSON.parse(data) == true) {
						alert("임시 비밀번호가 발급되었습니다. 메일함을 확인해 주세요.");
						console.log(data);
					} else {
						alert("아이디 또는 이메일을 정확하게 입력해 주세요.");
						console.log(data);
					}
				}
			});
		});
	});
</script>
</head>
<title>비밀번호 찾기</title>
<style>
* {
	font-family: 'Title_Medium';
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
	<main class="form-signin w-100 text-center">
		<form method="post">
			<h2>비밀번호 찾기</h2>
			<div class="form-floating">
				<input type="text" class="form-control" name="ui_id"
					placeholder="아이디">
			</div>
			<div class="form-floating">
				<input type="email" class="form-control" name="ui_email"
					placeholder="이메일 아이디">
			</div>
			<select name="domain" class="form-control">
				<option value="">이메일 선택</option>
				<option value="@naver.com">naver.com</option>
				<option value="@daum.net">daum.net</option>
				<option value="@nate.com">nate.com</option>
				<option value="@gmail.com">gmail.com</option>
			</select> <input type="button" class="w-100 btn btn-lg btn-primary searchButton"
				value="임시비밀번호 발급" id="btn"><br>
							<div class="my-2 text-center text-small text-decoration: none">
				<a href="MemberLogin.do" class="text-muted">로그인</a> 
				<a href="findid.do" class="text-muted">아이디 찾기</a>
				<a href="member_form.do" class="text-muted">회원가입</a>
			</div>
		</form>
	</main>
	<div class="footerBox">
		<c:import url="../footer.jsp" />
	</div>
</body>
</html>