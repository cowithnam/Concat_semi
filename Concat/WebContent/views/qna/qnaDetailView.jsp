<%@page import="concat.qna.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Qna q = (Qna) request.getAttribute("q");
%>
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
#outer {
	width: 1000px;
	height: 800px;
	margin: auto;
	text-align: left;
}

hr {
	margin-bottom: 20px;
}

h3 {
	display: inline;
	position: relative;
	left: 15px;
}

h6 {
	display: inline;
	position: relative;
	left: 650px;
}

form {
	font-size: 19px;
	font-weight: bold;
}

input {
	width: 400px;
	height: 20px;
}

textarea {
	width: 1000px;
}

#button1 {
	width: 130px;
	height: 40px;
	background-color: black;
	color: white;
	font-size: 23px;
	font-weight: bold;
	border-radius: 10px;
	position: relative;
}

#outer>#content1 {
	color: gray;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	margin-top: 20px;
	padding: 20px 15px;
	font-size: 15px;
	font-weight: lighter;
	height: 200px;
	width: 100%;
}

#tit1 {
	float: left;
	height: 10px;
}

#answer-form {
	font-size: 19px;
	font-weight: bold;
	width: 1000px;
}

#answer-form>* {
	width: 100%;
	border: 1px solid black;
	width: 100%
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<div id="outer">
		<h1>QNA</h1>
		<hr>
		<div>
			<h3><%=q.getQnaTitle()%></h3>
		</div>
		<div>
			<h6>
				작성자 :
				<%=q.getQnaWriterNick()%>
			</h6>
			<h6>
				작성일 :
				<%=q.getCreateDate()%></h6>
		</div>


		<div id="content1">
			<strong><%=q.getQnaContent()%></strong>

		</div>
		<br>




		<div align="center" id="content">

			<div id="answer" align="left" style="width: 1100px;">
				<div id="answer1"></div>

			</div>

			<br>
			<br>
			
			<% if (loginMember != null && loginMember.getMemId().equals("user01")) { %>
			<textarea name="content" cols="30" rows="10" id="replyContent"
				style="resize: none;" placeholder="댓글을 입력하세요"></textarea>
			<button type="button" id="button1" onclick="insertReply();">답변 등록</button>
			<button id="button1" type="button" onclick="location.href='<%=contextPath%>/list.qa?qpage=1'">목록가기</button>
			<% } %>
			
			<% if (loginMember != null && q.getQnaWriter().equals(loginMember.getMemNo()+"") && !loginMember.getMemId().equals("user01")) { %>
			<button id="button1" type="button" onclick="confirmDelete()">삭제하기</button>
			<button id="button1" type="button" onclick="location.href='<%=contextPath%>/list.qa?qpage=1'">목록가기</button>
			<% }%>
			
			<% if (loginMember != null && !q.getQnaWriter().equals(loginMember.getMemNo()+"") && !loginMember.getMemId().equals("user01")) { %>
			<button id="button1" type="button" onclick="location.href='<%=contextPath%>/list.qa?qpage=1'">목록가기</button>
			<% }%>

		</div>

		<br> <br>
</body>
<script>
$(function(){
	selectReplyList();
})


function nolist() {
    location.href = '<%=contextPath%>/list.qa?qpage=1';
}

function confirmDelete() {
    if (confirm("게시글을 삭제하시겠습니까?")) {
        location.href = '<%=contextPath%>/deleteqna.qa?num=<%=q.getQnaNo()%>';
    } else {
        location.href = '<%=contextPath%>/detail.qa?num=<%=q.getQnaNo()%>';
    }
}

function answer() {
    location.href = '<%=contextPath%>/answer.qa?num=<%=q.getQnaNo()%>';
}

function insertReply(){
	$.ajax({
		url:"answer.qa"
		,data:{content:$("#replyContent").val(),
				qno:<%=q.getQnaNo() %>}
				,type:"post"
				,success:function(result){
					console.log(result)
					if(result > 0 ){
						$("#replyContent").val("")
						$("#replyContent").attr("readonly")
					}
					
				}
				,error:function(){
					console.log("댓글작성용 ajax 통신 실패");
				}
		
			
	})
}

function selectReplyList(){
		$.ajax({
			url:"rlist.qa"
			,data:{qno:<%=q.getQnaNo()%>}
			,success:function(list){
				let result = "";
				for(let i = 0; i<list.length; i++){
					result += "<strong> 작성자 :" +list[i].repWriter + "<strong>" +"</div>"
							+ "<div><strong> 답&nbsp;&nbsp;변 :" +list[i].content + "<strong>" 
							
				}
				
				$("#answer>div").html(result);
				
			}
			,error:function(){
				console.log("댓글 조회용 ajax 통신 실패!")
				
			}
		})
	}
	

</script>
</html>