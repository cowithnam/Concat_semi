<%@page import="concat.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            box-sizing: border-box;
            width: 1200px;
            height: auto;
            margin: auto;
            margin-top: 100px;
        }
        
        #navi{
            box-sizing: border-box;
            width: 260px;
            margin-left: 30px;
            box-shadow: 5px 0 5px -5px #333;
        }
        
        #main{
            box-sizing: border-box;
            width: 800px;
            margin-left: 80px;
        }
        .cont{
            float: left;
        }
        
        .my-navi{
        	width: 140px;
        	height: 60px;
        	margin-bottom: 30px;
        	padding-top: 10px;
        	font-size: 25px;
        }
        
        .myProfile{
        	border: 2px solid lightgray;
        	width: 450px;
        	height: 340px;
        	padding: 50px;
        	border-radius: 10px;
        	margin-left: 20px;
        }
        
        .select-navi{
        	text-decoration : underline;
        	text-underline-position: under;
        	font-weight: bolder;
        }

        
        table, td, th {
            border-collapse : collapse;
        }

        thead th{
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }
        tbody td{
            border-bottom: 1px solid lightgray;
        }
        .slist-button>button{
            width: 100px;
            height: 40px;
            margin-top: 15px;
            margin-right: 15px;
            background-color: black;
            color: white;
            border-radius: 10px;
            font-weight: bolder;
            font-size: 17px;
        }
</style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
	<div class="outer">
		<div id="navi" class="cont" align="right">
        	<div style="margin-right: 20px;" class="my-navi my-page" align="center">마이페이지</div>
            <div style="margin-right: 20px;" class="my-navi select-navi" align="center">판매 목록</div>
            <div style="margin-right: 20px;" class="my-navi wish-list" align="center">찜한 상품</div>
            <div style="margin-right: 20px;" class="my-navi inquiry-list" align="center">문의 목록</div>   
            <div style="margin-right: 20px;" class="my-navi report-list" align="center">신고 목록</div>
        </div>
        <div id="main" class="cont">
        	<h1>판매 목록</h1>
	        <table>
	            <thead>
	                <tr>
	                    <th width="168" height="40" style="border-left: none;">사진</th>
	                    <th width="128" height="40">판매상태</th>
	                    <th width="400" height="40">상품명</th>
	                    <th width="300" height="40">가격</th>
	                </tr>
	            </thead>
	            <tbody align="center">
	            	<% for(Board b : list){ %>
		                <tr class="mySalesList">
		                    <td><img src="<%=b.getThumbnail() %>" width="80" height="80"></td>
	                        <td><h4><%= b.gettStatus()%></h4></td>
		                    <td><h3><%=b.getBoardTitle() %></h3><h5><%=b.getBrand() %></h5></td>
		                    <td style="color: #ff006c;"><h4><%=b.getPrice() %></h4></td>
		                	<input type="hidden" name="bno" value="<%=b.getBoardNo() %>">
		                </tr>
	                <% } %>
	            </tbody>
	        </table>
	        <div align="right" class="slist-button">
	            <button id="page-back">뒤로가기</button>
	        </div>
        </div>
        
    </div>
     <script>
	     $(".mySalesList").click(function(){
		       	location.href="<%=contextPath %>/detail.bo?bno="+$(this).children("input").val();
	     });
        
        $("#page-back").click(function(){
        		history.back();
        })
        
        $(function() {
		 	$(".my-page").click(function() {
				location.href="<%=contextPath %>/myPage.me";
			});
		 	
		 	$(".wish-list").click(function() {
				location.href="<%=contextPath %>/wishList.bo";
			});
		 	
			$(".inquiry-list").click(function() {
				location.href="<%=contextPath %>/myList.qa";
			});
			 	
			$(".report-list").click(function() {
				location.href="<%=contextPath %>/myReport.bl";
			});
	 	})
    </script>
<%@ include file="../common/footerbar.jsp" %>
</body>
</html>