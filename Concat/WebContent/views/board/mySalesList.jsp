<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <br>
        <h1>판매 내역</h1>
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
                <tr>
                    <td height="100">80x80</td>
                    <td style="font-size: 15px; font-weight: bold;">판매중</td>
                    <td><h3>상품명</h3><h5>브랜드명</h5></td>
                    <td style="color: #ff006c;"><h4>27,000원</h4></td>
                </tr>
                <tr>
                    <td height="100">80x80</td>
                    <td style="font-size: 15px; font-weight: bold;">판매중</td>
                    <td><h3>상품명</h3><h5>브랜드명</h5></td>
                    <td style="color: #ff006c;"><h4>27,000원</h4></td>
                </tr>
                <tr>
                    <td height="100">80x80</td>
                    <td style="font-size: 15px; font-weight: bold;">판매중</td>
                    <td><h3>상품명</h3><h5>브랜드명</h5></td>
                    <td style="color: #ff006c;"><h4>27,000원</h4></td>
                </tr>
            </tbody>
        </table>
        <div align="right" class="slist-button">
            <button>뒤로가기</button>
        </div>
    </div>
    
     <script>
        $(function(){
            $("selectAll").click(function(){
                if($(this).is(':checked')){
                    console.log("안되냐?");
                    $("input[name=bno]").prop("checked",true);
                }else{
                    console.log("안되냐고?");
                    $("input[name=bno]").prop("checked",false);
                }
            })
        })
    </script>
</body>
</html>