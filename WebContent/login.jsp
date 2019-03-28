<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css">

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- joinOk Servlet으로 데이터를 전송하는 jsp코드 -->	
	<form action="loginOk" method="post">
		<br>
		<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="uid"> <br>
		<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="upass"> <br>
		<input type="submit" value="로그인">
		<input type="reset" value="취소">
	</form>

	<script src="./js/jquery.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>