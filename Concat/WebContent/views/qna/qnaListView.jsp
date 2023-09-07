<%@page import="concat.qna.model.vo.QnaInfo"%>
<%@page import="concat.qna.model.vo.Qna"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
 QnaInfo qi = (QnaInfo)request.getAttribute("qi");


 int currentPage = qi.getCurrentPage();
 int startPage = qi.getStartPage();
 int endPage = qi.getEndPage();
 int maxPage = qi.getMaxPage();

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QNA</title>
<style>
#outer {
	width: 1100px;
	height: auto;
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
	height: 100px;
}

table * {
	text-align: center;
	padding: 0px;
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

table td {
	width: 130px;
	height: 50px;
}

tbody>tr {
	height: 10px;
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

thead th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.num {
	width: 110px;
	height: 41px;
}

.title {
	width: 420px;
	height: 50px;
	text-align: left;
	padding-left: 10px;
}

table td {
	width: 140px;
	height: 50px;
	border-bottom: 1px solid lightgray;
}

.EnrollForm {
	float: right;
	width: 100px;
	height: 50px;
}

.EnrollForm>button {
	font-weight: 900;
}

table, td, th {
	border-collapse: collapse;
}

.btn button {
	width: 30px;
	height: 30px;
	background-color: black;
	color: white;
}

.btnn>button {
	width: 100px;
	height: 40px;
	margin-top: 10px;
	background-color: black;
	color: white;
	border-radius: 10px;
	font-weight: bolder;
	font-size: 17px;
}

button:hover {
	cursor: pointer;
}

.listbar {
	width: 150px;
	height: 220px;
	border: 1px solid black;
	position: fixed;
	top: 400px;
	left: 150px;
	text-align: center;
	background-color: white;
}

.listbar>div {
	color: white;
	width: 100%;
	height: 48px;
	background-color: black;
	text-align: center;
	line-height: 44px;
}

#firdiv {
	background-color: white;
	color: black;
	width: 100%;
	height: 28px;
	text-align: center;
	line-height: 28px;
}

.listbar a {
	text-decoration: none;
	color: white;
}

.listbar a:hover {
	text-decoration: 1px underline;
	color: white;
}

.paging-area>button {
	width: 30px;
	height: 30px;
	background-color: black;
	color: white;
	font-size: 15px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<br>

	<div id="outer">
		<h1>QNA</h1>

		<form action="" id="no-search">
			<input type="text">
			<button type="submit">검색</button>
		</form>
		<br><br>
		
		<%if(loginMember != null ){%>
			<div class="btnn" align="right">
				<button class="enroll-btn" onclick="qnawrite()">작성하기</button>
			</div>
		<% } %>
		<br>


		<div align="center">
			<table class="area-no">
				<thead>
					<tr>
						<th width="100" class="num">NO</th>
						<th width="650">제목</th>
						<th width="150">작성자</th>
						<th width="150">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%if(list.isEmpty()){ %>
					<tr>
						<td colspan="4">존재하는 QNA 게시글이 없습니다.</td>
					</tr>
					<%}else{%>
						<% for(Qna q : list){ %>
							<tr id="selectr">
								<td><%=q.getQnaNo() %></td>
								<td><%=q.getQnaTitle() %></td>
								<td><%=q.getQnaWriterNick() %></td>
								<td><%=q.getCreateDate() %></td>
							</tr>
						<%} %>
					<%}%>
				</tbody>

			</table>
		</div>
		<br>
		<br>
	<div class="paging-area" align="center">

		<%if(currentPage != 1){ %>
		<button
			onclick="location.href='<%=contextPath %>/list.qa?qpage=<%=currentPage-1%> '">
			◀</button>
		<% }%>

		<% for(int p = startPage; p<=endPage; p++){ %>
		<%if(p == currentPage){ %>
		<button disabled><%= p %></button>
		<%}else {%>
		<button
			onclick="location.href='<%=contextPath%>/list.qa?qpage=<%=p%>'"><%= p %></button>
		<%} %>
		<%} %>

		<%if(currentPage != maxPage){ %>
		<button
			onclick="location.href='<%=contextPath %>/list.qa?qpage=<%=currentPage+1%>'">
			▶</button>
		<% }%>


	</div>

</div>


	<div class="listbar" align="center">
		<div id="firdiv"><b>MENU</b></div>
		<div><a href="<%= contextPath %>/listpage.no?cpage=1"><b>공지사항</b></a></div>
		<div><a href="<%= contextPath %>/list.qa?qpage=1"><b>QNA</b></a></div>
		<div><a href="<%= contextPath %>/list.fq"><b>FAQ</b></a></div>
		<div><a href="<%= contextPath %>/list.bl?cpage=1"><b>블랙리스트</b></a></div>
  	</div>
	<script>
        function qnawrite(){
        	location.href="<%= contextPath%>/insert.qa"
        }
        
        $(function(){
            $(".area-no > tbody > #selectr").click(function(){
            	const num =$(this).children().eq(0).text();
              	
              location.href = '<%=contextPath %>/detail.qa?num='+num;
              
              })
        })

    </script>
<%@ include file="../common/footerbar.jsp" %>
</body>
</html>