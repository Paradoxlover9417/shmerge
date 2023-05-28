<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>동행 구하기</title>
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


<!-- 모집인원 range -->
<script>
	$(document).ready(function() {
		$('.range-slider__range').on('input', function() {
			var value = $(this).val();
			$(this).next('.range-slider__value').html(value);
		});

		$('.range-slider__range').each(function() {
			var value = $(this).val();
			$(this).next('.range-slider__value').html(value);
		});
	});

<!-- 해시태그 처리 -->
$(document).ready(function() {
  var with_tag = [];
  var counter = 0;

  // 입력한 값을 태그로 생성한다.
  function addTag(value) {
    with_tag[counter] = value;
    counter++; // del-btn의 고유 id가 된다.
  }

// 서버에 제공
$("#with_tag").on("keyup", function (e) {

var tag = $("#tag-list").text();
console.log(tag);
$("#tag").val(tag);
});

$("#with_tag").on("keypress", function(e) {
var self = $(this);

// 엔터나 스페이스바 눌렀을 때 실행
if (e.key === "Enter" || e.keyCode == 32) {
var tagValue = self.val().trim();

// 해시태그 값이 없으면 실행하지 않음
if (tagValue !== "") {
// 같은 태그가 있는지 검사한다. 있다면 해당 값이 배열로 반환된다.
var result = Object.values(with_tag).filter(function(word) {
return word === tagValue;
});

// 해시태그가 중복되지 않으면 추가
if (result.length === 0) {
$("#tag-list").append("<li>" + tagValue + "<span class='del-btn' idx='" + counter + "'>✕</span></li>");
addTag(tagValue);
self.val("");

console.log("with_tag: "+with_tag);
console.log("tagValue: "+tagValue);
} else {
alert("태그값이 중복됩니다.");
}
}
e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
 }
  });

// 삭제 버튼
// 인덱스 검사 후 삭제
$(document).on("click", ".del-btn", function(e) {
     var index = $(this).attr("idx");
     with_tag[index] = "";
     $(this).parent().remove();
   });
   })

// 날짜 처리
// 종료일자를 시작일자 이후로 선택가능처리
function checkDate(event) {
  var selectedStartDate = document.getElementById("with_start").value;
  var selectedEndDate = document.getElementById("with_end").value;
  var currentDate = getCurrentDate();

  if (selectedStartDate < currentDate) {
    showAlert("시작일자는 현재일자와 같거나 이후로 선택해주세요.", "#with_start");
    event.preventDefault();
    return;
  }

  if (selectedEndDate < selectedStartDate) {
    showAlert("종료일자는 시작일자와 같거나 이후로 선택해주세요.", "#with_end");
    event.preventDefault();
  }
}

function showAlert(message, elementId) {
  alert(message);
  $(elementId).val("").focus();
}

function getCurrentDate() {
  var today = new Date();
  var year = today.getFullYear();
  var month = ("0" + (today.getMonth() + 1)).slice(-2);
  var day = ("0" + today.getDate()).slice(-2);
  return year + "-" + month + "-" + day;
}
</script>

<style>
* {
	font-family: 'Title_Medium';
}

input[type="date"] {
	width: 100%; /* 원하는 길이로 설정 */
}

input[type="range"] {
	width: 95%; /* 원하는 길이로 설정 */
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

.write-btn {
	text-align: center;
}

.write-btn1 {
	display: inline-block;
}

.title {
	text-align: center;
}

.text-muted {
	margin: 0 7px;
}
</style>
</head>

<body>
내용${with.with_content}
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form method="post" action="withUpdateResult.do"
		enctype="multipart/form-data">
		<div class="container" style="width: auto; height: auto;">
			<div
				style="width: 1000px; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">

				<div class="form-group title">
					<h3 class="title">동행 구하기 수정</h3>
				</div>

				<input type="hidden" name="with_no" value="${with.with_no}">
				<input type="hidden" name="page" value="${page}" />
				<!--<input type="hidden" name="with_curno" value="${with.with_curno}">-->

				<div class="form-group row">
					<label for="with_gender" class="col-sm-2 col-form-label">성별</label>
					<div class="col-sm-4">
						<input type="radio" id="with_gender" name="with_gender" value="여성"
							class="text-muted" ${with.with_gender == '여성' ? 'checked' : ''} required>여성
						<input type="radio" id="with_gender" name="with_gender" value="남성"
						class="text-muted" ${with.with_gender == '남성' ? 'checked' : ''} required>남성
					</div>
					<label for="with_age" class="col-sm-2 col-form-label">나이</label>
					<div class="col-sm-4">
						<select class="custom-select mr-sm-2" id="with_age"
							name="with_age" value="${with.with_age}">
							<option selected ${with.with_age == null ? 'selected' : ''}>선택</option>
							<option value="20" ${with.with_age== '20' ? 'selected' : ''}>20대</option>
							<option value="30" ${with.with_age== '30' ? 'selected' : ''}>30대</option>
							<option value="40" ${with.with_age== '40' ? 'selected' : ''}>40대</option>
							<option value="50" ${with.with_age== '50' ? 'selected' : ''}>50대</option>
							<option value="60" ${with.with_age== '60' ? 'selected' : ''}>60대 이상</option>
						</select>
					</div>
				</div>

				<div class="form-group row">
					<label for="local_no" class="col-sm-2 col-form-label">지역</label>
					<div class="col-sm-10">
						<input type="radio" name="with_category" value="광화문" class="text-muted" ${with.with_category == '광화문' ? 'checked' : ''} required>광화문
                                <input type="radio" name="with_category" value="명동" class="text-muted" ${with.with_category == '명동' ? 'checked' : ''} required>명동
                                <input type="radio" name="with_category" value="동대문" class="text-muted" ${with.with_category == '동대문' ? 'checked' : ''} required>동대문
                                <input type="radio" name="with_category" value="홍대" class="text-muted" ${with.with_category == '홍대' ? 'checked' : ''} required>홍대
                                <input type="radio" name="with_category" value="여의도" class="text-muted" ${with.with_category == '여의도' ? 'checked' : ''} required>여의도
                                <input type="radio" name="with_category" value="이태원" class="text-muted" ${with.with_category == '이태원' ? 'checked' : ''} required>이태원
                                <input type="radio" name="with_category" value="강남" class="text-muted" ${with.with_category == '강남' ? 'checked' : ''} required>강남
                                <input type="radio" name="with_category" value="잠실" class="text-muted" ${with.with_category == '잠실' ? 'checked' : ''} required>잠실
                                <input type="radio" name="with_category" value="기타" class="text-muted" ${with.with_category == '기타' ? 'checked' : ''} required>기타
                    </div>
				</div>

				<div class="form-group row">
                    <label for="customRange2" class="col-sm-2 col-form-label">모집 인원</label>
                    <div class="col-sm-10">
                        <input type="range" class="range-slider__range" value="${with.with_maxto}" min="1" max="15" id="with_maxto" name="with_maxto" required>&nbsp;
                        <span class="range-slider__value">${with.with_maxto}</span>명
                    </div>
                </div>


				<div class="form-group row">
					<label for="date" class="col-sm-2 col-form-label">날짜 선택</label>
					<div class="col">
						<input class="form-control" type="date" name="with_start"
							id="with_start" onChange="checkDate(event)" value="${with.with_start}" required>
					</div>
					-
					<div class="col">
						<input class="form-control" type="date" name="with_end"
							id="with_end" onChange="checkDate(event)" value="${with.with_end}" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="with_filename" class="col-sm-2 col-form-label">첨부
						파일</label>
					<div class="col-sm-10">
						<input class="form-control" type="file" id="with_filename"
							name="with_filename1" value="${with.with_filename}">${with.with_filename}
						<img src="./upload/${with.with_filename}" width="200px">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<input type="text" id="with_title" name="with_title"
						class="form-control" placeholder="제목을 입력해주세요." value="${with.with_title}" required>
				</div>

				<div class="form-group">
					<textarea id="with_content" name="with_content" rows="15" cols="50"
						class="form-control" placeholder="내용을 입력해주세요." required>${with.with_content}</textarea>
				</div>

				<div class="tr_hashTag_area">
					<div class="form-group">
						<input type="hidden" id="tag" name="with_tag" value="${with.with_tag}"> <input
							type="text" id="with_tag" placeholder="#태그입력"
							class="form-control" >
					</div>
					<ul id="tag-list">
					    <c:forEach items="${with.with_tag}" var="tag">
                                <li>${tag}</li>
                        </c:forEach>
					</ul>
				</div>

				<br>
				<div class="write-btn">
					<button type="submit" class="btn btn-outline-primary write-btn1">수정</button>
					<button type="reset" class="btn btn-outline-secondary write-btn1">취소</button>
				</div>

			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>