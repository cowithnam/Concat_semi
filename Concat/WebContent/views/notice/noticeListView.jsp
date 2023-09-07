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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style>
    #outer{
        width: 1100px;
        height: 700px;
        margin: auto;
    }
    
    h1{display: inline;}
    
    #bl-saerch{
        float: right;
        position: relative;
        top: 20px;
    }

    #bl-saerch>input{
        width: 200px; 
        height: 22px; 
        position: relative; 
        bottom: 1px;} 

    #bl-saerch>button{
        height: 28px; 
        background-color: black; 
        color: white; 
        font-weight: bold;}

    table{
        width: 1100px;
    }

    table>*{text-align: center;}

    thead th{
        border-top: 1px solid black;
        border-bottom: 1px solid black;
    }

    .num{
        width: 110px; 
        height: 41px;
    }
    
    .title{
        width: 420px; 
        height: 50px; 
        text-align: left; 
        padding-left: 10px;
    }

    table td{
        width: 140px;
        height: 50px; 
        border-bottom: 1px solid lightgray;
    }
    
    .EnrollForm{
        float: right;
        width: 100px;
        height: 50px;
    }

    .EnrollForm>button{
        font-weight: 900;
    }
    
    table, td, th {
        border-collapse : collapse;
    }

    .btn button{
        width: 30px;
        height: 30px;
        background-color: black;
        color: white;
    }
    
    .btnn>button{
      	width: 100px;
        height: 40px;
        margin-top: 10px;
        background-color: black;
        color: white;
        border-radius: 10px;
        font-weight: bolder;
        font-size: 17px;
    }

    button:hover{
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
	#firdiv{
		background-color: white;
		color: black;
		width: 100%;
		height: 28px;
		text-align: center;
		line-height: 28px;
	}
	.listbar a{
		text-decoration: none;
		color:white;
	}
	
	
	.listbar a:hover {
		text-decoration: 1px underline;
		color:white;
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
		<h1>공지사항</h1>
		<br><br><br>
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
		<% if(loginMember != null && loginMember.getMemId().equals("admin")){%>
		<div class="btnn" align="right">
			<button class="enroll-btn" onclick="Listwrite()">작성하기</button>
		</div>
		<% }%>

	</div>
<br>
	<div class="paging-area" align="center">

		<%if(currentPage != 1){ %>
		<button
			onclick="location.href='<%=contextPath %>/listpage.no?cpage=<%=currentPage-1%> '">
			◀</button>
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
			▶</button>
		<% }%>


	</div>
	


	  <div class="listbar" align="center">
		<div id="firdiv"><b>MENU</b></div>
		<div><a href="<%= contextPath %>/listpage.no?cpage=1"><b>공지사항</b></a></div>
		<div><a href="<%= contextPath %>/list.qa?qpage=1"><b>QNA</b></a></div>
		<div><a href="<%= contextPath %>/list.fq"><b>FAQ</b></a></div>
		<div><a href="<%= contextPath %>/list.bl?cpage=1"><b>블랙리스트</b></a></div>
      </div>
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
<%@ include file="../common/footerbar.jsp" %>
</body>
</html>