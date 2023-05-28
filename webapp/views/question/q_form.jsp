<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 일반 문의</title>
<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<style>
* {
	font-family: 'Title_Medium';
}

label {
	font-weight: bold;
}

ul {
	list-style-type: '#';
	padding-inline-start: 1ch;
}

li {
	float: left;
	margin-right: 25px;
}

.q-btn {
	text-align: center;
}

.q-btn1 {
	display: inline-block;
}
.title {
	text-align: center;
}

.text-muted {
	margin: 0 9px;
}
</style>
</head>

<body>
    <c:import url="../header.jsp" />
    유저번호 : ${user.user_no}
    유저닉 : ${user.nick}
    로컬번호 : ${local.local_no}
	<form method="post" action="q_formResult.do">
		<div class="container" style="width: auto; height: auto;">
			<div style="width: 1000px; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">

	            <div class="form-group title">
	            <h3 class="title">서비스 일반 문의</h3>
                </div>

				<input type="hidden" name="user_no" value="${user.user_no}">

                <br>
				<div class="form-group row">
					<label for="q_category" class="col-sm-2 col-form-label">문의 유형</label>
					<div class="col-sm-10">
						<input type="radio" name="q_category" value="로그인/회원정보 문의" class="text-muted"required>로그인/회원정보 문의
						<input type="radio" name="q_category" value="투어 문의" class="text-muted" required>투어 문의
						<input type="radio" name="q_category" value="동행 문의" class="text-muted" required>동행 문의
						<input type="radio" name="q_category" value="서비스 개선 제안" class="text-muted" required>서비스 개선 제안
						<input type="radio" name="q_category" value="시스템 오류 제보" class="text-muted" required>시스템 오류 제보
						<input type="radio" name="q_category" value="불편 신고" class="text-muted" required>불편 신고
						<input type="radio" name="q_category" value="기타 문의" class="text-muted" required>기타 문의
					</div>
				</div>

				<div class="form-group">
					<input type="text" id="q_title" name="q_title"
						class="form-control" placeholder="제목을 입력해주세요." required>
				</div>

				<div class="form-group">
					<textarea id="q_content" name="q_content" rows="15" cols="50"
						class="form-control" placeholder="문의 내용을 입력해주세요." required></textarea>
				</div>

                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="agreement">
                    <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
                </div>
				<br>
				<div class="q-btn">
					<button type="submit" class="btn btn-outline-primary write-btn1">작성</button>
					<button type="reset" class="btn btn-outline-secondary write-btn1">취소</button>
				</div>

			</div>
		</div>
	</form>
	<c:import url="../footer.jsp" />
</body>
</html>