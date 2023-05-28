<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="pageNum" value="${pageNum}">	
	<c:if test="${result == 1}">
		<script>
			alert("삭제 성공");
			location.href = "freeList.do?pageNum=${pageNum}";
		</script>
	</c:if>
	<c:if test="${result != 1}">
		<script>
			alert("삭제 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>