<%@page import="concat.image.model.vo.Image"%>
<%@page import="concat.member.model.vo.Member"%>
<%@page import="concat.blacklist.model.vo.BlackList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BlackList b = (BlackList)request.getAttribute("b");
	Image image = (Image)request.getAttribute("image");
    Member m = new Member();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width: 1000px;
        height: 600px;
        box-sizing: border-box;
        margin: auto;
    }

    hr{
        margin-bottom: 40px;
    }

    h3{height: 29px;}

    #head{display: block; 
        width: 40%; 
        float: left;
    }
    #head2{
        display: block; 
        width: 50%; 
        float: left;
        font-size: 12px;
    }

    #content{
        width: 900px;
        border-top: 1px solid lightgrey;
        border-bottom: 1px solid lightgray;
        padding: 25px;
    }

    #title button{
        width: 140px;
        height: 50px;
        font-size: 23px;
        font-weight: bold;
        border-radius: 5px;
        background-color: black;
        color: white;
        margin-top: 25px;
    }
    
    img{
    	width: 200px;
    	height: 200px;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">
        <h1>블랙리스트</h1> 
        <hr>
        <form id="title" action="<%= contextPath %>/updateform.bl?blno=<%= b.getBlNo() %>" method="post" enctype="multipart/form-data">
            <div id="head">
                <h3><%= b.getBlTitle() %></h3>
            </div>
            <div id="head2" align="right" style="padding-top: 30px;">
                작성자 : <%= b.getBlWriter() %> 
                조회수 : <%= b.getCount() %>
            </div>
            <br><br><br>
            <div id="content">
            	<!-- 사진추가? -->
                <p>
                	신고 대상 : <%= b.getBlackId() %>
                	<br><br>
                	신고 내용 : <%= b.getBlContent() %>
                </p>
            </div>
            
			<div>
				<% if(image == null) { %>
	                 <!-- case1. 첨부파일이 없을 경우 -->
	                 첨부파일이 없습니다.
					<% }else { %>
	                 <!-- case2. 첨부파일이 있을 경우 -->
	                 <div>
	                 	<img src="<%= contextPath %>/<%= image.getFilePath() %>/<%= image.getUpdateName() %>" width="500" height="300">
	                 </div>
	                 <a download="<%= image.getOriginName() %>" href="<%= contextPath %>/<%= image.getFilePath() %>/<%= image.getUpdateName() %>"><%= image.getOriginName() %></a>
				<% } %>
       	    </div>
            
            <div align="center">
            
            <% if(loginMember != null && b.getBlWriter().equals(loginMember.getMemId())) {%>
            <!-- 로그인한 사람이 당사자일 경우 -->
                <button type="submit">수정</button>
                <button type="button" id="delete">삭제</button>
            <% } %>
			    <button type="button" onclick="history.back();">뒤로가기</button>   
            </div>
        </form>
    </div>
        <script>
        	$(function(){
        		$("#delete").click(function(){
	        		location.href='<%= contextPath %>/delete.bl?num=<%= b.getBlNo() %>'
        		})
        	})
        </script>		
</body>
</html>