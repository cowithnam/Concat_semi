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
            width: 800px;
            margin: auto;
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
            margin-right: 5px;
            background-color: black;
            color: white;
            border-radius: 10px;
            font-weight: bolder;
            font-size: 17px;
        }
        
        .slist-button>button:hover{cursor: pointer;}
    </style>
</head>
<body>
<%@ include file = "../common/menubar.jsp" %>
	<div class="outer">
        <br>
        <h1>찜목록</h1>
        <table>
            <thead>
                <tr>
                    <th width="128" height="40"><input type="checkbox" id="selectAll" style="width: 18px; height: 17px;"></th>
                    <th width="168" style="border-left: none;">사진</th>
                    <th width="400">상품명</th>
                    <th width="300">가격</th>
                </tr>
            </thead>
            <tbody align="center">
                <% for(Board b : list){ %>
	                <tr class="wishList">
	                    <td height="100" onclick="event.cancelBubble=true"><input type="checkbox" name="bno" value="<%=b.getBoardNo() %>" style="width: 18px; height: 17px;"></td>
	                    <td><img src="<%=b.getThumbnail() %>" width="80" height="80"></td>
	                    <td><h3><%=b.getBoardTitle() %></h3><h5><%=b.getBrand() %></h5></td>
	                    <td style="color: #ff006c;"><h4><%=b.getPrice() %></h4></td>
	                	<input type="hidden" name="bno" value="<%=b.getBoardNo() %>">
	                </tr>
	            <% } %>
            </tbody>
        </table>
        <div align="right" class="slist-button">
            <button type="button" id="delete">삭제하기</button>
            <button type="button" id="page-back">뒤로가기</button>
        </div>
    </div>

    <script>
        $(function(){
            $("#selectAll").click(function(){
            	   if($(this).is(':checked')){
                       $("input[name=bno]").prop("checked",true);
                   }else{
                       $("input[name=bno]").prop("checked",false);
                   }
            })

            $(".wishList").click(function(){
		       	location.href="<%=contextPath %>/detail.bo?bno="+$(this).children("input").val();
            });
        
        	$("#delete").click(function(){
	    		let checkBoxArr = [];
        		if(confirm("위시리스트를 삭제하시겠습니까?")){
        			
        			$("input:checkbox[name=bno]:checked").each(function(){
        				checkBoxArr.push($(this).val());
        			})
	        		
        			console.log(checkBoxArr);
        			
        			$.ajax({
        				url:"deleteWish",
        				traditional: true,
        				data:{arr:checkBoxArr},
        				success:function(result){
        					document.location.href = document.location.href;
        				},
        				error:function(){
        					console.log("삭제 오류")
        				}
        			})
        		}
        	})
        	
        	$("#page-back").click(function(){
        		history.back();
        	})
        })
        
  	</script>

</body>
</html>