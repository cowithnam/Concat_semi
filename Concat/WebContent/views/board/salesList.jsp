<%@page import="concat.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

  div{
    box-sizing: border-box;
  }

  .outer{
    width: 1000px;
    margin: auto;
  }

  #searchCate div{
    float: left;
  }

  .searchCate1{
    width: 130px;
    height: 215px;
    font-size: 20px;
    font-weight: bold;
    line-height: 220px;
    border-radius: 10px;
    background-color: black;
    color: white;
    margin-right: 20px;
  }

  .searchCate2{
    width: 150px;
    height: 95px;
    border: 1px solid lightgrey;
    margin-right: 15px;
    margin-bottom: 25px;
    border-radius: 10px;
  }

  .searchCate2>span{
    font-weight: bolder;
  }

  .searchCate-area{
    width: 850px;
    height: 215px;
    margin-bottom: 10px;
  }

  .searchCate-area>div:hover{
    cursor: pointer;
    opacity: 0.7;
  }

  #shop-search{
    width: 30px;
    height: 30px;
    background-image: url(resources/image/search.png);
    background-size: 22px 22px;
    background-repeat: no-repeat;
    background-position: center;
    border: 1px solid black;
    border-radius: 5px;
    background-color: white;
    vertical-align: middle;
  }

  .list-area{
        width: 1000px;
        margin: auto;
  }
    
  .thumbnail:hover{
  	cursor: pointer;
  	opacity: 0.7;
  }

  .thumbnail{
      border: 1px solid lightgray;
      width: 220px;
      height: 270px;
      padding-top: 7px;
      margin: 10px;
      display: inline-block;
      border-radius: 5px;
  }
    
</style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>	
  
  <div class="outer">
      <br>
      <h1>상품검색</h1>
      <hr>
      <div id="searchCate" style="height: 220px;">
        <div align="center" class="searchCate1">
          카테고리
        </div>
        <div class="searchCate-area" align="center">
            <div class="searchCate2">
              <img src="resources/image/coffee.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="10">
              <span>커피</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/pizza.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="20">
              <span>피자</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/burger.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="30">
              <span>햄버거</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/chicken.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="40">
              <span>치킨</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/bread.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="50">
              <span>베이커리</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/icecon.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="60">
              <span>아이스크림</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/giftcard.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="70">
              <span>상품권</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/discount.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="80">
              <span>할인권</span>
            </div>
            <div class="searchCate2">
              <img href="#"><img src="resources/image/musical.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="90">
              <span>뮤지컬</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/movie.png" style="margin-top: 4px;"><br>
              <input type="hidden" value="100">
              <span>영화</span>
            </div>
        </div>
      </div>

      <div class="list-area">
      	  <% if(!list.isEmpty()){ %>
	      	  <% for(Board b : list){ %>
		          <div class="thumbnail" align="center">
		          	<input type="hidden" value="<%=b.getBoardNo() %>">
		            <img src="<%= b.getThumbnail() %>" width="200" height="180" style="border-radius: 5px;"> 
		            <span style="font-size: 11px;">[<%= b.getBrand() %>]</span> <br>
		            <span style="font-size: 20px; font-weight: bolder;"><%=b.getBoardTitle() %></span> <br>
		            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;"><%= b.getPrice() %>원</span>
		          </div>
			  <% } %>
		   <% } %>
      </div>
  </div>

  <script>
    $(function(){
      $(document).on("click",".thumbnail",function(){
        location.href="<%=contextPath %>/detail.bo?bno="+$(this).children("input").val();
      });
    })
    
    $(function(){
    	$(".searchCate2").click(function(){
    		$.ajax({
    			url:"searchCategory.bo",
    			data:{cNo:$(this).children("input").val()},
    			success:function(list){
    				$(".list-area").html("");
    				let div = "";
    				if(!list.isEmpty){
	    				 for(var i=0; i<list.length; i++){
	    					 div += "<div class='thumbnail' align='center'><input type='hidden' value='"
	    						  +	list[i].boardNo + "'><img src='"
	    					      + list[i].thumbnail + "' width='200' height='180' style='border-radius: 5px;'>"
	    					      + " <span style='font-size: 11px;'>[" + list[i].brand + "]</span> <br>"
	    					      + "<span style='font-size: 20px; font-weight: bolder;'>"
	    					      + list[i].boardTitle + "</span> <br>"
	    					      + "<span style='font-size: 15px; font-weight: bold; margin-bottom: 20px;'>"
	    					      + list[i].price + "</span></div>"
	    			  	 } 
	    	    		 $(".list-area").html(div);
    				}
    				
    			},
    			error:function(){
    				console.log("오류입니다")
    			}
    		})
    	})
    })
  </script>
    
</body>
</html>