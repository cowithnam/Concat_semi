<%@page import="concat.common.vo.PageInfo"%>
<%@page import="concat.blacklist.model.vo.BlackList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<BlackList> list = (ArrayList<BlackList>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Black List View</title>
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
        height: 20px;
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<br>
	<div id="outer">
        <h1>블랙리스트</h1>
        
        <form action="<%= contextPath %>/search.bl?cpage=1" id="bl-saerch">
            <input type="text" name="searchkey" value> 
            <button type="submit">검색</button>
        </form>
        <br><br>
		<% if(loginMember != null) { %>
        <!-- 로그인한 회원만 보이기-->
        <div class="EnrollForm" style="margin-bottom: 10px;">
            <button style="background-color: black; color: white;" id="EnrollForm">작성하기</button>
        </div>	      
        <% } %>
        <br>
        
        <div align="center" class="list">
            <table style='max-height:130px'>
                <thead>
                    <tr>
                        <th class="num">NO</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
	                <!-- case1. 공지글이 없을 경우 -->
	               	<% if(list.isEmpty()) { %>
		               	<tr>
		                	<td colspan="5">존재하는 공지사항이 없습니다.</td>
		           	    </tr>
	                <% } else { %>
		             	 <!-- case2. 공지글이 있을 경우-->
		                <% for(BlackList b : list) { %>
		                    <tr class="listtr">
		                        <td class="num"><%= b.getBlNo() %></td>
		                        <td class="title"><%= b.getBlTitle() %></td>
		                        <td><%= b.getBlWriter() %></td>
		                        <td><%= b.getBlDate() %></td>
		                        <td><%= b.getCount() %></td>
		                    </tr>
						<% } %>
	                <% } %>                
					                              	
                    <!-- 공지글 작성하기버튼 누를시 -->
                    <script>
                    	$(function(){
                    		$("#EnrollForm").click(function(){
                    			location.href="<%= contextPath %>/EnrollForm.bl";
                    		})
                    	})
                    </script>
                    
                    <!-- 블랙리스트 상세보기 -->
                     <script>
				    	$(function(){
				    		$(".listtr").click(function(){
				    			const num = $(this).children().eq(0).text();
								location.href = '<%= contextPath %>/DetailView.bl?num='+num;
				    		})
				    	})
				    </script>
				    
                </tbody>
            </table>
        </div>
    </div>

		<!-- 페이징 바 -->
        <div class="btn" style="text-align: center;">
			<% if(currentPage != 1) { %>
            <button onclick="location.href='<%= contextPath %>/list.bl?cpage=<%= currentPage-1 %>'"> &lt; </button>
            <% } %>
            
            <% for(int p = startPage; p <= endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button disabled><%= p %></button>
            	<% }else { %>
            		<button onclick="location.href='<%= contextPath %>/list.bl?cpage=<%= p %>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) {%>
            <button onclick="location.href='<%= contextPath %>/list.bl?cpage=<%= currentPage+1 %>'"> &gt; </button>
            <% } %>
        </div>	
</body>
</html>