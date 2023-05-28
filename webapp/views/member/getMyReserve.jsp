<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/font.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
<style>
body {
	font-family: 'Title_Medium';
}

.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 20px;
	margin-top: 50px;
	row-gap: 20px;
}

.card {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	width: 100%;
	height: 200px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	background-size: cover;
	position: relative;
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

				<div id="withlist">
					<h2 class="withlist_title">동행예약
						확인</h2>

					<div class="card-container">
						<c:forEach items="${rb}" var="ReserveBean">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">
										<a
											href="with_detail.do?with_no=${ReserveBean.with_no}&page=${page}&state=detail">${ReserveBean.with_title}</a>
									</h5>
									<p class="card-text">모집인원 ${ReserveBean.with_maxto}</p>
									<p class="card-text">나이 ${ReserveBean.with_age}</p>
									<p class="card-text">날짜 ${ReserveBean.with_start} ~
										${ReserveBean.with_end}</p>
								</div>
							</div>
						</c:forEach>
					</div>

					<div class="page d-flex justify-content-center my-2">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if
									test="${listcount > 0 && search == null && keyword == null}">
									<c:if test="${startpage > 10}">
										<li class="page-item"><a class="page-link"
											href="with_list.do?page=${startpage-10}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>

									<c:forEach var="a" begin="${startpage}" end="${endpage}">
										<li class="page-item"><a class="page-link"
											href="with_list.do?page=${a}">${a}</a></li>
									</c:forEach>

									<c:if test="${endpage < maxpage}">
										<li class="page-item"><a class="page-link"
											href="with_list.do?page=${startpage+10}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
								</c:if>

								<c:if test="${search != null && keyword != null}">
									<c:if test="${startpage > 10}">
										<li class="page-item"><a class="page-link"
											href="with_list.do?page=${startpage-10}&search=${search}&keyword=${keyword}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>

									<c:forEach var="a" begin="${startpage}" end="${endpage}">
										<li class="page-item"><a class="page-link"
											href="with_list.do?page=${a}&search=${search}&keyword=${keyword}">${a}</a>
										</li>
									</c:forEach>

									<c:if test="${endpage < maxpage}">
										<li class="page-item"><a class="page-link"
											href="with_list.do?page=${startpage+10}&search=${search}&keyword=${keyword}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</main>
		</div>
	</div>
	<c:import url="../footer.jsp" />
</body>
</html>