<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='utf-8' />
<link href='./css/main.css' rel='stylesheet' />
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
.event-icon {
	width: 32px;
}
.margin {
	margin: 100px auto;
}
div.fc-event-title-container {
	text-align: center;
	font-weight: bold;
}

</style>
</head>
<body>
	<c:import url="header.jsp" />
<div class="container margin">
	<div id='calendar'></div>

</div>
	<c:import url="footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src='./js/main.js'></script>
	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							var calendarEl = document
									.getElementById('calendar');
							var calendar = new FullCalendar.Calendar(
									calendarEl,
									{
										headerToolbar : {
											left : 'prevYear,prev,next,nextYear today',
											center : 'title',
											right : 'dayGridMonth,dayGridWeek,dayGridDay'
										},
										selectable : true,
										selectMirror : true,
										navLinks : true,
										editable : false,
										dayMaxEvents : 3,
									});

							// API 요청 - 축제 검색
							$
									.ajax({
										url : 'https://apis.data.go.kr/B551011/KorService1/searchFestival1',
										method : 'GET',
										dataType : 'json',
										data : {
											numOfRows : 2000,
											pageNo : 1,
											MobileOS : 'ETC',
											MobileApp : 'win',
											_type : 'json',
											listYN : 'Y',
											eventStartDate : '20230101', // 이벤트 시작일
											eventEndDate : '20231231',
											areaCode : 1,
											serviceKey : 'JUnPRuQvIHEkBUawKCyvG8bFrjKl4V/ESdFv/8auifvAU/8ggWa1aHlVtv2OBmuZ8Ui3fFzw2qx9ToCqfgTddQ==',
										},
										success : function(response) {
											var events = response.response.body.items.item;

											// 이벤트 객체 변환 및 추가
											events
													.forEach(function(event) {
														var eventObj = {
															title : event.title, // 이벤트 제목
															start : event.eventstartdate, // 이벤트 시작일
															end : event.eventenddate,
															contentid : event.contentid, // contentid 소문자로 변경
															backgroundColor : "#bee1ff", // 배경색
															borderColor : "#E0ECF8", // 테두리 색
															textColor : "#2c3e50",
														};
														calendar
																.addEvent(eventObj);
													});

											calendar.render();
										},
										error : function() {
											alert('이벤트를 불러오는 동안 오류가 발생했습니다!');
										}
									});

							// 클릭 이벤트 처리
							calendar
									.on(
											'eventClick',
											function(info) {
												// contentId 값을 가져옵니다.
												var contentId = info.event.extendedProps.contentid;

												// eventDetail 페이지로 이동합니다.
												window.location.href = "eventDetail.do?contentId="
														+ contentId;
												// 기존 페이지로 포커스를 되돌립니다.
												window.focus();

												// 새 창에서 열린 페이지가 성공적으로 로드되었는지 확인합니다.
												if (newWindow) {
													// 새 창이 열렸으므로 기존 페이지 이동을 막기 위해 이벤트를 취소합니다.
													info.jsEvent
															.preventDefault();
												}
											});

						});
	</script>
</body>
</html>