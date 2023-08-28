<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Concat</title>
<style>
  #content{
  	width: 1500px;
  	height: 600px;
  	margin: auto;
  	padding-left: 117px;
  }
  .list-area{
  	width: 1400px;
  	margin: auto;
    padding-left: 70px;
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
<body>
	<%@ include file="views/common/menubar.jsp" %>
	
	<br>
	<div id="content">
    	<div id="banner">
     		<span id="span1">Concat</span>
     		<span id="span2">사람과 사람 사이를 이어주다</span>
        </div>
        <div>
            <div class="new-title">
                <br>
                <h2 style="padding-left: 10px">최신 상품</h2>
                <hr>
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
    </div>
	
</body>
</html>