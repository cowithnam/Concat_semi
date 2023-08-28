<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>Insert title here</title>
 <style>
        .wrap{
            box-sizing: border-box;
            border: 1px solid black;
            background-color: black;
            color: white;
            border-radius: 30px ;
            width: 1000px;
            height: 700px;
            margin: auto;
            margin-top: 20px;
            
        }   
        #header{
            margin: auto;
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
            width: 450px;
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
    </style>
</head>
<body>
	<%@ include file ="../common/menubar.jsp" %>
	<div class="wrap">
        <div id="header"><img src="resources/image/concat.png" style="width: 500px; height: 300px;"></div>

        <div id="navi" class="cont">
            <br><br>
            <h3><a href="<%= contextPath %>">내정보 ▷</a></h3> <br><br>
            <h3><a href="#">판매 목록 ▷ </a></h3> <br><br>
            <h3><a href="#">찜한 상품 ▷</a></h3> <br><br>
            <h3><a href="#">문의 목록 ▷</a></h3> <br><br>   
            <h3><a href="#">신고 목록 ▷</a></h3>           
        </div>
        <div id="main" class="cont" align="center" >
            <h1>My Page</h1> 
            <form id="mypageForm" action="<%= contextPath %>/update.me" method="post">
                <table>
                    <tr>
                        <th style="height: 50px; width: 200px;" >※ 아이디 </th>
                        <td><input type="text" id="memId"></td>
                    </tr>
                    <tr>
                       <th style="height: 50px;">※ 비밀번호</th>
                       <td><input type="password" id="memPwd"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 이름</th>
                        <td><input type="text" id="memName"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 닉네임</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 핸드폰번호 </th>
                        <td><input type="text" id="nickName"></td>
                    </tr>
                    <tr>
                        <th style="height: 50px;">※ 이메일 </th>
                        <td><input type="text" id="email"></td>
                    </tr>
                </table>  
                <br>
                <div>
                    <button type="submit" class="btn btn-primary">정보수정</button>
                    <button type="button" class="btn btn-warning">비밀번호변경</button>
                    <button type="button" class="btn btn-danger">회원탈퇴</button>
                </div>   
            </form>

        </div>
    </div>
</body>
</html>