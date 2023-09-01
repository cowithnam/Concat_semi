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

    img{
        width: 550px;
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

    .review-recontent{
        border-top: 1px solid lightgray;
    }

    .review{
        width: 550px;
        height: 150px;
        border-bottom: 1px solid lightgray;
    }

    .review-user{
        width: 550px;
        height: 50px;
    }

    .review-user>div{
        height: 100%;
        float: left;
    }

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="wrap" align="center">
		<form action="<%= contextPath %>/updateForm.re?rNo=<%= r.getReviewNo() %>" method="post" enctype="multipart/form-data">
        <div class="img">
        	<img src="<%= contextPath %>/<%= i.getFilePath() %>">
        </div>
        
        <div class="profile">
            <div class="information">
                <div style="width: 30px;">
                    <img src="" style="width: 20px; height: 20px;">            
                </div>
                <div>
                    <h3 style="margin: 0px;"><%= r.getMemNo() %></h3>
                </div>
            </div>
            <div class="point">
                <h4 style="margin: 0px;"><%= r.getScore() %> 점</h4>
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
                <h5><%= r.getCount() %>회</h5>
            </div>
            
            <div class="review-recontent">
                <h3>댓글 제목</h3>
                <div class="review">
                    <div class="review-user">
                        <div>
                            <h4 style="margin: 0px;">유저</h4>
                        </div>
                    </div>

                    <div style="padding-left: 15px; width: 550px;" >
                       <textarea id="content" rows="" cols="" placeholder="댓글작성란">댓글내용</textarea>
                    </div>
                    
                    <% if(loginMember != null) {%>
                    	<button type="button" onclick="insertReply();">댓글등록</button>
                    <% }else { %>
                    	<button type="button" disabled>댓글등록</button>
                    <% } %>
                </div> 
                
                <div id="reply">
                	
                </div>
            </div>
            
            <div align="center">
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
        					result += "<div class='review-recontent'>"
        							+ "<div class='review'>"
        							+ "<div class='review-user'>"
        							+ "<div>"
        							+ "<h4 style='margin:0px;'>"
        							+ list[i].replyWriter
        							+ "</h4>"
        							+ "</div>"
        							+ "</div>"
									+ "<div style='padding-left: 15px; width: 550px;'>"
									+ "<textarea id='content' rows='3' cols='50' placeholder='댓글작성란'>"
									+ list[i].replyContent
									+ "</textarea>"
									+ "<br>"
									+ "<div style='text-align: right; padding-right:40px;'>"
									+ "작성일 : "
									+ list[i].createDate 
									+ "</div>"
									+ "</div>"
									+ "</div>"
									+ "</div>";
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