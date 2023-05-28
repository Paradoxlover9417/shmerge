<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <script src="./js/tripDetail.js"></script>
    <script src="./js/tripBoard2.js"></script>

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
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="menu">
		<div id="trip_button">
			<button type="button" class="btn btn-outline-primary" onClick="location.href='tripBoard_form.do'">지역별 게시판</button>
			<button type="button" class="btn btn-outline-primary" onClick="location.href='tripBoard3_form.do'">여행코스 게시판</button>
			<button type="button" class="btn btn-outline-primary" onClick="all2()"> 종류별 전체  </button>
			<button type="button" class="btn btn-outline-primary" onClick="culture()"> 문화시설 </button>
			<button type="button" class="btn btn-outline-primary" onClick="leisure()"> 레포츠 </button>
			<button type="button" class="btn btn-outline-primary" onClick="hotel()"> 숙박시설 </button>
			<button type="button" class="btn btn-outline-primary" onClick="shopping()"> 쇼핑 </button>
			<button type="button" class="btn btn-outline-primary" onClick="restaurant()"> 음식점 </button>
		</div>
		
		<!-- 검색창 HTML 코드 예시 -->
		<div class="search-container">
			<label for="searchInput">여행지명 검색</label>
  			<input id="searchInput" type="text" placeholder="여행지 검색...">
  			<button type="submit" id="searchButton">검색</button>
		</div>

		</div>
		<div class="card-container">
		</div>
		<br>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
			  <ul class="pagination"></ul>
			</nav>
		</div>
	</div>
</body>
</html>
