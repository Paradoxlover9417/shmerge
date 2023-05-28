<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행정보 공유</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<style>
* {
	font-family: 'Title_Medium';
}

th {
	font-weight: bold;
	width: 16%;
}
td {
	text-align:left;
}

.write-btn {
	text-align: center;
}

.write-btn1 {
	display: inline-block;
}
</style>
</head>

<body>
	<c:import url="../header.jsp" />
	<br>
	<h4 class="mb-3" align="center">여행정보 공유 상세내용</h4>
	<form method="post" action="freeUpdateResult.do">
		<div class="container" style="width: auto; height: auto;">
			<div
				style="width: 100%; height: auto; margin: 50px auto; 
				background-color: white; border-radius: 10px;">

				<input type="hidden" name="free_id" value="${freeBean.free_id}"> 
				<input type="hidden" name="free_no" value="${freeBean.free_no}"> 
				<input type="hidden" name="pageNum" value="${pageNum}">	
				

				<div class="form-group row">
					<label for="free_category" style="text-indent: 10px;"
					class="col-sm-2 col-form-label"><b>카테고리</b></label>
					<div class="col-sm-3">
						<input class="custom-select mr-sm-3" id="free_category"
							value="${freeBean.free_category}" readonly>
					</div>
				</div>

				<table class="table">
					<tbody>
						<tr>
							<th style="width:25%;"scope="row">작성자</th>
							<td>${freeBean.free_nick}</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td>${freeBean.free_title}</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td>
								<div style="white-space: pre-line;">${freeBean.free_content}
								</div> <c:if test="${freeBean.free_filename} != null">
									<img src="${freeBean.free_filename}">
								</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">해시태그</th>
							<td>${freeBean.free_tag}</td>
						</tr>
						
					</tbody>
				</table>
							<div style="margin: 0 auto; text-align: center;">
							<c:set var="id" value="${id }" scope="session" />
							<c:if test="${id != null }">
							<tr>
								<td><span id="add-goodRp-btn" 
								class="btn btn-outline-primary">좋아요<br>👍
								</span></td>
								<td><span id="add-badRp-btn" 
								class="btn btn-outline-danger">싫어요<br>👎
								</span></td>
							</tr>
						</c:if>
							</div>
				<br>
				<div class="write-btn">
					<a href="freeWrite.do?pageNum=${pageNum}"
						class="btn btn-outline-primary">작성</a> <a
						href="freeList.do?pageNum=${pageNum}"
						class="btn btn-outline-primary">목록</a> <a
						href="freeUpdate.do?num=${freeBean.free_no}&pageNum=${pageNum}"
						class="btn btn-outline-primary">수정</a> <a
						href="freeDelete?num=${freeBean.free_no}&pageNum=${pageNum}"
						class="btn btn-outline-danger">삭제</a>
				</div>

			</div>
		</div>
	</form>
	<script>
		document.getElementById("add-goodRp-btn").onclick = function() {
			alert("좋아요 +1");
			location.href = "freeLikeUpdate.do?num=${freeBean.free_no}&pageNum=${pageNum}";
		};

		document.getElementById("add-badRp-btn").onclick = function() {
			alert("싫어요 +1");
			location.href = "freeDislikeUpdate.do?num=${freeBean.free_no}&pageNum=${pageNum}";
		};
	</script>
	
	
	<c:import url="../footer.jsp" />
</body>
</html>
