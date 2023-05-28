	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<c:import url="./header.jsp"/>
    <meta charset="UTF-8">
    <title>서울시 행사</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
    *{
        font-family: 'Title_Medium';
    }
    
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
	
</style>
    
</head>
<body>

  <br><h1 style="font-size:40px; position:static; margin:10px;" class="text">서울시 행사 리스트</h1><br>
        <label style="position:static; margin:10px;" for="searchInput"><b>행사명 검색</b></label>
        <input id="searchInput" type="text" placeholder="Search..."><br>
        
<button id="whole" type="button" class="btn btn-outline-primary">전체 행사</button>
<button id="past" type="button" class="btn btn-outline-secondary">지난 행사</button>
<button id="current" type="button" class="btn btn-outline-primary">진행 행사</button>
<button id="future" type="button" class="btn btn-outline-secondary">예정 행사</button>

	<div class="container-fluid">
		<div class="menu">
			<div id="searchContainer">
			</div>
				<div class="card-container"></div>
				<div class="d-flex justify-content-center">
         			<nav aria-label="Page navigation example">
            		<ul class="pagination"></ul>
					</nav>
			</div>
		</div>
	</div>

  <script>
    $(document).ready(function() {
    	$("#whole").click(function(){
    	    $(".card").show();
    	});

    	$("#past").click(function(){
    	    $(".card:not(.past)").hide();
    	    $(".past").show();
    	});

    	$("#current").click(function(){
    	    $(".card:not(.current)").hide();
    	    $(".current").show();
    	});

    	$("#future").click(function(){
    	    $(".card:not(.future)").hide();
    	    $(".future").show();
    	});
    	
      $.ajax({
    	/* URL에 API에서 가져온 주소값 입력 */  
        url: "https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=200&pageNo=1&MobileOS=ETC&MobileApp=GoSeoul&_type=json&listYN=Y&arrange=A&eventStartDate=20230501&areaCode=1&serviceKey=9u1LYAg7hOW1YTn138et7L7Q8Qcks2RZvreM6YC011a5iHJrju%2BbgL%2FSP8uU1FE0d3k0K3fqzUuvSEWUu8xndg%3D%3D",
        dataType: "json",
        success: function(result) {
        	let events = result.response.body.items.item;
        	events.sort(function(a, b) {
        	  return b.eventstartdate.localeCompare(a.eventstartdate);
        	});
          let cardContainer = $(".card-container");
          let cardRow;
          for (let i = 0; i < events.length; i++) {
            let event = events[i];
            console.log(event.contentid);
            let card = $("<div>").addClass("card");
            let title = $("<h2>").text(event.title);
            let place = $("<p>").text(event.addr1);
/* 
            let startDate = event.eventstartdate.replace(/(\d{4})(\d{2})(\d{2})/g, '$1.$2.$3');
            let endDate = event.eventenddate.replace(/(\d{4})(\d{2})(\d{2})/g, '$1.$2.$3');
            let date = $("<p>").text(startDate.toLocaleDateString("ko-KR") +   " ~ " + endDate.toLocaleDateString("ko-KR"));
 */ 
            let startDate = new Date(event.eventstartdate.slice(0, 4), event.eventstartdate.slice(4, 6) - 1, event.eventstartdate.slice(6, 8));
            let endDate = new Date(event.eventenddate.slice(0, 4), event.eventenddate.slice(4, 6) - 1, event.eventenddate.slice(6, 8));
            let date = $("<p>").text(startDate.toLocaleDateString("ko-KR") +   " ~ " + endDate.toLocaleDateString("ko-KR"));
            
            let today = new Date();
            if (endDate < today) {
              card.addClass("past");
            } else if (startDate <= today && today <= endDate) {
              card.addClass("current");
            } else {
              card.addClass("future");
            }

            let backgroundImage = "url(" + event.firstimage + ")";
            card.append(title).append(place).append(date);
            card.css("background-image", backgroundImage);
            cardRow = $("<div>").addClass("card-row");
            cardContainer.append(cardRow);
            cardRow.append(card);
            card.click(function() {
            	  window.location.href = "eventDetail.do?contentId=" + event.contentid;
            	});
			
          }
     	  }
      });
      $("#searchInput").on("keyup", function() {
        let value = $(this).val().toLowerCase();
        $(".card").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
      });

/* 
  	 function sortCards() {
   	  // .card-wrapper 클래스를 가진 요소를 찾아서
   	  // 각각의 .card 요소를 날짜순으로 정렬합니다.
   	  $('.card-wrapper').each(function() {
   	    $(this).children('.card').sort(function(a, b) {
   	      return new Date($(a).data('date')) - new Date($(b).data('date'));
   	    }).appendTo(this);
   	  });
   	}

   	// sortCards 함수를 호출하여 카드를 정렬합니다.
   	sortCards();
     */  
      
    });
   

  </script>
<c:import url="./footer.jsp"/>
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>