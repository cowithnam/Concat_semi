<%@page import="concat.qna.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% Qna q = (Qna)request.getAttribute("q");%>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
            width: 300px;
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
        #input1{
            width: 50px;
            height: 20px;
            
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
        <h1>QNA 작성하기</h1>
        <hr>
        <form action="<%= contextPath %>/update.qa" method="post" id="no-enroll">
        	<input type="hidden" name ="num" value="<%=q.getQnaNo()%>">
            제 &nbsp;&nbsp;목 : <input type="text" placeholder="제목을 입력하세요" name ="title" value=<%=q.getQnaTitle() %>>
            <br><br> 
            <div>
            이메일 : <input type="email" placeholder="이메일을 입력하세요" >
            </div>
            <div> <p>답변여부를 메일로 받으시겠습니까? 
            <input id="input1" name="radio1"  type="radio" value="Y" checked="checked"><label id="input1">예</label>
            <input id="input1" name="radio1"  value="N" type="radio"><label id="input2">아니오</label>
        </p></div>
            <br> 
            내용  <br>
            <textarea  name="content" cols="30" rows="10" style="resize: none;" ><%=q.getQnaContent()%></textarea>
            <br>
            <button type="submit" class="enroll-btn">수정하기</button>
            <button type="button" class = "enroll-btn" onclick = "backno();">뒤로가기</button>
        </form>
    </div>
</body>

<script>
    function backno(){
    	location.href = '<%=contextPath %>/detail.qa?num=<%=q.getQnaNo()%>'

    }

    
</script>
</html>

</body>
</html>