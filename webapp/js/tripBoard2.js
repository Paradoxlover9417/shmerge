$(document).ready(function() {	//	서울 전체는 부제목 x 나머지는 부제목 o
/*	  $("#all1").on("click", function() {
	    $("#trip_check").hide();
	  });

	  $("#gangnam, #gangseo, #mapo").on("click", function() {
	    $("#trip_check").show();
	  });
	  */
	  $("#searchButton").on("click", function() {
		  var value = $("#searchInput").val().toLowerCase();
		  
		  $(".card").filter(function() {
		    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
		  });
		  var total = $(".card:visible").length;
	        console.log("Total:", total);
	  });
	  
	  $(function() { // 보이기 | 숨기기
			$(window).scroll(function() {
		   	 if ($(this).scrollTop() > 200) { //250 넘으면 버튼이 보여짐니다. 
		    	  $('#topBtn').fadeIn();
		    	} else {
		    	  $('#topBtn').fadeOut();
		    	}
		  	}); // 버튼 클릭시 
		 	$("#topBtn").click(function() { 
		  	$('html, body').animate({ scrollTop : 0 // 0 까지 animation 이동합니다. 
		  		}, 400); // 속도 400 
		  		return false; 
		  	}); 
		});
	});
function all2() {	//	종류별 전체 ( 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
    var contentTypeIdList = [14, 25, 28, 32, 38, 39];
    
    // 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
    for (var i = 0; i < contentTypeIdList.length; i++) {
        var contentTypeId1 = contentTypeIdList[i];
        var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId="+contentTypeId1+"&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";
        
        $.ajax({
            url: url,
            type: "GET",
            async: false,
            data: {},
            success: function(result) {
                var trip = result.response.body.items.item;
                var trip_addr1 = [];
                var trip_title = [];
                var backgroundImage = [];
                var contentid = [];

                for (var i = 0; i < trip.length; i++) {
                    trip_addr1.push(trip[i]["addr1"]);
                    trip_title.push(trip[i]["title"]);
                    backgroundImage.push(trip[i]["firstimage"]);
                    contentid.push(trip[i]["contentid"]);

                    var card = $("<div>").addClass("card");        
                    var title = $("<h2>").text(trip_title[i]);
                    var place = $("<p>").text(trip_addr1[i]);
                    card.append(title).append(place);
                    
                    // backgroundImage[i]가 " "인 경우에 대한 처리
                    if (backgroundImage[i] !== "") {
                    	card.css("background-image", "url(" + backgroundImage[i] + ")");
                    } else {
                        card.css("background-image", "url(images/cat.jpg)");
                    }

                    $(".card-container").append(card);

                    (function(contentId) {	//	전체 여행지에서만 수정된 코드
                        card.click(function() {
                          window.location.href = "tripDetail_form.do?contentId=" + contentId;
                        });
                      })(contentid[i]);
                }

                $("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var totalVisible = $(".card:visible").length;
				        console.log("Total:", totalVisible);
					});
            }
        });
    }
}
all2();

function travel(){
	$.ajax({	//	데이터 가져오기
		url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=339&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=12&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
		type:"GET",
		data: {},
		success: function(result) {
			$(".card-container").empty();
			var trip = result.response.body.items.item;
			var trip_addr1 = [];
			var trip_title = [];
			var backgroundImage = [];
			var contentid = [];
			
			for(let i = 0; i < trip.length; i++){ // trip.length = total 
				trip_addr1.push(trip[i]["addr1"]);
				trip_title.push(trip[i]["title"]);
				backgroundImage.push(trip[i]["firstimage"]);
				contentid.push(trip[i]["contentid"]);
				
				let card = $("<div>").addClass("card");		
				let title = $("<h2>").text(trip_title[i]);
				let place = $("<p>").text(trip_addr1[i]);
				
				if (backgroundImage[i] !== "") {	//	api상 사진이 제공되지 않는 경우 
					card.css("background-image", "url(" + backgroundImage[i] + ")");
				}else{
					card.css("background-image", "url(images/cat.jpg)");	
				}
				
				card.append(title).append(place);
				$(".card-container").append(card);
				
				card.click(function(){
					window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
				});
			}
			$("#searchButton").on("click", function() {
				  var value = $("#searchInput").val().toLowerCase();
				  
				  $(".card").filter(function() {
				    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				  });
				  var totalVisible = $(".card:visible").length;
			        console.log("Total:", totalVisible);
				});
         }
     });
}
	
	function culture(){
		$.ajax({	//	데이터 가져오기
			url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=339&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=14&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
			type:"GET",
			data: {},
			success: function(result) {
				console.log("result:"+result);
				
				$(".card-container").empty();
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];
				
				for(let i = 0; i < trip.length; i++){ // trip.length = total 
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);
					
					let card = $("<div>").addClass("card");		
					let title = $("<h2>").text(trip_title[i]);
					let place = $("<p>").text(trip_addr1[i]);
					
					if (backgroundImage[i] !== "") {	//	api상 사진이 제공되지 않는 경우 
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					}else{
						card.css("background-image", "url(images/cat.jpg)");	
					}
					
					card.append(title).append(place);
					$(".card-container").append(card);
					
					card.click(function(){
						window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
					});
				}
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var totalVisible = $(".card:visible").length;
				        console.log("Total:", totalVisible);
					});
	         }
	     });
	}
	
	function leisure(){
		$.ajax({	//	데이터 가져오기
			url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=339&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=28&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
			type:"GET",
			data: {},
			success: function(result) {
				$(".card-container").empty();
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];
				
				for(let i = 0; i < trip.length; i++){ // trip.length = total 
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);
					
					let card = $("<div>").addClass("card");		
					let title = $("<h2>").text(trip_title[i]);
					let place = $("<p>").text(trip_addr1[i]);
					
					if (backgroundImage[i] !== "") {	//	api상 사진이 제공되지 않는 경우 
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					}else{
						card.css("background-image", "url(images/cat.jpg)");	
					}
					
					card.append(title).append(place);
					$(".card-container").append(card);
					
					card.click(function(){
						window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
					});
				}
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var totalVisible = $(".card:visible").length;
				        console.log("Total:", totalVisible);
					});
			}
		});
	}

	function hotel(){
		$.ajax({	//	데이터 가져오기
			url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=339&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=32&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
			type:"GET",
			data: {},
			success: function(result) {
				$(".card-container").empty();
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];
				
				for(let i = 0; i < trip.length; i++){ // trip.length = total 
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);
					
					let card = $("<div>").addClass("card");		
					let title = $("<h2>").text(trip_title[i]);
					let place = $("<p>").text(trip_addr1[i]);
					
					if (backgroundImage[i] !== "") {	//	api상 사진이 제공되지 않는 경우 
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					}else{
						card.css("background-image", "url(images/cat.jpg)");	
					}
					
					card.append(title).append(place);
					$(".card-container").append(card);
					
					card.click(function(){
						window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
					});
				}
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var totalVisible = $(".card:visible").length;
				        console.log("Total:", totalVisible);
					});
	         }
	     });
	}
	
	function shopping(){
		$.ajax({	//	데이터 가져오기
			url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=339&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=38&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
			type:"GET",
			data: {},
			success: function(result) {
				$(".card-container").empty();
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];
				
				for(let i = 0; i < trip.length; i++){ // trip.length = total 
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);
					
					let card = $("<div>").addClass("card");		
					let title = $("<h2>").text(trip_title[i]);
					let place = $("<p>").text(trip_addr1[i]);
					
					if (backgroundImage[i] !== "") {	//	api상 사진이 제공되지 않는 경우 
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					}else{
						card.css("background-image", "url(images/cat.jpg)");	
					}
					
					card.append(title).append(place);
					$(".card-container").append(card);
					
					card.click(function(){
						window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
					});
				}
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var totalVisible = $(".card:visible").length;
				        console.log("Total:", totalVisible);
					});
			}
		});
	}

	function restaurant(){
		$.ajax({	//	데이터 가져오기
			url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=39&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
			type:"GET",
			data: {},
			success: function(result) {
				$(".card-container").empty();
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];
				
				for(let i = 0; i < trip.length; i++){ // trip.length = total 
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);
					
					let card = $("<div>").addClass("card");		
					let title = $("<h2>").text(trip_title[i]);
					let place = $("<p>").text(trip_addr1[i]);
					
					if (backgroundImage[i] !== "") {	//	api상 사진이 제공되지 않는 경우 
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					}else{
						card.css("background-image", "url(images/cat.jpg)");	
					}
					
					card.append(title).append(place);
					$(".card-container").append(card);
					
					card.click(function(){
						window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
					});
				}
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var totalVisible = $(".card:visible").length;
				        console.log("Total:", totalVisible);
					});
	          }
	      });
	}