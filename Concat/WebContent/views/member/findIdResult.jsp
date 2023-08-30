<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<%@page import="concat.member.model.dao.MemberDao"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%
	 request.setCharacterEncoding("UTF-8");
	 String memName = request.getParameter("memName");
	 String phone = request.getParameter("phone");
	 String contextPath = request.getContextPath();
	     
	MemberDao dao = new MemberDao();
	Connection conn = null;
	String memId = dao.findId(conn, memName, phone); //아이디를 디비에서 가져옴..실패시 널
	 
	%>
        
<title>Document</title>
<style>

	   .container{
	       background-color: black;
	       color: white;
	       border: 1px solid white;
	       margin: auto;
	       text-align: center;
	       width: 100px;
	       height: 200px;
	       margin-top: 50px;
	       border-radius: 100px;
	   }
	   .found-success{
	       margin-top: 40px;
	   }
	   .found-fail{
	       margin-top: 70px;
	   }
   
</style>
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	</head>
	<body>
	    <div class="wrap">
	        <form name="idsearch" method="post">
	        <%
	        if (memId != null) {
	        %>
	        
	        <div class = "container">
	            <div class = "found-success">
	            <h3>  회원님의 아이디는 </h3>  
	            <div class ="found-id"><%= memId %></div>
	            <h4>  입니다 </h4>
	            </div>
	            <div class = "found-login">
	                <input type="button" value="로그인" onClick ='login()' class="btn btn-outline-primary"/>
	            </div>
	        </div>
	        <% } else { %>
	            <div class = "container">
	            <div class = "found-fail">
	            <h4>  등록된 정보가 없습니다 </h4>  
	            </div>
	            <div class = "found-login">
	                <input type="button" id="btnback" value="다시 찾기" onClick="history.back()" class="btn btn-outline-danger"/>
	                <input type="button" id="btnjoin" value="회원가입" onClick="joinin()" class="btn btn-outline-warning"/>
	            </div>
	        </div> 
	        <% } %> 
	        </form>
	    </div>
</body>
</html>