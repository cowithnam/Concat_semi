<%@page import="concat.common.vo.PageInfo"%>
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
        #outer{
            width: 1100px;
            height: 600px;
            margin: auto;
        }	
        
        h1{display: inline;}
        #no-search{
            float: right;
            position: relative;
            top: 20px;
        }

        #no-search>input{width: 200px; height: 20px; position: relative; bottom: 2px;} 

        #no-search>button{height: 26px; background-color: black; color: white; font-weight: bold;}

        table{
            width: 1100px;
            height: 500px;
        }

        table *{text-align: center; padding: 0px;}

        thead{background-color: black; color: white;}

        .num{width: 110px; height: 41px;}
        
        .title{width: 660px; height: 41px; text-align: left; padding-left: 10px;}

        table td{width: 140px; height: 41px; border: 1px solid black;}
        
         .enroll-btn{
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
        #custom-menu{
            position: fixed;
            left: -5px;
            top: 400px;

        }
        #custom-menu>div{
            border: 1px solid black;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<br><br>
    
    <div id="outer">
        <h1>공지사항</h1>
        
    
        <form action="" id="no-search">
            <input type="text"> 
            <button type="submit">검색</button>
        </form>
    
        <hr>
        <div id="custom-menu">
            <ul>
                <li><a href="">공지사항</a></li>
                <li><a href="">QnA</a></li>
                <li><a href="">FAQ</a></li>
                <li><a href="<%= contextPath %>//list.bl?cpage=1">블랙리스트</a></li>
            </ul>
        </div>
        <div align="center">
            <table class="area-no">
                <thead>
                    <tr>
                        <th class="num" width="100">NO</th>
                        <th  width="500">제목</th>
                        <th  width="160">작성일</th>
                        <th  width="50">조회수</th>
                    </tr>
                </thead>
               <tbody>
				
				<!-- case1. 공지글이 없을 경우-->

				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="4">존재하는 공지사항이 없습니다.</td>
				</tr>
				<%}else{%>

				<!--case.2 공지글이 있는 경우  -->

				<% for(Notice n : list){ %>

				<tr>
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
        <button class="enroll-btn" onclick = "Listwrite()">작성하기 </button>

        </div>
        <% }%>
        
    </div>
    
  	<div class="paging=area" align="center">
            	
            	<%if(currentPage != 1){ %>
                <button onclick="location.href='<%=contextPath %>/listpage.no?cpage=<%=currentPage-1%> '"> &lt; </button>
                <% }%>
                
                <% for(int p = startPage; p<=endPage; p++){ %>
                	<%if(p == currentPage){ %>
                		<button disabled><%= p %></button>
                	<%}else {%>
                <button onclick="location.href='<%=contextPath%>/listpage.no?cpage=<%=p%>'"><%= p %></button>
                	<%} %>
                <%} %>
                
                <%if(currentPage != maxPage){ %>
                <button onclick="location.href='<%=contextPath %>/listpage.no?cpage=<%=currentPage+1%>'"> &gt; </button>
                <% }%>
            </div>
    </body>
    <script>
   //공지사항 작성하기    
    function Listwrite(){
            location.href = "<%=contextPath%>/insertpage.no?cpage=1"
        }
        
   //공지사항 글번호 
    $(function(){
      $(".area-no > tbody > tr").click(function(){
      	const num =$(this).children().eq(0).text();
        	
        location.href = '<%=contextPath %>/detail.no?num='+num;
        
        })
       })
   
    </script>
    
</html>