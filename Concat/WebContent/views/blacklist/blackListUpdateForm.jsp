<%@page import="concat.image.model.vo.Image"%>
<%@page import="concat.blacklist.model.vo.BlackList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BlackList bl = (BlackList)request.getAttribute("bl");
	Image image = (Image)request.getAttribute("image");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>blacklist Update Form</title>
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
    
    textarea{
    	text-align: left;
    }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
        <h1>블랙리스트</h1> 
        <hr>
        <form id="title" action="<%= contextPath %>/update.bl" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="blNO" value="<%=bl.getBlNo() %>">
            <div id="head">
	            제	목 : 
                <input type="text" name="title" value="<%= bl.getBlTitle() %>" style="width=100px; height=10px;">
            </div>
            
            <div id="head2" align="right" style="padding-top: 30px;">
                작성자 : <%= bl.getBlWriter() %> 
                조회수 : <%= bl.getCount() %>
            </div>
            <br><br><br>
            <div id="content">
            	신고 대상 : <input type="text" name="blackId" value="<%= bl.getBlackId() %>" required>
            	<br><br>
            	
            	내 용
            	<br><br>
                <textarea name="content" cols="100" rows="10" style="resize: none"><%= bl.getBlContent() %></textarea> 
                <br><br>
	            <div>
                    <% if(image != null) { %>
	                     <!-- 현재 이 게시글에 딸린 첨부파일이 있을 경우-->
	                     <%= image.getOriginName() %>
	                     <input type="hidden" name="originFileNo" value="<%= image.getFileNo() %>">
                    <% } %>
                      
                      <input type="file" name="file">
	       	    </div>
            </div>
            <div align="center">
                <button type="submit">수정</button>
                <button type="reset">취소하기</button>
                <button type="button" onclick="history.back();">뒤로가기</button>
            </div>
        </form>
        
    </div>
</body>
</html>