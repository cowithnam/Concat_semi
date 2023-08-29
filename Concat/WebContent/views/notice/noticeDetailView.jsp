<%@page import="concat.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%Notice n = (Notice)request.getAttribute("n");  %>
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
            margin-bottom: 20px;
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
            width: 1000px;
            
        }

         #button1{
            width: 140px;
            height: 50px;
            background-color: black;
            color: white;
            font-size: 23px;
            font-weight: bold;
            border-radius: 10px;
            position: relative;
           
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
        #tit1{
            float: left;
            height: 10px;
        }
    </style>
</head>
<body>
<%@ include file ="../common/menubar.jsp" %>
    <div id="outer">
        <h1>공지사항</h1>
        <hr>
        <div>
            <h3><%=n.getNoticeTitle() %></h3>
        </div>
        <div>
            <h6>조회수 : <%=n.getCount() %> </h6><h6>작성일 : <%=n.getCreateDate() %></h6>
        </div>
           
            
            <div id="content">
            <strong><%=n.getNoticeContent() %></strong>
            </div>
            <br>
            
            <div align="center">
            <%if(loginMember != null && n.getNoticeWriter().equals(loginMember.getMemNo()+"")) {%>
       		<button id="button1" onclick = "location.href='<%=contextPath %>/updateform.no?num=<%=n.getNoticeNo()%>'">수정하기</button>
            <button id="button1" onclick = "deleteno();">삭제하기</button>
          
<%} %>
            <button id="button1" onclick = "nolist();">목록보기</button>
                <br><br>
            </div>
    </div>
</body>
<script >
//목록보기이동
 function nolist(){
		 location.href = '<%=contextPath%>/listpage.no'
	
 }
 
 function deleteno(){

	 if(confirm("정말 해당글을 삭제하시겠습니까?")){
		 location.href = '<%=contextPath%>/deletenotice.no?num=<%=n.getNoticeNo()%>'
	 		
	 }else{
		 location.href = '<%=contextPath%>/detail.no?num=<%=n.getNoticeNo()%>'
	 }
 }

</script>
</html>
