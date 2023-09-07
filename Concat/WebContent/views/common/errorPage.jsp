<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img{
		width: 800px;
		height: 800px;
	}
</style>
</head>
<body>
	<img src="/resources/image/hqdefault.jpg">
	<br>
	<p>
		<h1><%=errorMsg %>!</h1>
		<br>
		<h2>전 페이지로 돌아가 다시 작성해주세요.</h2>
	</p>
</body>
</html>