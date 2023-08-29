<%@page import="concat.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String filepath = request.getSession().getServletContext().getRealPath("/WebContent/resources/image/");
	String contextPath = request.getContextPath();
	Member loginMember = (Member)session.getAttribute("loginMember");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Concat</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        div{
            box-sizing: border-box;
        }
        #wrap{
            width: 1400px;
           
            margin: auto;
            
        }
        
        #header{
            height: 180px;
            width: 100%;
        }

        #header>div{
            height: 100%; float: left;
        }

        #header1{width: 15%;}

        #header1>img{
            width: 350px;
            height: 350px;
            position: relative;
            bottom: 80px;
        }

        #header2{width: 60%;}

        #search{
            border: 2px solid black;
            width: 390px;
            height: 40px;
            border-radius: 20px;
            position: relative;
            top: 80px;
            left: 300px;
        }

        #search *{
            height: 100%;
            display: block;
            float: left;
        }

        #search span{
            position: absolute;
            left: 10px;
            bottom: 5px;
        }

        #search input{
            width: 272px;
            height: 34px;
            border: none;
            position: absolute;
            left: 50px;
            outline: none;
        }

        #search button{
            position: absolute;
            left: 330px;
            width: 40px;
            /* background-image: url(resources/image/search.png); */
            background-repeat: no-repeat;
            background-position: center;
            background-size: 30px 30px;
            background-color: white;
            border: none;
        }

        #search button:hover{cursor: pointer;}

        #header3{
            width: 25%;
            padding-top: 10px;
            padding-right: 20px;
            text-align: right;
            line-height: 180px;
        }

        #header3>a{
            text-decoration: none;
            color: black;
            font-weight: bolder;
            margin-left: 10px;
        }
    
        #navigator{
            width: 100%;
            height: 45px; 
            padding-left: 10px;
            margin-bottom: 20px;
        }

        #category{
            float: left;
            display: none;
            width: 1500px;
            height: 100px;
            background-color: white;
            position: relative;
            right: 50px;
            top: 6px;
        }

        #category:hover{display: block; transform: scale(1);}

        #category button{border: none; cursor: pointer; background-color: white; margin: 0px 20px;  transform: scale(1);}

        #navigator a{
            text-decoration: none;
            color: black;
            display: block;
        }

        #navigator ul{list-style-type: none;}

        #navigator li{float: left;}

        #navigator>div{
            float: left;
            height: 100%;
        }
        
        #cg-div{
            background-color: black;
            height: 40px;
            width: 150px;
            border-radius: 20px;
            margin-right: 15px;
            transform: scale(1);
        }

        #cg-div:hover{cursor: pointer;}
        #cg-div>div>button:hover{cursor: pointer;}
        #cg-div:hover>div{display: block;}


        #cg-div>img{
            width: 35px;
            height: 35px;
            position: relative;
            top: 4px;
            left: 8px;
        }
    
        #navigator>div>button{
            height: 100%;
            border: none;
            background-color: white;
            font-size: 20px;
            font-weight: bolder;
            margin: 0px 20px;
        }

        #cg-span{
            font-size: 20px;
            font-weight: bolder;
            color: white;
            position: relative;
            left: 18px;
	        top: 6px;
	        bottom : 3px;
            line-height: 40px;
        }

        #content{
            width: 100%;
            height: 79%;
        }

        .minibar{    
            position: absolute;
            bottom: 70%;
            right: 10%;
        }

        #minibar{
            position: fixed;
            /* background-image: url(resources/image/icons8-티켓-100.png); */
            background-repeat: no-repeat;
            background-size: 130px 105px;
            width: 130px;
            height: 120px;
        }

        #minibar>a{
            font-size: 15px;
            color: white;
            text-decoration: none;
            font-weight: bolder;
            color: ivory;
        }

        #zzim{
            position: relative;
            top: 38px;
            left: 38px;
        }

        #sell-page{
            position: relative;
            top: 42px;
            left: 35px;
        }

        #minibar>a:hover{
            text-decoration: 2px underline;
            color: lightgoldenrodyellow;
        }
    
        #banner{
            width: 100%;
            height: 500px;
            /* background-color: #168d63; */
            /* background-image: url(resources/image/detail_foil_ticket_03.jpg); */
            background-repeat: no-repeat;
            background-size: 1400px 500px;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        #span1{
            font-weight: bolder;
            font-size: 65px;
            position: relative;
            top:  80px;
            left: 100px;
        }

        #span2{
            position: relative;
            top: 115px;
            right: 110px;
            font-weight: bold;
        }

        #footer{
            width: 100%;
            height: 11.5%;
            border: 1px solid black;
        }
        
    </style>
</head>
<body style="position: relative;">
    <div id="wrap">
        <div id="header">
            <div id="header1">
				  <img src="resources/image/concatlogo.png">
            </div>
            <div id="header2">
                <div id="search">
                    <span style="font-size: 33px; font-weight: bolder;">C</span>
                    <form action="#">
                        <input type="text" name="search" placeholder="검색어를 입력해 주세요">
                        <button type="submit"></button>
                    </form>
                </div>
            </div>
            <% if(loginMember == null){ %>
            <div id="header3">
                <a href="<%= contextPath %>/login.me">로그인</a>
            </div>
            <% }else{ %>
           	<div>
           		<br><br><br>
                <b style="color: orange;"><%= loginMember.getMemName() %></b>
	            	<a href="#" style="text-decoration: none; color: black; font-size: medium;">판매하기</a>
	                <a href="<%= contextPath %>/myPage.me" style="text-decoration: none; color: black;">마이페이지</a>
	                <a href="<%= contextPath %>/logout.me" style="text-decoration: none; color: black;">로그아웃</a>
            </div>
            <% } %>
        </div>
        <div id="navigator">
            <div id="cg-div" style="cursor: pointer;">
                <img src="resources/image/menu.png">
                <span id="cg-span">카테고리</span>
                <div id="category">
                    <ul>
                        <li><button type="button"><img src="resources/image/coffee.png"></button></li>
                        <li><a href="#"><button type="button"><img src="resources/image/pizza.png"></button></a></li>
                        <li><a href="#"><button type="button"><img src="resources/image/burger.png"></button></a></li>
                        <li><a href="#"><button type="button"><img src="resources/image/chicken.png"></button></a></li>
                        <li><a href="#"><button type="button"><img src="resources/image/bread.png"></button></a></li>
                        <li><a href="#"><button type="button"><img src="resources/image/icecon.png"></button></a></li>
                    </ul>
            </div>
            </div>
            <div><button>구매후기</button></div>   
             <div><button onclick="location.href='<%= contextPath %>/listpage.no'">고객센터</button></div>  
        </div>
    </div>

</body>
</html>