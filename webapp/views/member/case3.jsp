<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
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
        .flex-container{ 
            width: 100%; 
            height: 100vh; 
            display: -webkit-box; 
            display: -moz-box;
            display: -ms-flexbox; 
            display: flex; 
 
            -webkit-box-align: center; 
            -moz-box-align: center;
            -ms-flex-align: center;
            align-items: center; /* 수직 정렬 */
 
            -webkit-box-pack: center;
            -moz-box-pack: center; 
            -ms-flex-pack: center; 
            justify-content: center; /* 수평 정렬 */
        } 
        
        .findedId{
            background-color: aqua;
        }
 
    </style>
</head>
<body>
<c:import url="../header.jsp" />
    <div class="flex-container"> 
        <div class="findedId"> 입력값에 일치하는 정보가 없습니다. </div>
    </div>
<c:import url="../footer.jsp" />
</body>
</html>