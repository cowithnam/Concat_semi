<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <span>커피</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/pizza.png" style="margin-top: 4px;"><br>
              <span>피자</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/burger.png" style="margin-top: 4px;"><br>
              <span>햄버거</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/chicken.png" style="margin-top: 4px;"><br>
              <span>치킨</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/bread.png" style="margin-top: 4px;"><br>
              <span>베이커리</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/icecon.png" style="margin-top: 4px;"><br>
              <span>아이스크림</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/pizza.png" style="margin-top: 4px;"><br>
              <span>커피</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/pizza.png" style="margin-top: 4px;"><br>
              <span>커피</span>
            </div>
            <div class="searchCate2">
              <img href="#"><img src="resources/image/pizza.png" style="margin-top: 4px;"><br>
              <span>커피</span>
            </div>
            <div class="searchCate2">
              <img src="resources/image/pizza.png" style="margin-top: 4px;"><br>
              <span>커피</span>
            </div>
        </div>
      </div>

      <div class="shop-search" align="right" style="width: 970px; margin-bottom: 20px; margin-top: 20px;">
          <div>
            <input type="text" style="height: 26px; border-radius: 5px; border: 1px solid black;">
            <button id="shop-search" style="position: relative; right: 4px;"></button>
          </div>
      </div>

      <div class="list-area">
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
          <div class="thumbnail" align="center">
            <img src="#" width="200" height="180" style="border-radius: 5px;"> 
            <span style="font-size: 11px;">[브랜드명]</span> <br>
            <span style="font-size: 20px; font-weight: bolder;">상품명</span> <br>
            <span style="font-size: 15px; font-weight: bold; margin-bottom: 20px;">가격</span>
          </div>
      </div>

  </div>
    
</body>
</html>