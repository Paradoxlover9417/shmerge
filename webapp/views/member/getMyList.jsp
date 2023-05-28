<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go Seoul</title>
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
	font-weight: lighter;
	witdh: 100%;
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

				<h2>내가쓴 작성글</h2>
				<!-- <table class="table table-striped"> -->
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">작성자</th>
							<th scope="col">글제목</th>
							<th scope="col">조회수</th>
							<th scope="col">좋아요</th>
							<th scope="col">싫어요</th>
							<th scope="col">작성시간</th>
						</tr>
					</thead>

					<c:if test="${empty list}">
						<tr>
							<td colspan="13">데이터가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty list}">
						<%-- <c:set var="no" value="${no }"></c:set> --%>
						<c:forEach var="FreeBean" items="${list}">
							<tr>
								<%-- <th scope="row">${no}</th> --%>
								<td>${FreeBean.free_no}</td>
								<td>${FreeBean.free_category}</td>
								<td>${FreeBean.free_nick}</td>
								<td>${FreeBean.free_title}</td>
								<td>${FreeBean.free_hit}</td>
								<td>${FreeBean.free_like}</td>
								<td>${FreeBean.free_dislike}</td>
								<td>${FreeBean.free_date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</main>
		</div>
	</div>
	<%-- <form action="freeList.do?pageNum=1">
			<select name="search">
				<option value="free_title"
					<c:if test="${search=='free_title'}">selected="selected" </c:if>>제목</option>
				<option value="free_content"
					<c:if test="${search=='free_content'}">selected="selected" </c:if>>내용</option>
				<option value="user_no"
					<c:if test="${search=='user_no'}">selected="selected" </c:if>>작성자</option>
				<option value="subcon"
					<c:if test="${search=='subcon'}">selected="selected" </c:if>>제목+내용</option>
			</select> <input type="text" name="keyword"> <input type="submit"
				value="확인">
		</form> --%>

	<!-- 검색목록 페이징 -->
	<%-- <nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
		<li class="page-item">
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					
					 <li class="page-item">
      <a class="page-link" href="freeList.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}" aria-label="Previous">이전
        <span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li class="page-item"><a class="page-link" href="freeList.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					 <li class="page-item">
      <a class="page-link" href="freeList.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}" aria-label="Next">다음
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
				</c:if>
			</c:if> --%>

	<!-- 전체목록 페이징 -->
	<%-- <c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
				 <li class="page-item">
      <a class="page-link" href="freeList.do?pageNum=${pp.startPage - 1}" aria-label="Previous">이전
        <span aria-hidden="true">&laquo;</span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li class="page-item" <c:if test="${pp.currentPage==i}">class="active"</c:if>>
					<a class="page-link" href="freeList.do?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
				 <a class="page-link" href="freeList.do?pageNum=${pp.endPage + 1}" aria-label="Next">다음
        <span aria-hidden="true">&raquo;</span></a></li>
				</c:if>
			</c:if>
		</ul> --%>
	</div>

	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
 -->

	<c:import url="../footer.jsp" />
</body>

</html>