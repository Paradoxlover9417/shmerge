<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입폼</title>

<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

<script src="../../js/member.js"></script>
</head>

<style>
.body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#posRelId { /*아이디부분 div로 막음*/
	position: relative;
	/* border: 3px solid black;*/
}

#posRelId #dupbutid { /*중복검사버튼 아이디 위로 올림*/
	position: absolute;
	right: 3px;
	bottom: 4px;
}

#posRelDomain {
	position: relative;
	/* border: 3px solid rgb(0, 0, 0);
        box-sizing: border-box; */
}

#posRelDomain #mailid {
	position: absolute;
	right: 3px;
	bottom: 4px;
}

#textarea {
	width: 100%;
	height: 200px;
	resize: none;
}

#posRelNick {
	position: relative;
	box-sizing: border-box;
}

#posRelNick #dupbutnick {
	position: absolute;
	right: 3px;
	bottom: 4px;
}

#gender {

}
</style>


<body>


	<c:import url="../header.jsp" />
	<!-- <form id="myform" method="post" action="member_join_ok.do"> -->
	<form method="post" action=member_join_ok.do onSubmit="return check()">
		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">

					<h4 class="mb-3">회원가입</h4>

					<div class="mb-3">
						<div id="posRelId">
							<label for="id">아이디</label> <input type="id" class="form-control"
								autofocus="autofocus" id="id" name="id" placeholder="ID">

							<input type="button" id="dupbutid" value="중복검사"
								onClick="id_check()">
						</div>
						<div id="idcheck"></div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="pass">비밀번호</label> <input type="password"
								class="form-control" id="pass" name="pass" placeholder="비밀번호">
						</div>
						<div class="col-md-6 mb-3">
							<label for="pass2">비밀번호확인</label> <input type="password"
								class="form-control" id="pass2" name="pass2"
								placeholder="비밀번호확인">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" name="name" placeholder="이름">
						</div>
						<div class="col-md-6 mb-3">
							<div id="posRelNick">
								<label for="nick">별명(닉네임)</label> <input type="text"
									class="form-control" id="nick" name="nick" placeholder="닉네임">

								<input type="button" id="dupbutnick" value="중복검사"
									onClick="nick_check()">
							</div>
							<div id="nickcheck"></div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="email">이메일</label> <input type="text" size="10"
								class="form-control" id="email" name="email" placeholder="이메일@">
						</div>

						<div class="col-md-6 mb-3">
							<div id="posRelDomain">

								<label for="domain">도메인</label> <input type="text" size="15"
									class="form-control" id="domain" name="domain" placeholder="">

								<select id="mailid">
									<option value="">직접입력</option>
									<option value="naver.com">네이버</option>
									<option value="daum.net">다음</option>
									<option value="nate.com">네이트</option>
									<option value="gmail.com">구글</option>
								</select>
							</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="birth">생년월일</label> <input type="date"
							class="form-control" id="birth" name="birth" placeholder="">
					</div>

					<div class="row">
						<div class="col-md-3 mb-3">
							<label for="tel">휴대전화</label> <input type="text"
								class="form-control" id="tel1" name="tel1" value="010" readonly>
						</div>
						<div style="display: flex; align-items: center";>-</div>
						<div class="col-md-4 mb-3">
							<label for="tel">ㅤ</label> <input type="text"
								class="form-control" id="tel2" name="tel2" placeholder=""
								value="">

						</div>
						<div style="display: flex; align-items: center";>-</div>
						<div class="col-md-4 mb-3">
							<label for="tel">ㅤ</label> <input type="text"
								class="form-control" id="tel3" name="tel3" placeholder=""
								value="">
						</div>
					</div>

					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="MBTI">MBTI<span class="text-muted">&nbsp;(필수
									아님)</span></label> <input type="text" size="10" class="form-control" id="MBTI"
								name="MBTI" placeholder="ex) infp" value="">
						</div>
						<div class="col-md-4 mb-3">
							<label for="region">선호하는 지역</label> <input type="text" size="10"
								class="form-control" id="region" name="region"
								placeholder="ex) 종로구" value="">
						</div>

						<div class="col-md-4 mb-3">
							<label for="gender">성별</label>
							<div id="gender" class="form-control" align="center">
								<input type=radio id="male" name="gender" value="남자">남자
								<input type=radio id="female" name="gender" value="여자">여자
								<input type=radio id="none" name="gender" value="없음">없음
							</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="interests">관심사</label>
						<div id="interests" class="form-control" align="center">
							<input type="checkbox" id="h1" name="interests" value="액티비티"
								checked>액티비티&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="checkbox" id="h2" name="interests" value="게임">게임&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="h3" name="interests" value="등산">등산&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="h4" name="interests" value="맛집">맛집&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="h5" name="interests" value="쇼핑">쇼핑&nbsp;&nbsp;&nbsp;
						</div>
					</div>

					<div class="mb-3">
						<label for="info">자기소개<span class="text-muted">&nbsp;(필수
								아님)</span></label>
						<textarea id="intro" name="intro" rows="5" cols="50"
							placeholder="자기소개를 100자 이내로 입력하세요"></textarea>
					</div>

					<!-- <div class="row">
                        <div class="col-md-8 mb-3">
                            <label for="root">가입 경로</label>
                            <select class="custom-select d-block w-100" id="root">
                                <option value=""></option>
                                <option>감자 </option>
                                <option>카페</option>
                            </select>
                            <div class="invalid-feedback">
                                	가입 경로를 선택해주세요.
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="code">추천인 코드</label>
                            <input type="text" class="form-control" id="code" placeholder="" required>
                            <div class="invalid-feedback">
                               	 추천인 코드를 입력해주세요.
                            </div>
                        </div>
                    </div> -->

					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="agreement">
						<label class="custom-control-label" for="agreement">개인정보
							수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<!-- <button class="btn btn-primary btn-lg btn-block" type="button" onClick="check()">가입 완료</button> -->
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입
						완료</button>
				</div>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2023_goSeoul.team</p>
		</footer>
	</form>
		<c:import url="../footer.jsp" />
</body>
</html>