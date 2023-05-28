<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/font.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
<style>
    body {
        font-family: 'Title_Medium';
    }
    
    #withlist {
    	display: flex;
		flex-direction: column;
		align-items: left;
		width: 100%;
		max-width: 1400px;
		margin: 0 auto;
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
</style>
</head>
<body>
    <c:import url="../header.jsp" />
    <div id="withlist">
        <h1 class="withlist_title" style="font-size:40px; position:static; margin:10px;">동행 구하기</h1>

        <div class="card-container">
            <c:forEach items="${withlist}" var="with">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">
                            <a href="with_detail.do?with_no=${with.with_no}&page=${page}&state=detail">${with.with_title}</a>
                        </h5>
                        <p class="card-text">모집인원 ${with.with_maxto}</p>
                        <p class="card-text">나이 ${with.with_age} / ${with.with_gender}</p>
                        <p class="card-text">날짜 ${with.with_start} ~ ${with.with_end}</p>
                    </div>
                </div>
            </c:forEach>
        </div>

        <form class="form-inline my-2 my-md-0 justify-content-center">
            <select class="custom-select" name="search">
                <option value="with_title">제목</option>
                <option value="with_content">내용</option>
                <option value="with_nick">작성자</option>
                <option value="with_category">지역</option>
                <option value="with_tag">태그</option>
            </select>
            <input name="keyword" id="keyword" class="form-control" type="text" placeholder="검색어를 입력하세요." aria-label="Search">
            <button class="btn btn-outline-primary" type="submit">검색</button>
        </form>

        <div class="page d-flex justify-content-center my-2">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${listcount > 0 && search == null && keyword == null}">
                        <c:if test="${startpage > 10}">
                            <li class="page-item">
                                <a class="page-link" href="with_list.do?page=${startpage-10}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach var="a" begin="${startpage}" end="${endpage}">
                            <li class="page-item">
                                <a class="page-link" href="with_list.do?page=${a}">${a}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${endpage < maxpage}">
                            <li class="page-item">
                                <a class="page-link" href="with_list.do?page=${startpage+10}" aria-label="Previous">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </c:if>

                    <c:if test="${search != null && keyword != null}">
                        <c:if test="${startpage > 10}">
                            <li class="page-item">
                                <a class="page-link" href="with_list.do?page=${startpage-10}&search=${search}&keyword=${keyword}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach var="a" begin="${startpage}" end="${endpage}">
                            <li class="page-item">
                                <a class="page-link" href="with_list.do?page=${a}&search=${search}&keyword=${keyword}">${a}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${endpage < maxpage}">
                            <li class="page-item">
                                <a class="page-link" href="with_list.do?page=${startpage+10}&search=${search}&keyword=${keyword}" aria-label="Previous">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </c:if>
                </ul>
            </nav>
        </div>

        <div class="d-flex justify-content-end">
            <button class="btn btn-outline-primary" onClick="location.href='withWrite.do'">글쓰기</button>
        </div>
    </div>
    <c:import url="../footer.jsp" />
</body>
</html>