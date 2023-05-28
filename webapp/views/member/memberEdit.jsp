<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정보 수정</title>

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

<!-- 유효성 검사 -->
<script src="../../js/member.js"></script>
<style>
* {
	font-family: 'Title_Medium';
}

.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	z-index: 1000;
	background: #fff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 25% !important;
}

.bd-sidebar .nav {
	display: block;
	margin: 20px auto;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: .25rem 1.5rem;
	font-size: 120%;
}
</style>

</head>
<body>

	<c:import url="../header.jsp" />

	<div class="container">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="memberInfo.do">회원정보</a></li>
					<li><a href="getMyList.do">작성글 확인</a></li>
					<li><a href="getMyReserve.do">동행예약 확인</a></li>
					<li><a href="member_delete_ok.do">회원탈퇴</a></li>
				</ul>
				<br>
			</div>
			<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">
				<!-- <form id="myform" method="post" action="member_join_ok.do"
					 onSubmit="location.href="member_join_ok.do"> -->
				<form method="post" action="memberEdit.do" onSubmit="return check()">

					<h2>회원정보수정</h2>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" autofocus="autofocus" id="id" name="id"
								value="${edit.id }">
						</div>
						<div class="col-md-6 mb-3" id="posRelNick">
							<label for="nick">별명(닉네임)</label> <input type="text"
								class="form-control" id="nick" name="nick" value="${edit.nick }">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="pass">비밀번호</label> <input type="password"
								class="form-control" id="pass" name="pass" value="${edit.pass }">
						</div>
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" name="name" value="${edit.name }">
						</div>
					</div>
					<div>

						<div class="">
							<label for="birth">생년월일</label> <input type="text"
								class="form-control" id="birth" name="birth"
								value="${edit.birth }">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="tel">번호 앞자리</label> <input type="text"
								class="form-control" id="tel" name="tel2" value="${edit.tel2 }">
						</div>
						<div class="col-md-6 mb-3">
							<label for="tel">번호 뒷자리</label> <input type="text"
								class="form-control" id="tel" name="tel3" value="${edit.tel3 }">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="email">이메일</label> <input type="text" size="10"
								class="form-control" id="email" name="email"
								value="${edit.email }">

						</div>
						<div class="col-md-6 mb-3">
							<label for="email">도메인</label> <input type="text" size="10"
								class="form-control" id="email" name="domain"
								value="${edit.domain }">

						</div>
					</div>
					<div>

						<div class="">
							<label for="region">선호지역</label> <input type="text" size="10"
								class="form-control" id="region" name="region"
								value="${edit.region }">
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="gender">성별</label> <input type="text" size="10"
								class="form-control" id="gender" name="gender"
								value="${edit.gender }">
						</div>
						<div class="col-md-6 mb-3">
							<label for="MBTI">MBTI</label> <input type="text" size="10"
								class="form-control" id="MBTI" name="MBTI" value="${edit.MBTI }">
						</div>
					</div>
					<div class="mb-3">
						<label for="interests">관심사</label>
						<div id="interests" class="form-control" align="center">
							<input type="checkbox" id="h1" name="interests" value="액티비티"
								checked readonly>액티비티&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="checkbox" id="h2" name="interests" value="게임">게임&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="h3" name="interests" value="등산"
								readonly>등산&nbsp;&nbsp;&nbsp; <input type="checkbox"
								id="h4" name="interests" value="맛집" readonly>맛집&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="h5" name="interests" value="쇼핑"
								readonly>쇼핑&nbsp;&nbsp;&nbsp;
						</div>
					</div>
					<div class="mb-3">
						<div>
							자기소개<span class="text-muted">&nbsp;(필수 아님)</span>
						</div>
						<textarea id="intro" name="intro" rows="5" style="width: 100%;"
							value="${edit.intro }">${edit.intro }</textarea>
					</div>

					<div class="mb-4">
						<input class="btn btn-primary btn-lg btn-block" type="submit" value="수정하기">

					</div>


				</form>
			</main>
		</div>
	</div>

	<c:import url="../footer.jsp" />
</body>
</html>