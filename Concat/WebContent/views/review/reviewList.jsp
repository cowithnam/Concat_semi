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
        height: 600px;
        margin-top: 30px;
    }


    .content>div{
        border: 1px solid red;
        width: 200px;
        height: 280px;
        display: inline-block;
        margin-left: 35px;
        margin-top: 5px;
        text-align: center;
    }

    div>img{
        width: 200px;
        height: 200px;
    }

    .listnumber{
        text-align: center;
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
	        <div class="EnrollForm" style="margin-bottom: 0px; width:100px; height:40px; border:0px; margin-top:0px; margin-right:10px;">
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
                   조회된 게시글이 없습니다.
                </div>
           	<% }else {%>
           		<% for(Review r : list){ %>
        		<div class="reviewlist">
        			<input type="hidden" name="num" value="<%= r.getReviewNo() %>">
        			<% if(r.getTitleImg() == null){ %>
        				<img src="#">
        			<%}else{ %>
             			<img src="<%= contextPath %>/<%= r.getTitleImg() %>">
             		<% } %>
                	<div>
                    	<%= r.getReviewTitle() %>
                    	<br>
                	</div>
	                <div style="float: right; margin-right:5px;">
	                    <%= r.getCreateDate() %>
	                    <br>
	                    평점 : <%= r.getScore() %>점
               	 	</div>
            	</div>
				<% } %>
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
		
        <div class="listnumber" style="margin-top: 60px;">
			<% if(currentPage != 1) { %>
            <button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= currentPage-1 %>'"> &lt; </button>
            <% } %>
            
            <% for(int p = startPage; p <= endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button disabled><%= p %></button>
            	<% }else { %>
            		<button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= p %>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) {%>
            <button onclick="location.href='<%= contextPath %>/list.re?cpage=<%= currentPage+1 %>'"> &gt; </button>
            <% } %>
        </div>
    </div>
    
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