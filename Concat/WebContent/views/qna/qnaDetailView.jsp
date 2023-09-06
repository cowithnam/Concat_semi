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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

h2 {
	display: inline;
	position: relative;
	left: 15px;
}

h4 {
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
	padding: 20px 10px;
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
#outer>#content2>table{
    margin-top: 20px;
    height: 50px;
    width: 100%;
    }

table{
	border-collapse: collapse}
		
table>tr{
	width: 100%;
	height: 100%;
}
.td1{
	width: 100%;
	height: 100%;
	padding: 5px;
	font-size: 15px;
	font-weight: bolder;
}
.td2{
	width: 100%;
	height: 100%;
	padding: 5px;
}
.tr1{
	border: 0;
}
.tr2{
	border-bottom: 1px solid lightgray;
}
textarea{
	border: 1px solid lightgray;
	padding: 0;
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
            <h4>작성자 :
				<%=q.getQnaWriterNick()%> </h4><h4>작성일 :
				<%=q.getCreateDate()%></h4>
        </div>
		


		<div id="content1">
			<strong><%=q.getQnaContent()%></strong>

		</div>
		<br>



		<h3>답변</h3>
		<hr style="border: 1px solid lightgray;">
		<div align="center" id="content2">
			
		<table id="answer99">
			<tbody id = "inserttr">
			</tbody>
		</table>
			<br><br>
			
			
			
			
			<% if (loginMember != null) { %>
    			<% if (q.getQnaWriter().equals(loginMember.getMemNo() + "") || loginMember.getMemId().equals("user01")) { %>
		
				<textarea name="content" cols="30" rows="10" id="replyContent"
				style="resize: none;" placeholder="댓글을 입력하세요"></textarea>
				<% }else{ %>	
				<textarea name="content" cols="30" rows="10" id="replyContent"
				style="resize: none;" placeholder="본인이 등록한 글 외에는 답변을 작성하실 수 없습니다"  readonly></textarea>	
				</div>
				<% }%>
			<% } else { %>
			
			<% } %>

			<br>
			<br>
			
			<% if (loginMember != null) { %>
    <% if (loginMember.getMemId().equals("user01")) { %>
        
        <button type="button" id="button1" onclick="insertReply();">답변 등록</button>
        
        <button id="button1" type="button" onclick="location.href='<%=contextPath%>/list.qa?qpage=1'">목록가기</button>
    <% } else if (q.getQnaWriter().equals(loginMember.getMemNo() + "")) { %>
        
        <button type="button" id="button1" onclick="insertReply();">답변 등록</button>
       
        <button id="button1" type="button" onclick="confirmDelete()">삭제하기</button>
       
        <button id="button1" type="button" onclick="location.href='<%=contextPath%>/list.qa?qpage=1'">목록가기</button>
    <% } else { %>
        
        <button id="button1" type="button" onclick="location.href='<%=contextPath%>/list.qa?qpage=1'">목록가기</button>
    <% } %>
<% } %>

		</div>

		<br> <br>
		
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

function insertReply() {
	if($("#replyContent").val() != ""){
	    $.ajax({
	        url: "answer.qa",
	        data: {
	            content: $("#replyContent").val(),
	            qno: <%=q.getQnaNo() %>
	        },
	        type: "post",
	        success: function (result) {
	            if (result > 0) {
	            	 selectReplyList()
	                $("#replyContent").val("");
	            }
	        },
	        error: function () {
	            console.log("댓글 작성용 ajax 통신 실패");
	        }
	    })
	}
}


function selectReplyList() {
    $.ajax({
        url: "rlist.qa",
        data: { qno: <%=q.getQnaNo()%> },
        success: function (list) {
            let result = "";
            for (let i = 0; i < list.length; i++) {
                result += "<tr>" + "<td class='td1'>" + list[i].repWriter + "</td>" + "</tr>"
                        + "<tr class='tr2'>" + "<td class='td2'>" + list[i].content + "</td>" + "</tr>";
            }
            $("#answer99>tbody").html(result);
        },
        error: function () {
            console.log("댓글 조회용 ajax 통신 실패!");
        }
    });
}

</script>
	<%@ include file="../common/footerbar.jsp" %>
</body>

</html>