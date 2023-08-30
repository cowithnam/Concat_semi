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
    <title>공지사항작성</title>
    <style>
        #outer{
            width: 1000px;
            height: 800px;
            margin: auto;
            text-align: left;
        }

        #no-enroll{
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

        .enroll-btn{
            width: 80px;
            height: 40px;
            background-color: black;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            margin-top: 5px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <%@ include file ="../common/menubar.jsp" %>
   
    <div id="outer">
        <h1>공지사항 작성하기</h1>
        <hr>
        <form action="<%= contextPath %>/insert.no" method="post" id="no-enroll">
        	
        	
            제목 : <input type="text" placeholder="제목을 입력하세요" name ="title">
            <br> <br>
            내용  <br>
            <textarea  name="content" cols="30" rows="10" style="resize: none;" ></textarea>
            <br>
            <button type="submit" class="enroll-btn">작성하기</button>
            <button type="button" class = "enroll-btn" onclick = "backno();">뒤로가기</button>
        </form>
    </div>
</body>

<script>
    function backno(){
        location.href = '<%=contextPath%>/listpage.no?cpage=1'

    }
</script>
</html>

</body>
</html>