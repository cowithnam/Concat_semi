<%@page import="concat.blacklist.model.vo.BlackList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<BlackList> list = (ArrayList<BlackList>)request.getAttribute("list");
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
            height: 700px;
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
            <div style="margin-right: 20px;" class="my-navi cell-list" align="center">판매 목록</div>
            <div style="margin-right: 20px;" class="my-navi wish-list" align="center">찜한 상품</div>
            <div style="margin-right: 20px;" class="my-navi inquiry-list" align="center">문의 목록</div>   
            <div style="margin-right: 20px;" class="my-navi select-navi" align="center">신고 목록</div>
        </div>
        <div id="main" class="cont">
        	<h1>문의 목록</h1>
	        <table class="area-no">
	            <thead>
	                <tr>
                        <th width="110" height="40">NO</th>
                        <th width="500">제목</th>
                        <th width="150">작성자</th>
                        <th width="150">작성일</th>
                        <th width="150">조회수</th>
                    </tr>
	            </thead>
	            <tbody align="center">
	            	<!-- case1. 공지글이 없을 경우 -->
	               	<% if(list.isEmpty()) { %>
		               	<tr>
		                	<td colspan="5">존재하는 블랙리스트가 없습니다.</td>
		           	    </tr>
	                <% } else { %>
		             	 <!-- case2. 공지글이 있을 경우-->
		                <% for(BlackList b : list) { %>
		                    <tr class="listtr">
		                        <td height="40"><%= b.getBlNo() %></td>
		                        <td height="40"><%= b.getBlTitle() %></td>
		                        <td height="40"><%= b.getBlWriter() %></td>
		                        <td height="40"><%= b.getBlDate() %></td>
		                        <td height="40"><%= b.getCount() %></td>
		                    </tr>
						<% } %>
	                <% } %>  
	            </tbody>
	        </table>
	        <div align="right" class="slist-button">
	            <button id="page-back">뒤로가기</button>
	        </div>
        </div>
        
    </div>
    
     <script>
        $(function(){
            $("selectAll").click(function(){
                if($(this).is(':checked')){
                    $("input[name=bno]").prop("checked",true);
                }else{
                    $("input[name=bno]").prop("checked",false);
                }
            })
        })
        
        $("#page-back").click(function(){
        		history.back();
        })
        
        $(function(){
		 	$(".my-page").click(function() {
				location.href="<%=contextPath %>/myPage.me";
			});
		 	
			$(".cell-list").click(function() {
				location.href="<%=contextPath %>/myCellList.bo";
			});
			
		 	$(".wish-list").click(function() {
				location.href="<%=contextPath %>/wishList.bo";
			});
		 	
			 	
			$(".inquiry-list").click(function() {
				location.href="<%=contextPath %>/myList.qa";
			});
	 		
			$(".listtr").click(function(){
				const num = $(this).children().eq(0).text();
					location.href = '<%= contextPath %>/DetailView.bl?num='+num;
			})
        })
    </script>
<%@ include file="../common/footerbar.jsp" %>
</body>
</html>