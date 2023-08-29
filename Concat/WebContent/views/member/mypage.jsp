<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        .wrap{
            box-sizing: border-box;
            border: 1px solid black;
            background-color: black;
            color: white;
            border-radius: 30px ;
            width: 1000px;
            height: 650px;
            margin: auto;
            margin-top: 100px;
        }   
        #header_1{
            margin: auto;
            height: 100px;
        }
        #header_2{
            float:right;
            margin:auto;
            width: 530px;
            margin-top: 8px;
        }
        #navi{
            /* border: 1px solid white; */
            box-sizing: border-box;
            width: 300px;
            margin-left: 30px;
        }
        #main{
            /* border: 1px solid white; */
            box-sizing: border-box;
            width: 400px;
        }
        .cont{
            float: left;
        }
        a{
            text-decoration: none;
            color: white;
        }
        input{
            border-radius: 5px;
        }
        .sujung{
        	background-color: black;
            color: white;
            border-radius: 10px;
            width: 100px;
            height: 50px;
        }
        .chenge{
        	background-color: blue;
            color: white;
            border-radius: 10px;
            width: 130px;
            height: 50px;
        }
        .exit{
        	background-color: red;
            color: white;
            border-radius: 10px;
            width: 100px;
            height: 50px;
        }
        input{
            width: 200px;
            height: 30px;
        }
        #pwd_sujung{
        	background-color: blue;
            color: white;
            border-radius: 10px;
            width: 100px;
            height: 50px;
        }
        #exit_1{
        	background-color: red;
            color: white;
            border-radius: 10px;
            width: 100px;
            height: 50px;
        }
        

    </style>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>
	<%@ include file ="../common/menubar.jsp" %>
	
	<%
		String memId = loginMember.getMemId();
		String memName = loginMember.getMemName();
		String nickName = (loginMember.getNickname() == null)? "": loginMember.getNickname();
		String phone = (loginMember.getPhone() == null)? "" : loginMember.getPhone();
		String email = (loginMember.getEmail() == null)? "" : loginMember.getEmail();
	%>
	
	<div class="wrap">
        <div id="header_1">
            <img src="resources/image/concatlo.png" style="width: 300px; height: 100px;">
            <div id="header_2">
                <img id="profileimg" style="height: 100px; width: 100px;" onclick="profile();">
            </div>
        </div>

        <div id="navi" class="cont">
            <br><br><br><br><br>
            <h3><a href="#">판매 목록 ▷</a></h3> <br><br>
            <h3><a href="#">찜한 상품 ▷</a></h3> <br><br>
            <h3><a href="#">문의 목록 ▷</a></h3> <br><br>   
            <h3><a href="#">신고 목록 ▷</a></h3> <br>
        </div>
        <div id="main" class="cont" align="center" >
            <p style="font-size: 30px; margin: 30px;">My page</p>
			<form id="myPage-form" action="<%= contextPath %>/update.me" method="post">
                <table>
                    <tr>
                        <th style="height: 50px; width: 300px;">※ 등급 </th>
                        <td><img src="resources/image/다이아.png"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px; width: 300px;" >※ 아이디 </th>
                        <td><input type="text" name="memId" value="<%= memId %>" maxlength="12" readonly></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 이름</th>
                        <td><input type="text" name="memName" value="<%= memName %>" maxlength="6" required></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 닉네임</th>
                        <td><input type="text" name="nickName" value="<%= nickName %>" maxlength="6"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 전화번호 </th>
                        <td><input type="text" name="phone" value="<%= phone %>" placeholder="- 포함해서 입력"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 이메일 </th>
                        <td><input type="email" name="email" value="<%= email %>" placeholder="@ 포함해서 입력"></td>
                    </tr>
                </table>  
                <br>
                <div>
                    <button type="submit" class="sujung" onclick="return sujung_1();">정보수정</button>
                    <button type="button" class="chenge" data-toggle="modal" data-target="#updatePwdModal" >비밀번호변경</button>
                    <button type="button" class="exit" data-toggle="modal" data-target="#exitModal">회원탈퇴</button>
                </div>  
                </form>
        </div>
    </div>
        <input type="file" name="file1" id="file1" onclick="loadimg(this, 1);" style="display: none;" required>
    <script>
        function sujung_1(){
            if(confirm("회원정보를 수정하시겠습니까 ?") == false){
            	return false;
            }
        }
        function profile(){
            $("#file").click();
        }
        function loadimg(inputFile,profile){
            if(inputFile.files.length == 1){
                const reader = new FileReader();

                reader.readAsDataURL(inputFile.files);

                reader.onload = function(e){
                    $("#profileimg").attr("src", e.target.result);
                }
            }else{
                $("#profileimg").attr("src". null);
            }
        }
    </script>

    <div class="modal" id="updatePwdModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body" align="center">
                    <form action="<%= contextPath %>/updatePwd.me" method="post">
                    <input type="hidden" name="memId" value="<%= memId %>">
                        <table>
                            <tr>
                                <td>현재 비밀번호</td>
                                <td><input type="password" name="memPwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호</td>
                                <td><input type="password" name="updatePwd" required></td>
                            </tr>
                            <tr>
                                <td>변경할 비밀번호 확인</td>
                                <td><input type="password" name="checkPwd" required></td>
                            </tr>
                        </table>
    
                        <br>
    
                        <button type="submit" id="pwd_sujung" onclick="return vaildatePwd();">비밀번호 변경</button>
    
                        <br><br>
                    </form>
                  </div>
    
                  <script>
                    function vaildatePwd(){
                        if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
                            alert("변경할 비밀번호가 일치하지 않습니다.")
                            return false;
                        }
                    }
                  </script>
            </div>
        </div>
    </div>
    
        <!-- 회원탈퇴용 Modal -->
    <div class="modal" id="exitModal">
      <div class="modal-dialog">
        <div class="modal-content">
    
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원탈퇴</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body" align="center">
            <form action="<%= contextPath %>/exit.me" method="post">
                <b>탈퇴 후 복구가 불가능합니다.<br> 정말로 탈퇴하시겠습니까 ? </b> <br><br>
				<input type="hidden" name="memId" value="<%= memId %>">
				
                비밀번호 : <input type="password" name="memPwd" required> <br><br>
                <button type="submit" id="exit_1")>탈퇴하기</button>
             
            </form>
          </div>

        </div>
      </div>
    </div>
    
</body>
</html>