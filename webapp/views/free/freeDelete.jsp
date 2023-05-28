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

<style>
* {
	font-family: 'Title_Medium';
}

label {
	font-weight: bold;
}

ul {
	list-style-type: '#';
	padding-inline-start: 1ch;
}

li {
	float: left;
	margin-right: 25px;
}

.write-btn {
	text-align: center;
}

.write-btn1 {
	display: inline-block;
}
</style>


<script>

var freeId = ${freeBean.free_id};

function idCheck() {
	if ( id != freeId ) {
		alert("작성자가 아닙니다.");
		history.go(-1);
		return false;
	}
}
function removeCheck() {
 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
     document.removeCheck.submit();
 }else{   //취소
     return false;
 }
}


</script>
	
	
</head>

<body>
<c:import url="../header.jsp" />
	<br><h4 class="mb-3" align="center">여행정보 삭제</h4>
	<form method="post" action="freeDeleteResult.do" onsubmit="return idCheck()" >
		<div class="container" style="width: auto; height: auto;">
			<div
				style="width: 100%; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">

				<input type="hidden" name="free_nick" value="${freeBean.free_nick}">
				<input type="hidden" name="free_id" value="${freeBean.free_id}"> 
				<input type="hidden" name="num" value="${freeBean.free_no}"> 
				<input type="hidden" name="pageNum" value="${pageNum}">	

				<div class="write-btn">
					<button type="submit" class="btn btn-outline-primary write-btn1">삭제</button>
					  <input id="tblbutton" type="button" value="글삭제하기" onclick="removeCheck()">
					<button type="reset" class="btn btn-outline-secondary write-btn1">취소</button>
				</div>

			</div>
		</div>
	</form>
<c:import url="../footer.jsp"/>
</body>
</html>
