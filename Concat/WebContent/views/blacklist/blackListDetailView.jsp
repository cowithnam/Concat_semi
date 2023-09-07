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
        border: 1px solid lightgray;
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
        font-size: 13px;
    }

    #content{
        width: 900px;
        border-top: 1px solid lightgrey;
        padding: 25px;
    }

    .btn>button{
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
    
    .img{
    	width: 400px;
    	height: 400px;
    }

    textarea:focus{
        outline: none;
    }
    
    #content>p{
    	font-size: 18px;
    	font-weight: 900;
    }
    .content{
    	font-size: 15px;
    	font-weight: 500;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">

        <h1>블랙리스트 상세정보</h1> 
        
        <hr>
        
        <form id="title" action="<%= contextPath %>/updateform.bl?blno=<%= b.getBlNo() %>" method="post" enctype="multipart/form-data">
            <div id="head">
                <h3><%= b.getBlTitle() %></h3>
            </div>
            <div id="head2" align="right">
                <p style="font-size: larger; margin-top: 0px;">
                작성자 : <%= b.getBlWriter() %> <br>
                조회수 : <%= b.getCount() %> | 작성일 : <%= b.getBlDate() %>
                </p>
            </div>
            <br><br><br>
            <div id="content">
                <p>
                	▶ 신고 대상 : <%= b.getBlackId() %>
                	<br><br>
                	▶ 신고 내용 : <br><br>
                    <textarea class="content" cols="70" rows="10" style="border: 0px; resize: none;" readonly><%= b.getBlContent() %></textarea>
                    <br>
                    <% if(image == null) { %>
                        <!-- case1. 첨부파일이 없을 경우 -->
                        첨부파일이 없습니다.
                       <% }else { %>
                        <!-- case2. 첨부파일이 있을 경우 -->
                       <img class="img" src="<%= contextPath %>/<%= image.getFilePath() %>/<%= image.getUpdateName() %>" width="250" height="250">
                   <% } %>
                </p>
            </div>

            <div align="center">
            
            <div class="btn">
	            <% if(loginMember != null && b.getBlWriter().equals(loginMember.getMemId())) {%>
	            <!-- 로그인한 사람이 당사자일 경우 -->
	                <button type="submit">수정하기</button>
	                <button type="button" id="delete">삭제하기</button>
	            <% } %>
				    <button type="button" onclick="location.href='<%=contextPath %>/list.bl?cpage=1'">뒤로가기</button>   
            </div>
            <br>
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
<%@ include file="../common/footerbar.jsp" %>
</body>
</html>