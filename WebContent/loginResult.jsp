<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!
		String id, pw;
	%>

	<%
		id = (String)session.getAttribute("id");
		pw = (String)session.getAttribute("pw");
	%>
	
	<%= id%>�� �ȳ��ϼ���.

	<a href="logout.jsp">�α׾ƿ�</a>
</body>
</html>