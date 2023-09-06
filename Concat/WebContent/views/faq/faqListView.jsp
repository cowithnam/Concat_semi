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
        <ul class="qna">
            <li><h3>거래/결재</h3>
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
                    <p>구매 : 카테고리 메뉴에서 상품 선택 후  판매자와 직접 컨텍 가능합니다</p>
                    <p>판매 : 화면 우측에 있는 판매하기를 통해 가능합니다 </p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-3">
                <label for="qna-3">상대방과 거래 도중 문제 발생시</label>
                <div>
                    <p>고객센터 > QNA or 블랙리스트 페이지</p>
                    <p>1:1 문의 또는 블랙리스트 신고페이지로 접수 부탁드립니다</p>
                    
                </div>
            </li>
            <li><h3>회원</h3>
                <input type="checkbox" id="qna-4">
                <label for="qna-4">내 판매내역 확인 방법</label>
                <div>
                    <p>로그인 후 우측 상단 > 마이페이지로 이동 후 판매 내역에 대해 확인할 수 있습니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-5">
                <label for="qna-5">회원탈퇴는 어떻게 하나요?</label>
                <div>
                    <p>로그인 후 우측 상단 > 마이페이지로 이동 후 내정보 화면 하단에서 회원탈퇴 가능합니다.</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-6">
                <label for="qna-6">아이디 비밀번호를 잊어 버렸어요</label>
                <div>
                    <p>아이디 찾기 : 로그인페이지에서 이름/핸드폰 번호로 찾기 가능합니다. </p>
                    <p>비밀번호 찾기 : 로그인페이지에서 아이디/이름/핸드폰 번호로 찾기 가능합니다.</p>
                    
                </div>
            </li>
            <li><h3>기타</h3>
                <input type="checkbox" id="qna-7">
                <label for="qna-7">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p>판매자가 판매 시 등록한 상품상세 화면에 안내되어 있으며</p>
                    <p>상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>> 상품 상세 페이지 > 구매하기 버튼 클릭 > 상대방 카카오톡 아이디</p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-8">
                <label for="qna-8">등급은 어떻게 측정되나요?</label>
                <div>
                    <p>구매한 상품에 대해 리뷰작성 가능하며</p>
                    <p>리뷰 작성시 판매자에게 평점을 부여 할 수 있습니다</p>
                    <p>평점은 누적 계산되어 등급이 결정됩니다. </p>
                        <p>B : 0~29</p>
                        <p>S : 30~99</p>
                        <p>G : 100~199</p>
                        <p>D : 200~ </p>
                </div>
            </li>
            <li>
                <input type="checkbox" id="qna-9">
                <label for="qna-9">블랙리스트 기준이 어떻게 되나요?</label>
                <div>
                    <p>사이트 이용제한</p>
                    <p>상대방에게 불편함을 주는 언행 또는 욕설 시 2회 경고 후 영구정지</p>
                    <p>거래 사기 즉시제한(블랙리스트 신고 접수)</p>
                    <p></p>
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
</body>
</html>
  