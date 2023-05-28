function getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
       temp = params[i].split("=");
       if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
 }
 // 파라미터 값 확인을 위한 실행
 getParam();

 // contId에 파라미터에서 던진 컨텐츠 아이디 저장, 예) 2828431
 var contentId = temp[1];
 
$(document).ready(function() {	
	
	contentId = getParam("contentId");
	
    $.ajax({	//	1. 관광지 상세페이지
        url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=GoSeoul&_type=json&contentId="+contentId+"&contentTypeId=12&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=711&pageNo=1&serviceKey=9u1LYAg7hOW1YTn138et7L7Q8Qcks2RZvreM6YC011a5iHJrju%2BbgL%2FSP8uU1FE0d3k0K3fqzUuvSEWUu8xndg%3D%3D",
        method : "GET",
        async:false,
        success: function(data) {
            var detail = data.response.body.items.item;
            var mapx = [];
            var mapy = [];
            var detail_title = [];
            var detail_addr = [];
            var detail_addr2 = [];
            var detail_thumb = [];
            var detail_overview = [];
            var detail_homepage = [];
            var detail_telname = [];
            var detail_tel = [];
            var contentId = [];

            for (let i = 0; i < detail.length; i++) {
	            detail_title.push(detail[i]["title"]);
	            detail_addr.push(detail[i]["addr1"]);
	            detail_addr2.push(detail[i]["addr2"]);
	            detail_thumb.push(detail[i]["firstimage"]);
	            detail_overview.push(detail[i]["overview"]);
	            detail_homepage.push(detail[i]["homepage"]);
	            detail_telname.push(detail[i]["telname"]);
	            detail_tel.push(detail[i]["tel"]);
	            contentId.push(detail[i]["contentId"]);
	            
	            mapy.push(detail[i]["mapy"]);
                mapx.push(detail[i]["mapx"]);

                $("#title").text(detail_title);
                $("<img>").attr("src", detail_thumb).appendTo("#thumb");
                $("#overview").html(detail_overview);
                
                var text = detail_homepage[i];
                var urlPattern = /https?:\/\/[^\s"'<>]+/g;
                var urls = "";
                if(text.match(urlPattern) !== null) {
                	urls = text.match(urlPattern)[0];
                	$("#website").html("<b>웹사이트: &nbsp</b> <a href='" + urls + "'>바로가기</a>");                	
                }else{
                	$("#website").html("<b>웹사이트: &nbsp</b> 제공되지 않습니다.");
                }
                console.log(urls);
                
                var tel = detail_tel[i];
                var teln = detail_telname[i]
                
                if(tel !== "" || teln !== ""){
                	$("#contact").html("<b>문의처: &nbsp </b>" + tel + " " + teln );
                }else if(tel == "" || teln == ""){
                	$("#contact").html("<b>문의처: &nbsp</b>제공되지 않습니다.");
                }

                //<a href=\"https://gahoe.or.kr\" target=\"_blank\" title=\"새창 : 가회동성당 사이트로 이동\">https://gahoe.or.kr</a>",
                // $("#contact").html("<b>문의처:  </b><br>" + detail_telname + " " + detail_tel);
                var addr = detail_addr[i];
                var addr2 = detail_addr2[i];
                if(addr !== "" || addr2 !== ""){
                	$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());               	
                }else if(addr == "" || addr2 == ""){
                	$("#address").html("<b>주소: &nbsp</b>제공되지 않습니다.");               	    	
                }
            }
        

        console.log(mapx);
        console.log(mapy);
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(mapy[0], mapx[0]),
            level: 3
        };

        var map = new kakao.maps.Map(container, options);
        map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
        var markerPosition  = new kakao.maps.LatLng(mapy[0], mapx[0]);

        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        }
    });
    
    	$.ajax({	//	2. 숙소 상세페이지
    		url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=GoSeoul&_type=json&contentId="+contentId+"&contentTypeId=32&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=339&pageNo=1&serviceKey=9u1LYAg7hOW1YTn138et7L7Q8Qcks2RZvreM6YC011a5iHJrju%2BbgL%2FSP8uU1FE0d3k0K3fqzUuvSEWUu8xndg%3D%3D",
    		method : "GET",
    		async:false,
    		success: function(data) {
    			var detail = data.response.body.items.item;
    			var mapx = [];
    			var mapy = [];
    			var detail_title = [];
    			var detail_addr = [];
    			var detail_addr2 = [];
    			var detail_thumb = [];
    			var detail_overview = [];
    			var detail_homepage = [];
    			var detail_telname = [];
    			var detail_tel = [];
    			var contentId = [];
    			
    			for (let i = 0; i < detail.length; i++) {
    				detail_title.push(detail[i]["title"]);
    				detail_addr.push(detail[i]["addr1"]);
    				detail_addr2.push(detail[i]["addr2"]);
    				detail_thumb.push(detail[i]["firstimage"]);
    				detail_overview.push(detail[i]["overview"]);
    				detail_homepage.push(detail[i]["homepage"]);
    				detail_telname.push(detail[i]["telname"]);
    				detail_tel.push(detail[i]["tel"]);
    				contentId.push(detail[i]["contentId"]);
    				
    				mapy.push(detail[i]["mapy"]);
    				mapx.push(detail[i]["mapx"]);
    				
    				$("#title").text(detail_title);
    				$("<img>").attr("src", detail_thumb).appendTo("#thumb");
    				$("#overview").html(detail_overview);
    				
    				var text = detail_homepage[i];
    				var urlPattern = /https?:\/\/[^\s"'<>]+/g;
    				var urls = "";
    				if(text.match(urlPattern) !== null) {
    					urls = text.match(urlPattern)[0];
    					$("#website").html("<b>웹사이트: &nbsp</b> <a href='" + urls + "'>바로가기</a>");                	
    				}else{
    					$("#website").html("<b>웹사이트: &nbsp</b> 제공되지 않습니다.");
    				}
    				console.log(urls);
    				
    				var tel = detail_tel[i];
    				var teln = detail_telname[i]
    				
    				if(tel !== "" || teln !== ""){
    					$("#contact").html("<b>문의처: &nbsp </b>" + tel + " " + teln );
    				}else if(tel == "" || teln == ""){
    					$("#contact").html("<b>문의처: &nbsp</b>제공되지 않습니다.");
    				}
    				
    				//<a href=\"https://gahoe.or.kr\" target=\"_blank\" title=\"새창 : 가회동성당 사이트로 이동\">https://gahoe.or.kr</a>",
    				// $("#contact").html("<b>문의처:  </b><br>" + detail_telname + " " + detail_tel);
    				/*$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());*/
    				 var addr = detail_addr[i];
    	             var addr2 = detail_addr2[i];
    	                if(addr !== "" || addr2 !== ""){
    	                	$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());               	
    	                }else if(addr == "" || addr2 == ""){
    	                	$("#address").html("<b>주소: &nbsp</b>제공되지 않습니다.");               	    	
    	                }
    			}
    			
    			
    			console.log(mapx);
    			console.log(mapy);
    			var container = document.getElementById('map');
    			var options = {
    					center: new kakao.maps.LatLng(mapy[0], mapx[0]),
    					level: 3
    			};
    			
    			var map = new kakao.maps.Map(container, options);
    			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
    			var markerPosition  = new kakao.maps.LatLng(mapy[0], mapx[0]);
    			
    			var marker = new kakao.maps.Marker({
    				position: markerPosition
    			});
    			
    			// 마커가 지도 위에 표시되도록 설정합니다
    			marker.setMap(map);
    		}
    	});
    	$.ajax({	//	3. 식당 상세페이지
    		url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=goSeoul&_type=json&contentId="+contentId+"&contentTypeId=39&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=2676&pageNo=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
    		method : "GET",
    		async:false,
    		success: function(data) {
    			var detail = data.response.body.items.item;
    			var mapx = [];
    			var mapy = [];
    			var detail_title = [];
    			var detail_addr = [];
    			var detail_addr2 = [];
    			var detail_thumb = [];
    			var detail_overview = [];
    			var detail_homepage = [];
    			var detail_telname = [];
    			var detail_tel = [];
    			var contentId = [];
    			
    			for (let i = 0; i < detail.length; i++) {
    				detail_title.push(detail[i]["title"]);
    				detail_addr.push(detail[i]["addr1"]);
    				detail_addr2.push(detail[i]["addr2"]);
    				detail_thumb.push(detail[i]["firstimage"]);
    				detail_overview.push(detail[i]["overview"]);
    				detail_homepage.push(detail[i]["homepage"]);
    				detail_telname.push(detail[i]["telname"]);
    				detail_tel.push(detail[i]["tel"]);
    				contentId.push(detail[i]["contentId"]);
    				
    				mapy.push(detail[i]["mapy"]);
    				mapx.push(detail[i]["mapx"]);
    				
    				$("#title").text(detail_title);
    				$("<img>").attr("src", detail_thumb).appendTo("#thumb");
    				$("#overview").html(detail_overview);
    				
    				var text = detail_homepage[i];
    				var urlPattern = /https?:\/\/[^\s"'<>]+/g;
    				var urls = "";
    				if(text.match(urlPattern) !== null) {
    					urls = text.match(urlPattern)[0];
    					$("#website").html("<b>웹사이트: &nbsp</b> <a href='" + urls + "'>바로가기</a>");                	
    				}else{
    					$("#website").html("<b>웹사이트: &nbsp</b> 제공되지 않습니다.");
    				}
    				console.log(urls);
    				
    				var tel = detail_tel[i];
    				var teln = detail_telname[i]
    				
    				if(tel !== "" || teln !== ""){
    					$("#contact").html("<b>문의처: &nbsp </b>" + tel + " " + teln );
    				}else if(tel == "" || teln == ""){
    					$("#contact").html("<b>문의처: &nbsp</b>제공되지 않습니다.");
    				}
    				
    				//<a href=\"https://gahoe.or.kr\" target=\"_blank\" title=\"새창 : 가회동성당 사이트로 이동\">https://gahoe.or.kr</a>",
    				// $("#contact").html("<b>문의처:  </b><br>" + detail_telname + " " + detail_tel);
    				// $("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());
    				var addr = detail_addr[i];
    				var addr2 = detail_addr2[i];
   	                if(addr !== "" || addr2 !== ""){
   	                	$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());               	
   	                }else if(addr == "" || addr2 == ""){
   	                	$("#address").html("<b>주소: &nbsp</b>제공되지 않습니다.");               	    	
   	                }
    			}
    			
    			
    			console.log(mapx);
    			console.log(mapy);
    			var container = document.getElementById('map');
    			var options = {
    					center: new kakao.maps.LatLng(mapy[0], mapx[0]),
    					level: 3
    			};
    			
    			var map = new kakao.maps.Map(container, options);
    			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
    			var markerPosition  = new kakao.maps.LatLng(mapy[0], mapx[0]);
    			
    			var marker = new kakao.maps.Marker({
    				position: markerPosition
    			});
    			
    			// 마커가 지도 위에 표시되도록 설정합니다
    			marker.setMap(map);
    		}
    	});
    	$.ajax({	//	4. 쇼핑 상세페이지
    		url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=goSeoul&_type=json&contentId="+contentId+"&contentTypeId=38&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=3166&pageNo=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
    		method : "GET",
    		async:false,
    		success: function(data) {
    			var detail = data.response.body.items.item;
    			var mapx = [];
    			var mapy = [];
    			var detail_title = [];
    			var detail_addr = [];
    			var detail_addr2 = [];
    			var detail_thumb = [];
    			var detail_overview = [];
    			var detail_homepage = [];
    			var detail_telname = [];
    			var detail_tel = [];
    			var contentId = [];
    			
    			for (let i = 0; i < detail.length; i++) {
    				detail_title.push(detail[i]["title"]);
    				detail_addr.push(detail[i]["addr1"]);
    				detail_addr2.push(detail[i]["addr2"]);
    				detail_thumb.push(detail[i]["firstimage"]);
    				detail_overview.push(detail[i]["overview"]);
    				detail_homepage.push(detail[i]["homepage"]);
    				detail_telname.push(detail[i]["telname"]);
    				detail_tel.push(detail[i]["tel"]);
    				contentId.push(detail[i]["contentId"]);
    				
    				mapy.push(detail[i]["mapy"]);
    				mapx.push(detail[i]["mapx"]);
    				
    				$("#title").text(detail_title);
    				$("<img>").attr("src", detail_thumb).appendTo("#thumb");
    				$("#overview").html(detail_overview);
    				
    				var text = detail_homepage[i];
    				var urlPattern = /https?:\/\/[^\s"'<>]+/g;
    				var urls = "";
    				if(text.match(urlPattern) !== null) {
    					urls = text.match(urlPattern)[0];
    					$("#website").html("<b>웹사이트: &nbsp</b> <a href='" + urls + "'>바로가기</a>");                	
    				}else{
    					$("#website").html("<b>웹사이트: &nbsp</b> 제공되지 않습니다.");
    				}
    				console.log(urls);
    				
    				var tel = detail_tel[i];
    				var teln = detail_telname[i]
    				
    				if(tel !== "" || teln !== ""){
    					$("#contact").html("<b>문의처: &nbsp </b>" + tel + " " + teln );
    				}else if(tel == "" || teln == ""){
    					$("#contact").html("<b>문의처: &nbsp</b>제공되지 않습니다.");
    				}
    				
    				//<a href=\"https://gahoe.or.kr\" target=\"_blank\" title=\"새창 : 가회동성당 사이트로 이동\">https://gahoe.or.kr</a>",
    				// $("#contact").html("<b>문의처:  </b><br>" + detail_telname + " " + detail_tel);
    				// $("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());
    				var addr = detail_addr[i];
    				var addr2 = detail_addr2[i];
   	                if(addr !== "" || addr2 !== ""){
   	                	$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());               	
   	                }else if(addr == "" || addr2 == ""){
   	                	$("#address").html("<b>주소: &nbsp</b>제공되지 않습니다.");               	    	
   	                }
    			}
    			
    			console.log(mapx);
    			console.log(mapy);
    			var container = document.getElementById('map');
    			var options = {
    					center: new kakao.maps.LatLng(mapy[0], mapx[0]),
    					level: 3
    			};
    			
    			var map = new kakao.maps.Map(container, options);
    			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
    			var markerPosition  = new kakao.maps.LatLng(mapy[0], mapx[0]);
    			
    			var marker = new kakao.maps.Marker({
    				position: markerPosition
    			});
    			
    			// 마커가 지도 위에 표시되도록 설정합니다
    			marker.setMap(map);
    		}
    	});
    	$.ajax({	//	5. 문화시설 상세페이지
    		url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=goSeoul&_type=json&contentId="+contentId+"&contentTypeId=14&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=500&pageNo=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
    		method : "GET",
    		async:false,
    		success: function(data) {
    			var detail = data.response.body.items.item;
    			var mapx = [];
    			var mapy = [];
    			var detail_title = [];
    			var detail_addr = [];
    			var detail_addr2 = [];
    			var detail_thumb = [];
    			var detail_overview = [];
    			var detail_homepage = [];
    			var detail_telname = [];
    			var detail_tel = [];
    			var contentId = [];
    			
    			for (let i = 0; i < detail.length; i++) {
    				detail_title.push(detail[i]["title"]);
    				detail_addr.push(detail[i]["addr1"]);
    				detail_addr2.push(detail[i]["addr2"]);
    				detail_thumb.push(detail[i]["firstimage"]);
    				detail_overview.push(detail[i]["overview"]);
    				detail_homepage.push(detail[i]["homepage"]);
    				detail_telname.push(detail[i]["telname"]);
    				detail_tel.push(detail[i]["tel"]);
    				contentId.push(detail[i]["contentId"]);
    				
    				mapy.push(detail[i]["mapy"]);
    				mapx.push(detail[i]["mapx"]);
    				
    				$("#title").text(detail_title);
    				$("<img>").attr("src", detail_thumb).appendTo("#thumb");
    				$("#overview").html(detail_overview);
    				
    				var text = detail_homepage[i];
    				var urlPattern = /https?:\/\/[^\s"'<>]+/g;
    				var urls = "";
    				if(text.match(urlPattern) !== null) {
    					urls = text.match(urlPattern)[0];
    					$("#website").html("<b>웹사이트: &nbsp</b> <a href='" + urls + "'>바로가기</a>");                	
    				}else{
    					$("#website").html("<b>웹사이트: &nbsp</b> 제공되지 않습니다.");
    				}
    				console.log(urls);
    				
    				var tel = detail_tel[i];
    				var teln = detail_telname[i]
    				
    				if(tel !== "" || teln !== ""){
    					$("#contact").html("<b>문의처: &nbsp </b>" + tel + " " + teln );
    				}else if(tel == "" || teln == ""){
    					$("#contact").html("<b>문의처: &nbsp</b>제공되지 않습니다.");
    				}
    				
    				//<a href=\"https://gahoe.or.kr\" target=\"_blank\" title=\"새창 : 가회동성당 사이트로 이동\">https://gahoe.or.kr</a>",
    				// $("#contact").html("<b>문의처:  </b><br>" + detail_telname + " " + detail_tel);
    				// $("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());
    				var addr = detail_addr[i];
   	             	var addr2 = detail_addr2[i];
   	                if(addr !== "" || addr2 !== ""){
   	                	$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());               	
   	                }else if(addr == "" || addr2 == ""){
   	                	$("#address").html("<b>주소: &nbsp</b>제공되지 않습니다.");               	    	
   	                }
    			}
    			
    			
    			console.log(mapx);
    			console.log(mapy);
    			var container = document.getElementById('map');
    			var options = {
    					center: new kakao.maps.LatLng(mapy[0], mapx[0]),
    					level: 3
    			};
    			
    			var map = new kakao.maps.Map(container, options);
    			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
    			var markerPosition  = new kakao.maps.LatLng(mapy[0], mapx[0]);
    			
    			var marker = new kakao.maps.Marker({
    				position: markerPosition
    			});
    			
    			// 마커가 지도 위에 표시되도록 설정합니다
    			marker.setMap(map);
    		}
    	});
    	$.ajax({	//	6. 레포츠 상세페이지
    		url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=goSeoul&_type=json&contentId="+contentId+"&contentTypeId=28&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=132&pageNo=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
    		method : "GET",
    		async:false,
    		success: function(data) {
    			var detail = data.response.body.items.item;
    			var mapx = [];
    			var mapy = [];
    			var detail_title = [];
    			var detail_addr = [];
    			var detail_addr2 = [];
    			var detail_thumb = [];
    			var detail_overview = [];
    			var detail_homepage = [];
    			var detail_telname = [];
    			var detail_tel = [];
    			var contentId = [];
    			
    			for (let i = 0; i < detail.length; i++) {
    				detail_title.push(detail[i]["title"]);
    				detail_addr.push(detail[i]["addr1"]);
    				detail_addr2.push(detail[i]["addr2"]);
    				detail_thumb.push(detail[i]["firstimage"]);
    				detail_overview.push(detail[i]["overview"]);
    				detail_homepage.push(detail[i]["homepage"]);
    				detail_telname.push(detail[i]["telname"]);
    				detail_tel.push(detail[i]["tel"]);
    				contentId.push(detail[i]["contentId"]);
    				
    				mapy.push(detail[i]["mapy"]);
    				mapx.push(detail[i]["mapx"]);
    				
    				$("#title").text(detail_title);
    				$("<img>").attr("src", detail_thumb).appendTo("#thumb");
    				$("#overview").html(detail_overview);
    				
    				var text = detail_homepage[i];
    				var urlPattern = /https?:\/\/[^\s"'<>]+/g;
    				var urls = "";
    				if(text.match(urlPattern) !== null) {
    					urls = text.match(urlPattern)[0];
    					$("#website").html("<b>웹사이트: &nbsp</b> <a href='" + urls + "'>바로가기</a>");                	
    				}else{
    					$("#website").html("<b>웹사이트: &nbsp</b> 제공되지 않습니다.");
    				}
    				console.log(urls);
    				
    				var tel = detail_tel[i];
    				var teln = detail_telname[i]
    				
    				if(tel !== "" || teln !== ""){
    					$("#contact").html("<b>문의처: &nbsp </b>" + tel + " " + teln );
    				}else if(tel == "" || teln == ""){
    					$("#contact").html("<b>문의처: &nbsp</b>제공되지 않습니다.");
    				}
    				
    				//<a href=\"https://gahoe.or.kr\" target=\"_blank\" title=\"새창 : 가회동성당 사이트로 이동\">https://gahoe.or.kr</a>",
    				// $("#contact").html("<b>문의처:  </b><br>" + detail_telname + " " + detail_tel);
    				// $("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());
    				var addr = detail_addr[i];
   	             	var addr2 = detail_addr2[i];
   	                if(addr !== "" || addr2 !== ""){
   	                	$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());               	
   	                }else if(addr == "" || addr2 == ""){
   	                	$("#address").html("<b>주소: &nbsp</b>제공되지 않습니다.");               	    	
   	                }
    			}
    			
    			
    			console.log(mapx);
    			console.log(mapy);
    			var container = document.getElementById('map');
    			var options = {
    					center: new kakao.maps.LatLng(mapy[0], mapx[0]),
    					level: 3
    			};
    			
    			var map = new kakao.maps.Map(container, options);
    			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
    			var markerPosition  = new kakao.maps.LatLng(mapy[0], mapx[0]);
    			
    			var marker = new kakao.maps.Marker({
    				position: markerPosition
    			});
    			
    			// 마커가 지도 위에 표시되도록 설정합니다
    			marker.setMap(map);
    		}
    	});
    	$.ajax({	//	7. 여행코스 상세페이지
    		url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=goSeoul&_type=json&contentId="+contentId+"&contentTypeId=25&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=25&pageNo=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
    		method : "GET",
    		async:false,
    		success: function(data) {
    			var detail = data.response.body.items.item;
    			var mapx = [];
    			var mapy = [];
    			var detail_title = [];
    			var detail_addr = [];
    			var detail_addr2 = [];
    			var detail_thumb = [];
    			var detail_overview = [];
    			var detail_homepage = [];
    			var detail_telname = [];
    			var detail_tel = [];
    			var contentId = [];
    			
    			for (let i = 0; i < detail.length; i++) {
    				detail_title.push(detail[i]["title"]);
    				detail_addr.push(detail[i]["addr1"]);
    				detail_addr2.push(detail[i]["addr2"]);
    				detail_thumb.push(detail[i]["firstimage"]);
    				detail_overview.push(detail[i]["overview"]);
    				detail_homepage.push(detail[i]["homepage"]);
    				detail_telname.push(detail[i]["telname"]);
    				detail_tel.push(detail[i]["tel"]);
    				contentId.push(detail[i]["contentId"]);
    				
    				mapy.push(detail[i]["mapy"]);
    				mapx.push(detail[i]["mapx"]);
    				
    				$("#title").text(detail_title);
    				$("<img>").attr("src", detail_thumb).appendTo("#thumb");
    				$("#overview").html(detail_overview);
    				
    				var text = detail_homepage[i];
    				var urlPattern = /https?:\/\/[^\s"'<>]+/g;
    				var urls = "";
    				if(text.match(urlPattern) !== null) {
    					urls = text.match(urlPattern)[0];
    					$("#website").html("<b>웹사이트: &nbsp</b> <a href='" + urls + "'>바로가기</a>");                	
    				}else{
    					$("#website").html("<b>웹사이트: &nbsp</b> 제공되지 않습니다.");
    				}
    				console.log(urls);
    				
    				var tel = detail_tel[i];
    				var teln = detail_telname[i]
    				
    				if(tel !== "" || teln !== ""){
    					$("#contact").html("<b>문의처: &nbsp </b>" + tel + " " + teln );
    				}else if(tel == "" || teln == ""){
    					$("#contact").html("<b>문의처: &nbsp</b>제공되지 않습니다.");
    				}
    				
    				//<a href=\"https://gahoe.or.kr\" target=\"_blank\" title=\"새창 : 가회동성당 사이트로 이동\">https://gahoe.or.kr</a>",
    				// $("#contact").html("<b>문의처:  </b><br>" + detail_telname + " " + detail_tel);
    				// $("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());
    				var addr = detail_addr[i];
    				var addr2 = detail_addr2[i];
   	                if(addr !== "" || addr2 !== ""){
   	                	$("#address").html("<b>주소: &nbsp</b>" + $("<span>").text(detail_addr + detail_addr2).html());               	
   	                }else if(addr == "" || addr2 == ""){
   	                	$("#address").html("<b>주소: &nbsp</b>제공되지 않습니다.");               	    	
   	                }
    			}
    			
    			
    			console.log(mapx);
    			console.log(mapy);
    			var container = document.getElementById('map');
    			var options = {
    					center: new kakao.maps.LatLng(mapy[0], mapx[0]),
    					level: 3
    			};
    			
    			var map = new kakao.maps.Map(container, options);
    			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
    			var markerPosition  = new kakao.maps.LatLng(mapy[0], mapx[0]);
    			
    			var marker = new kakao.maps.Marker({
    				position: markerPosition
    			});
    			
    			// 마커가 지도 위에 표시되도록 설정합니다
    			marker.setMap(map);
    		}
    	});
	});