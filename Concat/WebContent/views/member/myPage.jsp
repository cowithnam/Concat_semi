<%@page import="concat.mem_grade.model.vo.MemGrade"%>
<%@page import="concat.image.model.vo.Profile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		Member m = ((Member)request.getSession().getAttribute("loginMember"));
		Profile pro = (Profile)request.getAttribute("pro");
		MemGrade grade = (MemGrade)request.getAttribute("mg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        .wrap{
            box-sizing: border-box;
            border-radius: 30px ;
            width: 1200px;
            height: 700px;
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
            box-sizing: border-box;
            width: 300px;
            margin-left: 30px;
        }
        #main{
            box-sizing: border-box;
            width: 800px;
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
        
        #cg-span{
        	top:8px;
        }
        
		#profileimg{
			border-radius: 80px;
		}
		
		.gradedetail2{
		  position: absolute;
		  width: 100px;
		  -webkit-border-radius: 8px;
		  -moz-border-radius: 8px;
		  border-radius: 10px;
		  background: #333;
		  color: #fff;
		  font-size: 14px;
		}

        .gradedetail1{
            cursor: pointer;
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
	<div class="wrap">
        <div id="header_1">
            <img src="resources/image/concatlo.png" style="width: 300px; height: 100px;">
            <div id="header_2">
            	<% if(pro == null){ %>
            	<!-- 프로필 사진이 없을경우  -->
                <img src="resources/image/sayoungja.png" id="profileimg" style="height: 150px; width: 150px;" onclick="profile();">
                <% }else { %>
                <!-- 프로필 사진이 있을경우  -->
                <img src="<%=contextPath %>/<%=pro.getFilePath() %>" id="profileimg" style="height: 150px; width: 150px;" onclick="profile();">
                <% } %>
            </div>
        </div>

        <div id="navi" class="cont">
            <br><br><br><br><br>
            <h3><a href="#">판매 목록 ▷</a></h3> <br><br>
            <h3><a href="#">찜한 상품 ▷</a></h3> <br><br>
            <h3><a href="#">문의 목록 ▷</a></h3> <br><br>   
            <h3><a href="#">신고 목록 ▷</a></h3> <br>
        </div>
        <div id="main" class="cont" align="center">
        	<div style="width: 230px; height: 50px;" align="right">
	            <p style="font-size: 30px; display: inline-block; margin-bottom: 0px;" ><%= m.getMemName() %>님</p>
	            <% if(grade != null){ %>
	            <img src="<%=grade.getGrade_img()%>" id="gradeimg" width="50" height="50" style="position: relative; bottom: 8px;"> 
	            <% } %>
	            <br>
        	</div>
				<%= m.getMemId() %>
			<form id="myPage-form" action="<%= contextPath %>/update.me" method="post" enctype="multipart/form-data" id="mypageform">
                <table>
                    <tr>
                        <th style="height: 50px;">※ 닉네임</th>
                        <td><input type="text" id="nickName" name="nickName" value="<%= m.getNickname() %>" maxlength="6"></td>
                        
                    </tr>
                    <tr>
                    	<td colspan="2">> <span class="error_next_box" id="nickMsg"></span></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 전화번호 </th>
                        <td><input type="text" name="phone" onKeyup = "addHypen(this);" value="<%= m.getPhone() %>"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 이메일 </th>
                        <td><input type="email" name="email" value="<%= m.getEmail() %>" placeholder="@ 포함해서 입력"></td>
                    </tr>
                </table> 
                <input type="hidden" name="memNo" value="<%=m.getMemNo()%>"> 
		        <input type="file" name="file" id="file" style="display:none" onchange="loadimg(this)">
                <br>
                <div>
                    <button type="submit" class="sujung" onclick="return update();">정보수정</button>
                    <button type="button" class="chenge" data-toggle="modal" data-target="#updatePwdModal" >비밀번호변경</button>
                    <button type="button" class="exit" data-toggle="modal" data-target="#exitModal">회원탈퇴</button>
                </div>  
                </form>
                <br><br>
        </div>
    </div>
    <script>
        function update(){
            if(confirm("회원정보를 수정하시겠습니까 ?") == false){
            	return false;
            }
        }
        
        function profile(){
            $("#file").click();
        }
        
        function loadimg(inputFile){
        	
            if(inputFile.files.length == 1){
            	
                const reader = new FileReader();

                reader.readAsDataURL(inputFile.files[0]);

                reader.onload = function(e){
                	$("#profileimg").attr("src", e.target.result);
                }
            }else{
            	$("#profileimg").attr("src", "resources/image/sayoungja.png");
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
                    <input type="hidden" name="memId" value="<%= m.getMemId() %>">
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
				<input type="hidden" name="memId" value="<%= m.getMemId() %>">
				
                비밀번호 : <input type="password" name="memPwd" required> <br><br>
                <button type="submit" id="exit_1">탈퇴하기</button>
             
            </form>
          </div>

        </div>
      </div>
    </div>
    
    <script>
	    function addHypen(obj) {
		    var number = obj.value.replace(/[^0-9]/g, "");
		    var phone = "";
	
		    if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}
	    
    </script>
    
    <script>

    
    $(function() {
        $("#nickName").keyup(function(){
                const nickName = $(this).val();
                
                $.ajax({
                    type: "POST"
                    ,url: "nickNameModify.me"
                    ,dataType:"text"
                    ,data: {checkNick:nickName}
                    ,success:function(nick){

                        if(nick == 'NNNNN'){
                        	$("#nickMsg").html("<b>중복된 닉네임입니다.!</b>");
                        }else{
                            $("#nickMsg").html("<b>닉네임 사용가능합니다 사용하시겠습니까?</b>");
                        }
                    }
                    ,error:function(){
                        console.log("통신 실패!");
                    }
                })	
            })
    })
    </script>
</body>
</html>