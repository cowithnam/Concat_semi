<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>

#outer{
            width: 1100px;
            height: 600px;
            margin: auto;
        }	
        
        h1{display: inline;}
        #no-search{
            float: right;
            position: relative;
            top: 20px;
        }

           .layout{
    max-width: 1000px;
    margin: 0 auto;
}

.qna{
    list-style: none;
    margin: 0;
    padding: 0;
}
.qna > li{
  padding: 10px 0;
  box-sizing: border-box;
}
.qna > li:nth-child(n+2){ 
  border-top: 1px dashed lightgray;
}
.qna input {
  display: none;
}
.qna label { 
  font-weight: bold;
  color: #000;
  margin: 20px 0 0;
  cursor: pointer;
}
.qna label::before { 
  content: "▶";
  display: block;
  color: black;
  margin-right: 8px;
  float: left;
}
.qna input:checked + label::before { 
  content: "▼";
}

.qna div { 
  display: none;
  color: #666;
  font-size: 0.9375em;
  overflow: hidden;
  padding: 10px 0 10px 30px;
  box-sizing: border-box;
  transition: max-height 0.4s;
}
.qna input:checked + label + div { 
  display: block;
}

.listbar {
  width: 150px;
  height: 220px;
  border: 1px solid black;
  position: fixed;
  top: 400px; 
  left: 150px;
  text-align: center;
  background-color: white; 
}

.listbar>div {
	color: white;
	width: 100%;
	height: 48px;
	background-color: black;
	text-align: center;
	line-height: 44px;
	
}
#firdiv{
	background-color: white;
	color: black;
	width: 100%;
	height: 28px;
	text-align: center;
	line-height: 28px;
}
.listbar a{
	text-decoration: none;
	color:white;
}


.listbar a:hover {
	text-decoration: 1px underline;
	color:white;
}
           
</style>
</head>

<body>
<%@ include file="../common/menubar.jsp" %>

            <br><br>

  <div id="outer">
                <h1>FAQ</h1>
                <hr>
    <div class="layout">
        <ul class="qna"><h3>거래/결재</h3>
            <li>
                <input type="checkbox" id="qna-1">
                <label for="qna-1">사이트에서 결재는 불가능한가요? </label>
                <div>
                    <p>현재 저희 사이트에서는 결재기능은 제공하고 있지 않습니다</p>
                    <p>추후 업데이트를 통해 개선하도록 하겠습니다</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-2">
                <label for="qna-2">거래는 어떻게 진행되나요?</label>
                <div>
                    <p>상품 선택 후 OOO버튼을 통해 판매자와 직접 컨텍 후 가능합니다</p>
                    <p>주문 진행 상태가 '환불진행중' 또는 '환불완료' 에서는 환불계좌를 변경할 수 없습니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">반품 신청을 철회하고 싶어요.</label>
                <div>
                    <p>반품할 상품을 아직 보내지 않은 경우, 마이페이지에서 반품철회를 하실 수 있습니다.</p>
                    <p>반품철회 후 택배사에서 상품 수거가 된 것으로 확인될 경우 해당 주문은 반품처리한 것으로 재 변경됩니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">배송된 상품이 부재중으로 반송된 경우 어떻게 하나요?</label>
                <div>
                    <p>부재 등의 사유로 반송된 상품은 "마이페이지 > 주문 조회"]"에서 택배사 영업소, 또는 배송 담당 택배원 연락처를 통해 재배송 요청을 할 수 있습니다. 상품이 이미 반송되어 해당 업체로 입고된 경우, 왕복 배송비를 추가 부담하셔야 합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-5">
                <label for="qna-5">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                    <p>2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-6">
                <label for="qna-6">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                    <p>2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-7">
                <label for="qna-7">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                    <p>2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-8">
                <label for="qna-8">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                    <p>2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-9">
                <label for="qna-9">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>1. "마이페이지 > 주문내역에서 상품 선택 > 배송/교환/반품 안내"에 표기된 판매자 연락처로 문의</p>
                    <p>2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                </div>
            </li>
        </ul>
    </div>
  </div>
  <div class="listbar" align="center">
		<div id="firdiv"><b>MENU</b></div>
		<div><a href="<%= contextPath %>/listpage.no?cpage=1"><b>공지사항</b></a></div>
		<div><a href="<%= contextPath %>/list.qa?qpage=1"><b>QNA</b></a></div>
		<div><a href="<%= contextPath %>/list.fq"><b>FAQ</b></a></div>
		<div><a href="<%= contextPath %>/list.bl?cpage=1"><b>블랙리스트</b></a></div>
  </div>
	    <%@ include file="../common/footerbar.jsp" %>
</body>
</html>