<%@page import="concat.image.model.vo.Image"%>
<%@page import="concat.review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Review r = (Review)request.getAttribute("r");
   Image i = (Image)request.getAttribute("image");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width: 1000px;
        box-sizing: border-box;
        margin: auto;
    }

    .img>img{
        width: 500px;
        height: 500px;
    }

    .profile{
        width: 550px;
        padding: 20px;
        box-sizing: border-box;
        background-color: black;
        color: white;
        border-radius: 10px;
    }

    .information{
        text-align: left;
    }

    .information>div{
        float: left;
    }

    .point{
        text-align: right;
    }

    .content{
        width: 550px;
        text-align: left;
    }

    .review{
        border-bottom: 1px solid lightgray;
        margin-top: 0px;
        padding-bottom: 20px;
    }

    .review-user{
        margin-top: 0px;
        width: 550px;
        height: 35px;
    }

    .review-user>div{
        height: 100%;
        float: left;
    }
    
    .btn{
       text-align: right;
        padding-right: 20px;
    }

    #reply{
        margin-top: 0px;
        
    }

    #reply textarea:focus{
        outline: none;
    }

    .btn>button, .btn2>button{
        width: 100px;
        height: 40px;
        margin: auto;
        background-color: black;
        color: white;
        border-radius: 10px;
        font-weight: bolder;
        font-size: 17px;
    }

    .btn>button{
        margin-top: 10px;
        margin-left: 10px;
        width: 90px;
        height: 35px;
    }

    .btn2{
        margin: auto;
        text-align: center;
    }

    button:hover{
        cursor: pointer;
    }

    .delete{
        text-align: right;
        padding-right: 20px;
    }

    .delete>button{
        margin-left: 10px;
        width: 80px;
        height: 30px;
        background-color: black;
        color: white;
        border-radius: 10px;
        font-weight: bolder;
        font-size: 15px;
    }
    
</style>
</head>
<body>

   <%@ include file="../common/menubar.jsp" %>
   
   <div class="wrap" align="center">
      <br>
      <form action="<%= contextPath %>/updateForm.re?rNo=<%= r.getReviewNo() %>" method="post" enctype="multipart/form-data">
        <div class="img">
           <img src="<%= contextPath %>/<%= i.getFilePath() %>">
        </div>
        
        <div class="profile">
            <div class="information">
                <div>
                    <h3 style="margin: 0px;">작성자 : <%= r.getMemNo() %></h3>
                </div>
            </div>
            <div class="point">
                <h4 style="margin: 0px;">평점 : <%= r.getScore() %> 점</h4>
            </div>
        </div>

        <div class="content">
            <div class="review-title">
                <h3><%= r.getReviewTitle() %></h3>
            </div>
            <div class="review-content" style="padding-left: 10px;">
                <p><%= r.getReviewContent() %></p>
            </div>

            <div align="right">
                <h5>조회수 : <%= r.getCount() %>회</h5>
            </div>
            
            <div style="border-top: 1px solid lightgray;"></div>
               
            <div id="reply">
            </div>
            
                            
            <div class="review-recontent">
                <div class="review">
                    <div style="padding-left: 15px; width: 550px; margin-top: 15px; " >
                        <textarea id="content" rows="4" cols="60" placeholder="댓글작성란" style="resize: none"></textarea>
                    </div>
                    
                    <div class="btn">
                    <% if(loginMember != null) {%>
                        <button type="button" onclick="insertReply();">댓글등록</button>
                    <% }else { %>

                        <button type="button" disabled style="background-color: gray;">댓글등록</button>

                    <% } %>
                    </div>
                </div> 
            </div>
            
            <br>
            
            <div class="btn2">
            <% if(loginMember != null && r.getMemNo().equals(loginMember.getMemId())) {%>
            <!-- 로그인한 사람이 당사자일 경우 -->
                <button type="submit">수정</button>
                <button type="button" id="delete">삭제</button>
            <% } %>
             <button type="button" onclick="history.back();">뒤로가기</button>   
            </div>
            </form>
        </div>
    </div>
       
        <script>
           $(function(){
              $("#delete").click(function(){
                 location.href='<%= contextPath %>/delete.re?num=<%= r.getReviewNo() %>'
              })
           })
           
           $(function(){ 
                 selectReplyList();
                 
                 setInterval(selectReplyList, 4000);
              })
           
           function insertReply() {
              $.ajax({
                 url:"replyInsert.re",
                 data:{
                    content:$("#content").val(),
                    rNo:<%= r.getReviewNo() %>,
                 },
                 type:"post",
                 success:function(result){
                    if(result > 0){
                       selectReplyList();
                       $("#content").val("");
                    }
                    
                 },
                 error:function(){
                    console.log("댓글작성에 실패했습니다.")
                 }
              })
           }
           
           
           function selectReplyList(){
              $.ajax({
                 url:"replyList.re",
                 data:{
                    rNo:<%= r.getReviewNo() %>
                 },
                 success:function(list){
                    console.log(list);
                    
                    let result ="";
                    
                       for(let i=0; i<list.length; i++){
                       result += "<br>" 
                      		   + "<br>"
                               + "<div class='review-recontent' style='font-size: 14px;'>"
                             + "<div class='review'>"
                             + "<div class='review-user'>"
                             + "<div>"
                             + "<h4 style='margin:0px; margin-top:0px; font-size: 18px; padding-left: 20px;'>"
                             + list[i].replyWriter
                             + "</h4>"
                             + "</div>"
                             + "</div>"
                           + "<div style='padding-left: 50px; width: 550px;'>"
                           + "<textarea id='content' rows='4' cols='50' style='resize: none; border: none; font-size: 15px;' readonly>"
                           + list[i].replyContent
                           + "</textarea>"
                           + "<br>"
                           + "<div style='text-align: right; padding-right:40px;'>"
                           + "작성일 : "
                           + list[i].createDate 
                           + "</div>"
                           + "<br>"
                           + "</div>"
                           + "</div>"
                           + "</div>"
                    }
                    $("#reply").html(result);
                 },
                 error:function(){
                    console.log("댓글조회에 실패했습니다.")
                 }
              })
           }
        </script>   
    
</body>
</html>