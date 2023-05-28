<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행정보 공유</title>
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


<script type="text/javascript">
	/* 	window.onload=function() {
	
	 } */
	$(function() {
		// 기존 댓글 목록 출력
		$('#slist').load('slist.do?num=${freeBean.free_no}');
		//		$('#list').load('${path}/list/pageNum/${pageNum}');
		$('#repInsert').click(function() {
			if (!frm.freereply_content.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.freereply_content.focus();
				return false;
			}
			
			var id = '${sessionScope.id}';			
			
			if(id == ''){
				alert("로그인 하세요.");
				frm.freereply_content.value = '';
				frm.freereply_content.focus();
				return false;
			}		
			
			var frmData = $('#frm').serialize();
			//var frmData = 'freereply_id=' + frm.freereply_id.value + '&free_no='
			//		+ frm.free_no.value + '&freereply_content='
			//		+ frm.freereply_content.value;
			
			
			//$.post("요청이름값", "데이터 전달", "콜백함수");
			$.post('sInsert.do', frmData, function(data) {
				$('#slist').html(data);
				frm.freereply_content.value = '';
			});
		});

	});
</script>






	
<style>
* {
	font-family: 'Title_Medium';
}

th {
	font-weight: bold;
	width: 16%;
}
td {
	text-align:left;
}

.write-btn {
	text-align: center;
}

.write-btn1 {
	display: inline-block;
}
img{
	text-align: center;
	max-width:800px;	
}
</style>

</head>

<body>
	<c:import url="../header.jsp" />
	<br>
	<h4 class="mb-3" align="center">여행정보 공유 상세내용</h4>
	<form method="post" action="freeUpdateResult.do">
		<div class="container" style="width: auto; height: auto;">
			<div
				style="width: 100%; height: auto; margin: 50px auto; 
				background-color: white; border-radius: 10px;">
		
				<input type="hidden" name="free_id" value="${freeBean.free_id}"> 
				<input type="hidden" name="pageNum" value="${pageNum}">	
				

				<div class="form-group row">
					<label for="free_category" style="text-indent: 10px;"
					class="col-sm-2 col-form-label"><b>카테고리</b></label>
					<div class="col-sm-3">
						<input class="custom-select mr-sm-3" id="free_category"
							value="${freeBean.free_category}" readonly>
					</div>
				</div>

				<table class="table">
					<tbody>
						<tr>
							<th style="witdh:25%;"scope="row">작성자</th>
							<td>${freeBean.free_nick}</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td>${freeBean.free_title}</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td>
								<div style="white-space: pre-line;">${freeBean.free_content}
								<c:if test="${freeBean.free_filename != null}">
									<img class="img-fluid" src="./upload/${freeBean.free_filename}">
								</c:if>
								</div> 
							</td>
						</tr>
						<tr>
							<th scope="row">해시태그</th>
							<td>${freeBean.free_tag}</td>
						</tr>
						
					</tbody>
				</table>
				
				
				
					
				
					<div style="magrin: 0 auto; text-align: center;">
					<script>
					var freeid = ${freeBean.free_id};
					</script>
					<c:set var="id" value="${id }" scope="session" />
					<c:if test="${id != null }">
						<c:if test="${id != freeid }">
						
						<tr>
							<td><span id="add-goodRp-btn"
								class="btn btn-outline-primary">추천👍
							</span></td>
							<td><span id="add-badRp-btn" class="btn btn-outline-danger">비추👎
							</span></td>
						</tr>
							</c:if>
						</c:if>
						
			
					
					
					
				</div>
				<br>
				
				
				
				
				
				
				
				<div class="write-btn">
					<a href="freeWrite.do?pageNum=${pageNum}"
						class="btn btn-outline-primary">작성</a> <a
						href="freeList.do?pageNum=${pageNum}"
						class="btn btn-outline-primary">목록</a> <a
						href="freeUpdate.do?num=${freeBean.free_no}&pageNum=${pageNum}"
						class="btn btn-outline-primary">수정</a>
						 <a
						href="freeDelete.do?num=${freeBean.free_no}&pageNum=${pageNum}"
						class="btn btn-outline-danger">삭제</a>
				</div>
			</div>
		</div>
	</form>
	
	
		<form name="frm" id="frm" style="max-width:800px; margin: 0 auto;">
			<input type="hidden" name="freereply_id" value="${sessionScope.id}"> 
			<input type="hidden" name="free_no" value="${freeBean.free_no }">
            <div class="form-group row">
                <label for="freereply_content" class="col-sm-2 col-form-label"><b>댓글</b></label>
            	<div class="d-flex col-sm-10">
         	    <textarea name="freereply_content" rows="2" cols="4"
         	    class="form-control" placeholder="댓글을 입력해주세요." required></textarea>
					<input type="button" class="btn btn-outline-primary" value="작성" id="repInsert">
				</div>
			<div id="slist"></div>
			</div>
		</form>
	

	<script>
		document.getElementById("add-goodRp-btn").onclick = function() {
			alert("좋아요 +1");
			location.href = "freeLikeUpdate.do?num=${freeBean.free_no}&pageNum=${pageNum}";
		};

		document.getElementById("add-badRp-btn").onclick = function() {
			alert("싫어요 +1");
			location.href = "freeDislikeUpdate.do?num=${freeBean.free_no}&pageNum=${pageNum}";
		};
	</script>





	
	<c:import url="../footer.jsp" />
</body>
</html>
