<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result == 1}">
		<script>
			alert("등록되지 않은 회원입니다.");
			history.go(-1);
		</script>
	</c:when>
	<c:when test="${result == 2}">
		<script>
			alert("아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.");
			history.go(-1);
		</script>
	</c:when>
</c:choose>
