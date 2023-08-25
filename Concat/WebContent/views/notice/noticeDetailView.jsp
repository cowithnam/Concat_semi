<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항상세</title>
    <style>
        #outer{
            width: 1000px;
            height: 800px;
            margin: auto;
            text-align: left;
        }

        hr{
            margin-bottom: 40px;
        }

        h3{display: inline; position: relative; left: 15px;}

        h6{display: inline; position: relative; left: 650px;}

        form{
            font-size: 19px;
            font-weight: bold;
        }

        input{
            width: 400px;
            height: 20px;
        }

        textarea{
            width: 900px;
            height: 500px;
        }

        button{
            width: 140px;
            height: 50px;
            background-color: black;
            color: white;
            font-size: 23px;
            font-weight: bold;
            border-radius: 10px;
            position: relative;
            left: 400px;
        }

        #content{
            color: gray;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
            margin-top: 20px;
            padding: 20px 15px;
            font-size: 15px;
            font-weight: lighter;
        }
    </style>
</head>
<body>
<%@ include file ="../common/menubar.jsp" %>
    <div id="outer">
        <h1>공지사항</h1>
        <hr>
        <form action="#">
            <h3>공지사항 제목</h3> 
            <h6>조회 : 조회수</h6> 
            <h6>날짜 : 작성일</h6>
            <div id="content">
                여기는 공지사항의 내용이 나오는 칸입니다 <br>
                여러가지 내용의 공지사항을 적으시면 됩니다. <br>
                여러줄도 됩니다 <br>
                신기하죠? <br><br>
                감사합니다. <br>
                오늘도 좋은하루 되세요
            </div>
            <br>
            <button>목록보기</button>
        </form>
    </div>
</body>
</html>
</body>
</html>