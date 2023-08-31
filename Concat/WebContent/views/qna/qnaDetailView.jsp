<%@page import="concat.qna.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%Qna q = (Qna)request.getAttribute("q"); %> 
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
    <title>QNA상세</title>
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
        #answer{
        font-size: 19px;
            font-weight: bold;
        
        }
    </style>
</head>
<body>
<%@ include file ="../common/menubar.jsp" %>
    <div id="outer">
        <h1>QNA</h1>
        <hr>
        <div>
            <h3><%=q.getQnaTitle() %></h3>
        </div>
        <div>
            <h6>작성자 : <%=q.getQnaWriterNick() %> </h6><h6>작성일 : <%=q.getCreateDate() %></h6>
        </div>
           
            
            <div id="content">
            <strong><%=q.getQnaContent() %></strong>
            </div>
            <br>
             <%if((loginMember != null && loginMember.getMemId().equals("user01")) || (loginMember != null &&q.getQnaWriter().equals(loginMember.getMemNo()+""))){ %>
             <div id="answer">
          
            댓글  <br>
           
            
            <textarea  name="content" cols="30" rows="10" style="resize: none;" placeholder="댓글을입력하세요" ></textarea>
             
            <br>
            </div>
            <% }%>
           
            <br>
            
            <div align="center">
            <%if(loginMember != null && loginMember.getMemId().equals("user01")){%>
            <button id="button1" onclick = "asnwer();">댓글달기</button>
            <%}else if (loginMember != null &&q.getQnaWriter().equals(loginMember.getMemNo()+"") && ! loginMember.getMemId().equals("user01") ){ %>
       		<button id="button1" onclick = "answer();">댓글달기</button>
       		<button id="button1" onclick = "location.href='<%=contextPath %>/updateform.qa?num=<%=q.getQnaNo()%>'">수정하기</button>
            <button id="button1" onclick = "location.href = '<%=contextPath%>/deleteqna.qa?num=<%=q.getQnaNo()%>">삭제하기</button>
			<%}%>
			
            <button id="button1" onclick = "location.href = '<%=contextPath%>/list.qa?qpage=1'">목록보기</button>
                <br><br>
            </div>
    </div>
</body>
<script >
//목록보기이동
 function nolist(){
		 location.href = '<%=contextPath%>/list.qa?qpage=1'
			
	
 }
 
 function deleteno(){
	 if(confirm("정말 해당글을 삭제하시겠습니까?")){
		 location.href = '<%=contextPath%>/deleteqna.qa?num=<%=q.getQnaNo()%>'
	 		
	 }else{
		 location.href = '<%=contextPath %>/detail.qa?num=<%=q.getQnaNo()%>'
	 
 }
 


</script>
</html>