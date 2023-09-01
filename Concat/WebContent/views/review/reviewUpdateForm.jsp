<%@page import="concat.image.model.vo.Image"%>
<%@page import="concat.review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Review r = (Review)request.getAttribute("r");
	Image i = (Image)request.getAttribute("image");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width: 1000px;
        box-sizing: border-box;
        margin: auto;
    }

    img{
        width: 550px;
        height: 500px;
    }

    .profile{
        width: 550px;
        padding: 20px;
        box-sizing: border-box;
        background-color: black;
        color: white;
        border-radius: 10px;
    }

    .information{
        text-align: left;
    }

    .information>div{
        float: left;
    }

    .point{
        text-align: right;
    }

    .content{
        width: 550px;
        text-align: left;
    }

    .review-recontent{
        border-top: 1px solid lightgray;
    }

    .review{
        width: 550px;
        height: 150px;
        border-bottom: 1px solid lightgray;
    }

    .review-user{
        width: 550px;
        height: 50px;
    }

    .review-user>div{
        height: 100%;
        float: left;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="wrap" align="center">
		<form action="<%= contextPath %>/update.re" method="post" enctype="multipart/form-data">
        <div class="img">
        	<% if(i != null) { %>
                <!-- 현재 이 게시글에 딸린 첨부파일이 있을 경우-->
                <%= i.getOriginName() %>
                <input type="hidden" name="originFileNo" value="<%= i.getFileNo() %>">
            <% } %>
        
        	<img src="<%= contextPath %>/<%= i.getFilePath() %>">
        	<input type="file" name="file">
        </div>
        
        <div class="profile">
            <div class="information">
                <div style="width: 30px;">
                    <img src="프로필" style="width: 20px; height: 20px;">            
                </div>
                <div>
                	<input type="hidden" name="rNo" value="<%= r.getReviewNo() %>">
                    <h3 style="margin: 0px;"><%= r.getMemNo() %></h3>
                </div>
            </div>
            <div class="point">
                <h4 style="margin: 0px;"><%= r.getScore() %> 점</h4>
            </div>
        </div>

        <div class="content">
            <div class="review-title">
            	<input type="text" name="title" value="<%= r.getReviewTitle() %>" required>
                
            </div>
            <div class="review-content" style="padding-left: 10px;">
            	<textarea name=content cols="100" rows="5" required><%= r.getReviewContent() %></textarea>
            </div>

            <div align="right">
                <h5><%= r.getCount() %>회</h5>
            </div>
            
            <div class="review-recontent">
                <h3>댓글 4</h3>
                <div class="review">
                    <div class="review-user">
                        <div style="width: 30px;">
                            <img src="../../icons8-사용자-30.png" style="width: 20px; height: 20px;">            
                        </div>
                        <div>
                            <h4 style="margin: 0px;">사용자1</h4>
                        </div>
                    </div>

                    <div style="padding-left: 15px; width: 550px;" >
                        후기잘봤습니다
                    </div>
                </div>
            </div>
            
            <div align="center">
                <button type="submit">수정</button>
                <button type="reset">취소하기</button>
                <button type="button" onclick="history.back();">뒤로가기</button>
            </div>
        </div>
        </form>
    </div>
</body>
</html>