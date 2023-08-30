<%@page import="concat.brand.model.vo.Brand"%>
<%@page import="concat.category.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Category> categoryList = (ArrayList<Category>) request.getAttribute("categoryList");
	ArrayList<Brand> brandList = (ArrayList<Brand>) request.getAttribute("brandList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            width: 1000px;
            margin: auto;
        }

        .insert-sales input,.insert-sales select{
            width: 200px;
            height: 30px;
            font-size: 15px;
        }

        .insert-sales,.insert-sales td,.insert-sales th {
            border-collapse : collapse;
        }

        .insert-sales tr{
            border-bottom: 1px solid lightgray;
        }

        .insert-sales td,.insert-sales th{
            padding: 12px 0px;
        }

        .insert-sales th{
            text-align: left;
            padding-left: 10px;
        }

        .btn>button{
            width: 120px;
            height: 50px;
            margin-top: 10px;
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
        <br>
        <h1>상품 등록</h1>
        <hr>

        <form action="<%=contextPath %>/salesInsert.bo" method="post" enctype="multipart/form-data">
            <table class="insert-sales">
                <tr>
                    <th width="170" height="300">상품이미지</th>
                    <td width="830">
                        <div class="img-area">
                            <img src="resources/image/noneImg.png" width="200" height="200" id="productImg" required onclick="chooseFile()">
                            <div id="file-area" style="display: none;">
                            	<input id="file" type="file" name="file" onchange="loadImg(this);" required>
                            </div>
                            <div style="font-size: 14px; color: skyblue; margin-top: 13px;">
                                *상품이미지는 한개만 등록 가능합니다.<br>
                                기프티콘의 경우 유효기간이 나타나도록 이미지를 등록해주세요.
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th height="50">상품명</th>
                    <td ><input type="text" name="title" placeholder="상품 이름을 입력해주세요" required></td>
                </tr>
                <tr>
                    <th height="50">카테고리</th>
                    <td>
                        <select name="category" onchange="changeCategory();">
                       		<% for(Category c : categoryList){ %>
                            	<option value="<%=c.getCategoryNo()%>"><%=c.getCategoryName()%></option>
							<% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th height="50">브랜드</th>
                    <td>
                        <select name="brand">
                        	<% for(Brand b : brandList){ %>
                        		<option value="<%=b.getBrandNo()%>"><%=b.getBrandName()%></option>
                        	<% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th height="50">가격</th>
                    <td><input type="number" name="price" required>원</td>
                </tr>
                <tr>
                    <th height="50">유효기간</th>
                    <td><input type="date" name="dueDate" placeholder="YY/MM/DD" required></td>
                </tr>
                <tr>
                    <th height="50">오픈 카카오톡</th>
                    <td><input type="text" name="open" required></td>
                </tr>
                <tr>
                    <th height="175">설명</th>
                    <td>
                        <textarea name="content" cols="110" rows="10" style="resize: none;" required></textarea>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="memNo" value="1">
            <div align="center" class="btn">
                <button>등록하기</button>
            </div>
        </form>
    </div>
    
    <script>
     	function chooseFile(){
    		$("#file").click();
    	}
     	
     	function loadImg(inputFile){
     		if(inputFile.files.length == 1){
     			const reader = new FileReader();
     			reader.readAsDataURL(inputFile.files[0]);
     			reader.onload = function(e){
     				console.log(e.target.result)
     				$("#productImg").attr("src", e.target.result);
     			}
     		}else{
     			$("#productImg").attr("src", "resources/image/noneImg.png");
     		}
     	}
     	
     	function changeCategory(){
     		$.ajax({
     			url:"newSelect.bo",
     			data:{categoryNo:$("select[name=category]").val()},
     			success:function(list){
     				let value = "";
     				$("select[name=brand]").html(value);
     				
     				for(let i=0; i<list.length; i++){
     					value += "<option value='"
     					      +list[i].brandNo
     					      + "'>"
     					      + list[i].brandName
     					      +"</option>"
     					$("select[name=brand]").html(value);
     				}
     				
     			},
     			error:function(){
					console.log("에러발생")     				
     			}
     		})
     	}
     	
    </script>
</body>
</html>