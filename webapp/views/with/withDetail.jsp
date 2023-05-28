<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/font.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
<style>
    body {
        font-family: 'Title_Medium';
    }
</style>
</head>
<body>
    <c:import url="../header.jsp" />
    <div id="withdetail">
        <h1 class="withdetail_title" style="font-size:40px; position:static; margin:10px;">동행 구하기</h1>

        <table class="table">
        	<c:if test="${id == with.with_id}">
        		<button class="btn btn-outline-primary" onClick="location.href='withUpdate.do?with_no=${with.with_no}&page=${page}'">수정</button>
        		<button class="btn btn-outline-primary" onClick="location.href='withDelete.do?with_no=${with.with_no}'">삭제</button>
        	</c:if>
        	
            <tr>
                <th>제목</th>
                <td colspan="3">${with.with_title}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${with.with_nick}</td>
                <th>조회수</th>
                <td>${with.with_hit}</td>
            </tr>
            <tr>
                <th>지역</th>
                <td>${with.with_category}</td>
                <th>성별</th>
                <td>${with.with_gender}</td>
            </tr>
            <tr>
                <th>나이</th>
                <td>${with.with_age}</td>
                <th>날짜</th>
                <td>${with.with_start} ~ ${with.with_end}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    ${with.with_content} <br>
                    <c:if test="${with.with_filename != null}">
                        <img src="./upload/${with.with_filename}">
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>태그</th>
                <td colspan="3">${with.with_tag}</td>
            </tr>
            <tr>
                <th>현재인원</th>
                <td>${with.with_curno} / ${with.with_maxto}</td>
                <c:if test="${id != with.with_id}">
                	<c:if test="${with.with_curno < with.with_maxto}">
                    	<td colspan="2">
                        	<button class="btn btn-outline-primary" onClick="location.href='with_reserve.do?with_no=${with.with_no}&page=${page}&state=detail'">신청하기</button>
                    	</td>
                	</c:if>
                	<c:if test="${with.with_curno == with.with_maxto}">
                    	<td colspan="2">
                        	<button class="btn btn-danger">마감</button>
                    	</td>
                	</c:if>
         		</c:if>
            </tr>
        </table>

        <c:if test="${replyList != null}">
            <table class="table">
                <c:forEach items="${replyList}" var="reply">
                    <tr>
                        <th>${reply.withreply_nick}</th>
                        <th>
                            <fmt:formatDate value="${reply.withreply_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </th>
                    </tr>
                    <tr>
                        <td>${reply.withreply_content}</td>
                        <c:if test="${id == reply.withreply_id}">
                        	<td>
                        		<button class="btn btn-outline-danger" onClick="location.href='withReplyDelete.do?withreply_no=${reply.withreply_no}&with_no=${with.with_no}&page=${page}&state=detail'">삭제</button>
                        	</td>
                        </c:if>
                        
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <form method="post" action="with_reply.do?with_no=${with.with_no}&page=${page}&state=detail">
            <div class="form-group row">
                <label for="with_filename" class="col-sm-2 col-form-label">댓글</label>
            	<div class="d-flex col-sm-10">
            	    <textarea id="withreply_content" name="withreply_content" rows="1" cols="3" class="form-control" placeholder="댓글을 입력해주세요." required></textarea>
            	    <input class="btn btn-outline-primary justify-content-end" type="submit" value="작성">
            	</div>
            </div>
        </form>
    </div>
    <c:import url="../footer.jsp" />
</body>
</html>