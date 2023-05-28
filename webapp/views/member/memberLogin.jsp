<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 페이지</title>
<link rel="stylesheet" href="./css/font.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
</style>
<script>
	function check() {
		if ($.trim($("#id").val()) == "") {
			alert("아이디를 입력해주세요.");
			$("#user_id").val("").focus();
			return false;
		}
		if ($.trim($("#pass").val()) == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").val("").focus();
			return false;
		}
	}

	// 쿠키에 user_id를 저장
	function setCookie(name, value, expiredays) {
		var today = new Date();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ today.toGMTString() + ";"
	}

	// 쿠키에서 user_id를 가져옴
	function getCookie(name) {
		var cookieName = name + "=";
		var cookieArray = document.cookie.split(';');
		for (var i = 0; i < cookieArray.length; i++) {
			var cookie = cookieArray[i].trim();
			if (cookie.indexOf(cookieName) === 0) {
				return cookie.substring(cookieName.length, cookie.length);
			}
		}
		return null;
	}

	// 로그인 정보 저장
	function saveLogin() {
		var id = document.getElementById("id").value;
		if (id !== "") {
			// id 쿠키에 id 값을 7일간 저장
			setCookie("id", id, 7);
		} else {
			// id 쿠키 삭제
			setCookie("id", "", -1);
		}
	}

	// 페이지 로드 시 실행
	window.addEventListener("load", function() {
		// id 쿠키에서 id 값을 가져옴
		var cookieId = getCookie("id");
		if (cookieId) {
			// 가져온 id 값을 입력란에 설정
			document.getElementById("id").value = cookieId;
			document.getElementById("cb_saveId").checked = true;
		}
	});

	// 로그인 버튼 클릭 시
	document.getElementById("btn_login").addEventListener("click", function() {
		saveLogin();
	});
</script>

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<c:import url="../header.jsp" />

	<main class="form-signin w-100 m-auto">
		<form id="loginform" method="post" action="MemberLoginOk.do"
			onsubmit="return check()">
			<input type="hidden" name="user_no" value="${user_no}">
			<input
				type="hidden" name="local_no" value="${local_no}"> <br>
			<br>
			<h4 class="h3 mb-3 fw-normal">로그인</h4>

			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="아이디">
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="pass" name="pass"
					placeholder="비밀번호">
			</div>

			<!-- 아이디 저장여부 -->
			<div class="checkbox mb-3" align="left">
				<input type="checkbox" id="cb_saveId" name="cb_saveId">아이디
				저장
			</div>

			<!-- 로그인 -->
			<input class="w-100 btn btn-lg btn-primary" type="submit"
				id="btn_login" value="로그인">

			<div class="my-2 text-center text-small text-decoration: none">
				<a href="findid.do" class="text-muted">아이디 찾기</a>
				<a href="finduserpwd.do" class="text-muted">비밀번호 찾기</a>
				<a href="member_form.do" class="text-muted">회원가입</a><br>
			</div>

			<!-- 로그인 api 구글, 네이버, 카톡 작성하기 -->
			<!-- 카카오 로그인 -->
			<br>
			<p class="text-muted">SNS계정으로 간편 로그인/회원가입</p>
			<a class="kakaoLogin"
				href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=53907bf2cc99ddbb1929db25394e8fae&redirect_uri=http://localhost/goSeoul/kakaoLogin.do">
				<img src="images/kakao.png" width="60px" />
			</a> <br> <br>
		</form>
	</main>

	<c:import url="../footer.jsp" />
</body>
</html>