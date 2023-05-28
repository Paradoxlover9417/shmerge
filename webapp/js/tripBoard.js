

let total = 0;	//	전체 페이지 갯수

function all1() {	// 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	var total = 0;
	
	selectedSigunguCode = 26;
	img();
	
	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
	var contentTypeId = contentTypeIdList[i];
	var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";
		
		$.ajax({
			url: url,
			type: "GET",
			async: false,
			data: {},
			success: function(result) {
				total = result.response.body.totalCount;
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];
				
				console.log(total);
				
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
			    
				total = $(".card:visible").length;
			    console.log("Total:", total);
				
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var total = $(".card:visible").length;
				        console.log("Total:", total);
					});
			}
		});	
	}
}

function gangnam() {	//	강남구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	var total = 0;
	
	selectedSigunguCode = 1;
	img();

	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
		var contentTypeId = contentTypeIdList[i];
		var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";
		
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
				
				total = $(".card:visible").length;
			    console.log("Total:", total);
				
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var total = $(".card:visible").length;
				        console.log("Total:", total);
				});
			}
		});	
	}
}

function gangseo() {	//	강서구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	
	selectedSigunguCode = 4;
	img();	 
	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
		var contentTypeId = contentTypeIdList[i];
		var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=4&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";
		
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

				total = $(".card:visible").length;
			    console.log("Total:", total);
				
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  total = $(".card:visible").length;
					  console.log("Total:", total);
				});
			}
		});	
	}
}

function mapo() {	//	마포구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
    var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
    var total = 0;
    
    selectedSigunguCode = 13;
    img();
    
    // 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
    for (var i = 0; i < contentTypeIdList.length; i++) {
        var contentTypeId = contentTypeIdList[i];
        var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=13&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";
        
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
                
                total = $(".card:visible").length;
			    console.log("Total:", total);
				
                $("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var total = $(".card:visible").length;
				        console.log("Total:", total);
				});
			}
		});	
	}
}


function jongro() {	//	종로구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	var total = 0;
	
	 selectedSigunguCode = 23;
	 img();
	 
	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
		var contentTypeId = contentTypeIdList[i];
		var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=23&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";
		
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
				
				total = $(".card:visible").length;
			    console.log("Total:", total);
				
				
				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  total = $(".card:visible").length;
				        console.log("Total:", total);
				});
			}
		});	
	}
	}
