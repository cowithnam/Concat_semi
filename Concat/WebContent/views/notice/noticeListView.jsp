<%@page import="concat.notice.model.vo.PageInfo"%>
<%@page import="concat.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();

	%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style>
#outer {
	width: 1100px;
	height: 600px;
	margin: auto;
}

h1 {
	display: inline;
}

#no-search {
	float: right;
	position: relative;
	top: 20px;
}

#no-search>input {
	width: 200px;
	height: 20px;
	position: relative;
	bottom: 2px;
}

#no-search>button {
	height: 26px;
	background-color: black;
	color: white;
	font-weight: bold;
}

table {
	width: 1100px;
	height: 50px;
}

table * {
	text-align: center;
	padding: 0px;
}

thead {
	background-color: black;
	color: white;
}

.num {
	width: 110px;
	height: 41px;
}

.title {
	width: 660px;
	height: 41px;
	text-align: left;
	padding-left: 10px;
}

.area-no td {
	width: 140px;
	height: 50px;
	border: 1px solid black;
}

.enroll-btn {
	width: 80px;
	height: 40px;
	background-color: black;
	color: white;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px;
	margin-top: 5px;
	margin-right: 2px;
}

#custom-menu {
	position: fixed;
	left: -5px;
	top: 400px;
}

#custom-menu>div {
	border: 1px solid black;
}

.minibar {
	position: absolute;
	top: 580px;
	right: 9%;
}

#minibar {
	position: fixed;
	background-image: url(resources/image/minibar.png);
	background-repeat: no-repeat;
	background-size: 250px 2000px;
	width: 200px;
	height: 200px;
}

#minibar>a {
	font-size: 15px;
	color: white;
	text-decoration: none;
	font-weight: bolder;
	color: ivory;
}

#zzim {
	position: relative;
	top: 38px;
	left: 38px;
}

#sell-page {
	position: relative;
	top: 42px;
	left: 35px;
}

#minibar>a:hover {
	text-decoration: 2px underline;
	color: lightgray;
}

table, td, th {
	border-collapse: collapse;
}

#listbar {
  width: 150px;
  height: 210px;
  border: 1px solid white;
  position: fixed;
  top: 400px; 
  left: 150px;
  text-align: center;
  background-color: white; 
}

#listbar>table {
	width: 150px;
	height: 210px;
	background-color: black;
}
#listbar a{
	text-decoration: none;
	color:white;
}


#listbar a:hover {
	text-decoration: 1px underline;
	color:white;
}


a:link {
  color : white;
}
a:visited { color:white; }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<br>
	<br>

	<div id="outer">
		<h1>공지사항</h1>


		<form action="" id="no-search">
			<input type="text">
			<button type="submit">검색</button>
		</form>

		<hr>



		<div align="center">
			<table class="area-no">
				<thead>
					<tr>
						<th width="100px" class="num">NO</th>
						<th width="650">제목</th>
						<th width="150">작성일</th>
						<th width="150">조회수</th>
					</tr>
				</thead>
				<tbody>



					<%if(list.isEmpty()){ %>
					<tr>
						<td colspan="4">존재하는 공지사항이 없습니다.</td>
					</tr>
					<%}else{%>



					<% for(Notice n : list){ %>

					<tr id="selectr">
						<td><%=n.getNoticeNo() %></td>
						<td><%=n.getNoticeTitle() %></td>
						<td><%=n.getCreateDate() %></td>
						<td><%=n.getCount()%></td>
					</tr>

					<%} %>
					<%}%>




				</tbody>

			</table>
		</div>
		<!-- 관리자 아이디로 변경 -->
		<% if(loginMember != null && loginMember.getMemId().equals("user01")){%>
		<div align="right">
			<button class="enroll-btn" onclick="Listwrite()">작성하기</button>

		</div>
		<% }%>

	</div>
<br>
	<div class="paging=area" align="center">

		<%if(currentPage != 1){ %>
		<button
			onclick="location.href='<%=contextPath %>/listpage.no?cpage=<%=currentPage-1%> '">
			&lt;</button>
		<% }%>

		<% for(int p = startPage; p<=endPage; p++){ %>
		<%if(p == currentPage){ %>
		<button disabled><%= p %></button>
		<%}else {%>
		<button
			onclick="location.href='<%=contextPath%>/listpage.no?cpage=<%=p%>'"><%= p %></button>
		<%} %>
		<%} %>

		<%if(currentPage != maxPage){ %>
		<button
			onclick="location.href='<%=contextPath %>/listpage.no?cpage=<%=currentPage+1%>'">
			&gt;</button>
		<% }%>


	</div>
	


	<div id="listbar" align="center" style="border: 1px solid black;">
    
    <table align="center">
        <thead>
        <tr align="center" style="border: 1px solid black;"><b>MENU</b></tr></thead>
    <tbody>
     	<tr><td><a href="<%= contextPath %>/listpage.no?cpage=1"><b>공지사항</b></a></td></tr>
        <tr><td><a href="<%= contextPath %>/list.qa?qpage=1"><b>QNA</b></a></td></tr>
    	<tr><td><a href="<%= contextPath %>/list.fq"><b>FAQ</b></a></td></tr>
    	<tr><td><a href="<%= contextPath %>/list.bl?cpage=1"><b>블랙리스트</b></a></td></tr>
</tbody>
    </table>
</div>
</body>
<script>
   //공지사항 작성하기    
    function Listwrite(){
            location.href = "<%=contextPath%>/insertpage.no?cpage=1"
        }
        
   //공지사항 글번호 
    $(function(){
      $(".area-no > tbody > #selectr").click(function(){
      	const num =$(this).children().eq(0).text();
        	
        location.href = '<%=contextPath %>/detail.no?num='+num;
        
        })
       })
   
    </script>

</html>