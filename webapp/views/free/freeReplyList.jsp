<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 리스트</title>
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








<!-- <link href="./css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="./js/jquery.js"></script>
<script src="./js/bootstrap.min..js"></script> -->


<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> -->
<style>
.container {
	text-align: center;
}

* {
	font-family: 'Title_Medium';
	font-weight: lighter;
	witdh: 100%;
}
</style>







<script type="text/javascript">
	$(function() {
		
		// 수정버튼 클릭
		$('.edit1').click(function() {
			var id  = $(this).attr('id');  // rno
			var txt = $('#td_'+id).text(); // replytext
			$('#td_'+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt
				+"</textarea>");
			
			// 수정, 삭제 버튼을 확인, 취소 버튼으로 수정
			$('#btn_'+id).html(
			   "<input type='button' value='확인' onclick='up("+id+")'> "
			  +"<input type='button' value='취소' onclick='lst()'>");
		});
	});
	
	
	// 확인버튼을 클릭해서 내용을 수정
	function up(id) {
		var freereply_content = $('#tt_'+id).val();
		var formData = "freereply_no="+id+"&freereply_content="+freereply_content
			+"&free_no=${freeBean.free_no}";
		// 댓글 내용 수정하는 요청
		$.post('repUpdate.do',formData, function(data) {
			$('#slist').html(data);
		});
	}
	
	// 취소 버튼 클릭
	function lst() {
		$('#slist').load('slist.do?num=${freeBean.free_no}');
	}
	
	// 댓글 삭제 요청
	function del(freereply_no,free_no) {
		var formData="freereply_no="+freereply_no+"&free_no="+free_no;
		$.post("repDelete.do",formData, function(data) {
			$('#slist').html(data);
		});
	}
</script>
</head>
<body>


	<div class="container"><br>
		<table style="text-align:left; width:200%;" class="table">
			<tr>
				<th>작성자</th>
				<th>내용</th>
				<th>수정일</th>
				<th></th>
			</tr>
			<c:forEach var="rb" items="${slist}">
				<tr>
					<td>${rb.freereply_nick}</td>
					<td id="td_${rb.freereply_no}">${rb.freereply_content}</td>
					<td>${rb.freereply_date }</td>
					<td id="btn_${rb.freereply_no}">
						<%-- <c:if test="${rb.freereply_id == freeBean.free_id }"> --%> <c:if
							test="${rb.freereply_id == sessionScope.id }">
							<input type="button" value="수정" class="edit1"
								id="${rb.freereply_no}">
							<input type="button" value="삭제"
								onclick="del(${rb.freereply_no},${rb.free_no})">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>