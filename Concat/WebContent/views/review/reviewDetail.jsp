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

        <div class="img">
        	<img src="<%= contextPath %>/<%= i.getFilePath() %>">
        </div>
        
        <div class="profile">
            <div class="information">
                <div style="width: 30px;">
                    <img src="" style="width: 20px; height: 20px;">            
                </div>
                <div>
                    <h3 style="margin: 0px;"><%= r.getMemId() %></h3>
                </div>
            </div>
            <div class="point">
                <h4 style="margin: 0px;"><%= r.getScore() %> 점</h4>
            </div>
        </div>

        <div class="content">
            <div class="review-title">
                <h3><%= r.getReviewTitle() %></h3>
            </div>
            <div class="review-content" style="padding-left: 10px;">
                <p><%= r.getReviewContent() %></p>
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
        </div>
    </div>
</body>
</html>