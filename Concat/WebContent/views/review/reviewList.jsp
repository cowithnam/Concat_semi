<%@page import="concat.image.model.vo.Image"%>
<%@page import="concat.review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="concat.common.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        margin: auto;
        width: 1000px;
    }

    .head{
        height: 50px;
    }

    .content{
        margin-top: 30px;
    }


    .content>div{
        border: 1px solid lightgray;
        padding-top: 7px;
        width: 225px;
        height: 320px;
        display: inline-block;
        margin: 10px;
        text-align: center;
        border-radius: 5px;
    }

    .reviewlist:hover{
        cursor: pointer;
        opacity: 0.7;
    }


    div>img{
        width: 200px;
        height: 200px;
    }

    .listnumber{
        text-align: center;
    }
    .listnumber>button{
    	width: 30px;
    	height: 30px;
    	background-color: black;
    	color: white;
    	font-size: 14px;
    }
    
    .EnrollForm{
        float: right;
        width: 100px;
        height: 20px;
        border: 0px;
    }
    
    .EnrollForm>button{
        font-weight: 900;
    }
    
    a{
    	text-decoration: none;
    	color: black;
    }
    
    a:hover{
    	color: lightgray;
    	cursor: pointer;
    }
    
    button{
    	cursor: pointer;
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

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="wrap">
        <div class="head">
            <h1 style="margin-left: 40px; margin-top: 30px;">리뷰</h1>
        </div>
        
        <div style="float: right;">
           <a onclick="location.href='<%= contextPath %>/list.re?cpage=1';">최신순</a> |
           <a onclick="count();">인기순</a> |
           <a onclick="score();">평점순</a>
        </div> 
        <br>
        <hr>
        <div class="content">
            
		<% if(loginMember != null) { %>
        <!-- 로그인한 회원만 보이기-->
	        <div class="EnrollForm btn" style="margin-bottom: 0px; width:100px; height:40px; border:0px; margin-top:0px; margin-right:10px;">
	            <button style="background-color: black; color: white; width:100px; height:40px;" id="EnrollForm">작성하기</button>
	        </div>	      
        <% } %>
            <br><br><br>
            
             <script>
             	$(function(){
             		$("#EnrollForm").click(function(){
             			location.href="<%= contextPath %>/insertForm.re";
             		})
             	})
             </script>
            
           	<% if(list.isEmpty()){ %>
	            <div>
                   조회된 후기가 없습니다.
                </div>
           	<% }else {%>
           		<% for(Review r : list){ %>
        		<div class="reviewlist">
        			<input type="hidden" name="num" value="<%= r.getReviewNo() %>">
        			<% if(r.getTitleImg() == null){ %>
        				<img src="#">
        			<%}else{ %>
             			<img src="<%= contextPath %>/<%= r.getTitleImg() %>" width="200" height="180" style="border-radius: 5px;">
             		<% } %>
                	<div style="margin-top: 5px">
                    	<span style="font-size: 18px; font-weight: bolder;"><%= r.getReviewTitle() %></span> <br>
                	</div>
	                <div style="float: right; margin-right:5px; margin-top: 5px">
	                    <span style="font-size: 14px; font-weight: bold;">평점 : <%= r.getScore() %>점</span>
	                    <br>
	                    <span style="font-size: 14px; font-weight: bold;">조회수 : <%= r.getCount() %></span>
	                    <br>
	                    <span style="font-size: 14px; font-weight: bold;"><%= r.getCreateDate() %></span>
               	 	</div>
            	</div>
				<% } %>
			<% } %>
        </div>
    </div>

        <div class="listnumber" style="margin-top: 30px;">
			<% if(currentPage != 1) { %>
            <button style="font-size: 12px;" onclick="location.href='<%= contextPath %>/list.re?cpage=<%= currentPage-1 %>'"> ◀ </button>
            <% } %>
            
            <% for(int p = startPage; p <= endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button disabled><%= p %></button>
            	<% }else { %>
            		<button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= p %>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) {%>
            <button style="font-size: 12px;" onclick="location.href='<%= contextPath %>/list.re?cpage=<%= currentPage+1 %>'"> ▶ </button>
            <% } %>
        </div>
	  
	<script>
		$(function(){
			$(".reviewlist").click(function(){
				const num = $(this).children().eq(0).val();
				location.href = '<%= contextPath %>/listDetail.re?num='+num;
			})
		})
	</script>
    
    <script>
    	function count(){
    		location.href="<%= contextPath %>/listCount.re?cpage=1";
    	}
    	
		function score(){
			location.href="<%= contextPath %>/listScore.re?cpage=1";
    	}
    </script>
</body>
</html>