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
	<form action="joinOk" method="post">
		<br>
			<input type="text" class="form-control" placeholder="�̸��� �Է��ϼ���" name="uname"> <br>
			<input type="text" class="form-control" placeholder="���̵� �Է��ϼ���" name="uid"> <br>
			<input type="password" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���" name="upass"> <br>
			���� <br>
			<input type="radio" name="gender" value="man">��
			<input type="radio" name="gender" value="woman">��<br><br>
			<input type="submit" value="ȸ������">
			<input type="reset" value="���">
	</form>

	<script src="./js/jquery.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>