<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .area2>button{
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
  </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<br><br><br>
  <div class="outer">
      <div class="area1">
        <img src="#" width="500" height="480" style="border: 1px solid black; border-radius: 20px;">
      </div>
      <div class="area2" style="padding-left: 40px; padding-right: 20px;">
          <h1 style="margin-top: 30px;">상품명</h1>
          <h3 style="margin-top: 30px;">브랜드명</h3>
          <h3 style="margin-top: 30px;">가격</h3>
          <h4 style="margin: 30px 0px 30px; ">판매자 아이디</h4>
          <h4>유효기간</h4>
          <hr>
          <button style="width: 60px; height: 60px; font-size: 32px; background-color: white; color: gray;">♥</button>
          <button type="button" style="width: 360px; height: 60px; ">구매하기</button>
          <a href="https://ecrm.police.go.kr/sci/pcc_V3_send" style="font-size: 16px;" >신고 여부 확인</a>
          <hr>
      </div>
      
      <div class="area3">
        <br>
        <h3>상품정보</h3>
        <hr style="margin-bottom: 15px;">

          <div class="content-area">

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

</body>
</html>