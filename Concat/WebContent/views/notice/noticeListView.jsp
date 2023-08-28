<%@page import="concat.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <style>
        #outer{
            width: 1100px;
            height: 800px;
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
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div id="outer">
        <h1>공지사항</h1>
    
        <form action="" id="no-search">
            <input type="text"> 
            <button type="submit">검색</button>
        </form>
    
        <hr>
       	
        <div align="center">
            <table>
                <thead>
                    <tr>
                        <th class="num">NO</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
               <tbody>
				
				<!-- case1. 공지글이 없을 경우-->

				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="5">존재하는 공지사항이 없습니다.</td>
				</tr>
				<%}else{%>

				<!--case.2 공지글이 있는 경우  -->

				<% for(Notice n : list){ %>

				<tr>
					<td><%=n.getNoticeNo() %></td>
					<td><%=n.getNoticeTitle() %></td>
					<td><%=n.getCreateDate() %></td>
					<td><%=n.getCount() %></td>
					
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

    </body>
    <script>
        function Listwrite(){
            location.href = "<%=contextPath%>/insertpage.no"
        }
    </script>
</html>