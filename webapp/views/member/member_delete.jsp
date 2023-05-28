<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script>
	function check() {
		if ($.trim($("#pass").val()) == "") {
			alert("비밀번호를 입력하세요!");
			$("#pass").val("").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<form method="post" action="member_delete_ok.do" onsubmit="return check()">
		<div class="title">회원 탈퇴</div>

		<table class="table">
			<tr>
				<th>회원아이디</th>
				<td>${id}</td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" id="pass" size="14" />
				</td>
			</tr>
		</table>
		<input type="submit" value="탈퇴" /> 
		<input type="reset" value="취소" onclick="$('#pass').focus();" />
	</form>
</body>
</html>