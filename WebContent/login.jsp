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
	<!-- joinOk Servlet���� �����͸� �����ϴ� jsp�ڵ� -->	
	<form action="loginOk" method="post">
		<br>
		<input type="text" class="form-control" placeholder="���̵� �Է��ϼ���" name="uid"> <br>
		<input type="password" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���" name="upass"> <br>
		<input type="submit" value="�α���">
		<input type="reset" value="���">
	</form>

	<script src="./js/jquery.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>