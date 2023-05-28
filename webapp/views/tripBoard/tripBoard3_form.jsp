<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seoul trip</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
     integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
     integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
    <script src="./js/tripBoard.js"></script>
<script src="./js/tripBoard1_1.js"></script>
<script src="./js/tripBoard2.js"></script>
    <script src="./js/tripBoard3.js"></script>
    <script src="./js/tripDetail.js"></script>

<style>

  .container {
		display: flex;
		flex-wrap: wrap;
		justify-content: left;
		align-items: left;
		height: 100vh;
	}
	
	.menu {
		display: flex;
		flex-direction: column;
		align-items: left;
		text-shadow: gray 0.1em 0.1em 0.1em;
		width: 100%;
		max-width: 1400px;
		margin: 0 auto;
	}
	
	.card-container {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		gap: 20px;
		margin-top: 50px;
		row-gap: 20px;
	}
	
	.card {
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
		width: 100%;
		height: 400px;
		border-radius: 8px;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
		overflow: hidden;
		background-size: cover;
		position: relative;
	}
	
	.card h2, .card p {
		padding: 5px;
		margin: 0;
		color: white;
		background-color: rgba(0, 0, 0, 0.3);
		font-size: 14px;
	}
	.page-link {
			cursor: pointer;
	}
	.active .page-link {
		background-color: #007bff;
		border-color: #007bff;
	}
	
	/* top 버튼 */
	a#topBtn { 
		position: fixed; /* 포지션 고정 */ 
		right: 2%; /* 오른쪽에서 2% - %도 할수 있음*/ 
		bottom: 5px; /* 밑에서 5px */ 
		display: none; /* 보여지지 없음 - 기본적으로 안보여지게 */ 
		z-index: 9999; /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */ 
	}
	.container-fluid {
		width: 1400px !important;
	}
	</style>
</head>
<body onLoad="all3()">
	<c:import url="../header.jsp"/>
	<div class="container-fluid">
		<div class="menu">
	<!-- 	<div id="trip_button">
			<button type="button" class="btn btn-outline-primary" onClick="location.href='tripBoard_form.do'">지역별 게시판</button>
			<button type="button" class="btn btn-outline-primary" onClick="location.href='tripBoard2_form.do'">종류별 게시판</button>
			<button type="button" class="btn btn-outline-primary" onClick="all3()"> 전체 여행코스 </button>
		</div> -->
	
		
		<!-- 검색창 HTML 코드 예시 -->
		<div class="search-container">
			<label for="searchInput">여행지명 검색</label>
  			<input id="searchInput" type="text" placeholder="여행지 검색...">
  			<button type="submit" id="searchButton">검색</button>
		</div>

		</div>
		<div class="card-container">
		</div>
		<a id="topBtn" href="#"><img id="topimg" src="images/arrow.png" style="max-width: 50px; max-height: 50px;"></a>
		<br>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
			  <ul class="pagination"></ul>
			  
			</nav>
		</div>
	</div>
	<c:import url="../footer.jsp"/>
</body>
</html>
