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
         .minibar{    
            position: absolute;
            top: 580px;
            right: 9%;
        }

        #minibar{
            position: fixed;
            background-image: url(resources/image/minibar.png);
            background-repeat: no-repeat;
            background-size: 250px 2000px;
            width: 200px;
            height: 200px;
        }

        #minibar>a{
            font-size: 15px;
            color: white;
            text-decoration: none;
            font-weight: bolder;
            color: ivory;
        }

        #zzim{
            position: relative;
            top: 38px;
            left: 38px;
        }

        #sell-page{
            position: relative;
            top: 42px;
            left: 35px;
        }

        #minibar>a:hover{
            text-decoration: 2px underline;
            color: lightgray;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<br><br>
    
    <div id="outer">
        <h1>QNA</h1>
        
    
        <form action="" id="no-search">
            <input type="text"> 
            <button type="submit">검색</button>
        </form>
    
        <hr>
        
        <div align="center">
            <table class="area-no">
                <thead>
                    <tr>
                        <th class="num" width="15%">NO</th>
                        <th  width="60%">제목</th>
                        <th  width="15%">작성자</th>
                        <th  width="15%">작성일</th>
                    </tr>
                </thead>
               <tbody>
               
               <%if(list.isEmpty()){ %>
				<tr>
					<td colspan="4">존재하는 QNA 게시글이 없습니다.</td>
				</tr>
				<%}else{%>

				

				<% for(Qna q : list){ %>

				<tr>
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
        <%if(loginMember != null ){%>
        	   <div align="right">
        <button class="enroll-btn" onclick = "qnawrite()">작성하기 </button>

        </div>
       <% } %>
        
    </div>
    <div class="paging=area" align="center">
            	
            	<%if(currentPage != 1){ %>
                <button onclick="location.href='<%=contextPath %>/list.qa?qpage=<%=currentPage-1%> '"> &lt; </button>
                <% }%>
                
                <% for(int p = startPage; p<=endPage; p++){ %>
                	<%if(p == currentPage){ %>
                		<button disabled><%= p %></button>
                	<%}else {%>
                <button onclick="location.href='<%=contextPath%>/list.qa?qpage=<%=p%>'"><%= p %></button>
                	<%} %>
                <%} %>
                
                <%if(currentPage != maxPage){ %>
                <button onclick="location.href='<%=contextPath %>/list.qa?qpage=<%=currentPage+1%>'"> &gt; </button>
                <% }%>
               
                
            </div>
    
    
  	
             <div class="minibar">
    	<div id="minibar">
        	<a href="<%= contextPath %>/wishList.bo" id="zzim">QNA</a> <br>
            <a href="<%= contextPath %>/insert.bo" id="sell-page">FAQ</a> <br>
            <a href="<%= contextPath %>/insert.bo" id="sell-page">FAQ</a>
            
        </div>
    </div>
          

    </body>

    <script>
        function qnawrite(){
        	location.href="<%= contextPath%>/insert.qa"
        }
        
        $(function(){
            $(".area-no > tbody > tr").click(function(){
            	const num =$(this).children().eq(0).text();
              	
              location.href = '<%=contextPath %>/detail.qa?num='+num;
              
              })
             })

    </script>
   
    
</html>