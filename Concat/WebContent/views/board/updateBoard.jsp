<%@page import="concat.wish.model.vo.Wish"%>
<%@page import="concat.image.model.vo.Image"%>
<%@page import="concat.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("b");
	Image img = (Image)request.getAttribute("i");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    .outer{
      width: 1000px;
      height: 800px;
      margin: auto;
    }

    .outer>div{
      box-sizing: border-box;
      float: left;
    }

    .area1{
      width: 50%;
      height: 60%;
    }
    .area2{
      width: 50%;
      height: 60%;
    }

    .area2>button:not(#noneWish,#wantWish){
      background-color: black;
      color: white;
      font-size: 25px;
      font-weight: bolder;  
      border-radius: 10px;
      margin: 30px 0px 20px;
    }

    .area2>button:hover{
      cursor: pointer;
    }

    .area3{
      width: 100%;
      height: 40%;
      padding: 25px;
    }

    .area3>div{
      float: left;
    }

    .content-area{
      width: 700px;
      height: 180px;
    }

    .content-caution{
      width: 240px;
      height: 180px;
    }
    
 
    
    .wish{
    	width: 60px;
    	height: 60px;
    	font-size: 32px;
    	font-weight: bolder;  
    	border-radius: 10px;
    	margin: 30px 0px 20px;
    	background-color: white;
    	color: gray;
    }
    
    .wantWish{
    	background-color: white;
    	color: red;
    }
    
    .modal{
    	width: 460px;
    	height: 300px;
    	background: white;
      color: black;
    	display:none;
    	position:absolute;
    	top:300px;
    	left:980px;
      border-radius: 15px;
    }
    
    .btn{
    	position: relative;
      left: 408px;
      bottom: 780px;     	
    }
    
    .btn *:hover{
    	cursor: pointer;
    }
    .btn button{
      width: 35px;
      height: 70px;
      margin-bottom: 5px;
      background-color: white;
      border: 1px solid lightgray;
      border-top-left-radius: 10px;
      border-bottom-left-radius: 10px;
      font-size: 15px;
      font-weight: bold;
    }
  </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<br><br><br>
  <form action="<%=contextPath %>/salesUpdate.bo">
  <div class="outer">
      <div class="area1">
      	<% if(img != null){ %>
        	<img src="<%= img.getFilePath()+"/"+img.getUpdateName() %>" width="500" height="480" style="border: 1px solid black; border-radius: 20px;">
        <% } %>
      </div>
      <div class="area2" style="padding-left: 40px; padding-right: 20px;">
        <input type="hidden" name="bno" value="<%= b.getBoardNo()%>">
        <h1 style="margin-top: 30px;"><%=b.getBoardTitle() %></h1>
        <h3 style="margin-top: 30px;"><%=b.getBrand() %></h3>
        <h3 style="margin-top: 30px;"><input name="price" value="<%=b.getPrice() %>">원</h3>
        <h4 style="margin: 30px 0px 30px; ">판매자 : <% if(b.getNickName() != null){ %>
          									  		<%= b.getNickName() %>
          									  <% }else{ %>
          									  		<%= b.getMemNo() %>
          									  <% } %></h4>
          <h4>유효기간 : <%=b.getDueDate() %></h4>
          <hr>
      </div>
      
      <div class="area3">
        <br>
        <h3>상품정보</h3>
        <hr style="margin-bottom: 15px;">

          <div class="content-area" style="padding-left: 10px; font-size: 18px;">
            <textarea name="content" cols="90" rows="10" style="resize: none;"><%=b.getBoardContent() %></textarea>
          </div>
          <div class="content-caution" align="center">
            <h4 style="margin-top: 10px;"><img src="resources/image/about.png" width="25" height="25" style="position: relative; top: 5px;"> 거래 주의 사항</h4>
            <span style="font-size: 14px;">
              콘캣마켓은 상품 판매와<br> 
              직접적인 관련이 없으며,<br>
              모든 상거래의 책임은<br>
              구매자와 판매자에게<br>
              있습니다
            </span>
          </div>
      </div>
  </div>
  <div class="btn">
		<div>
			<button>수정</button>
		</div>
		<div>
			<button type="button" onclick="history.back()">취소</button>
		</div>
	</div>
  </form>
  
</body>
</html>