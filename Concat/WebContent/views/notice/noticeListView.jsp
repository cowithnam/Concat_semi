<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <style>
        #outer{
            width: 1100px;
            height: 800px;
            margin: auto;
        }	
        
        h1{display: inline;}
        #no-search{
            float: right;
            position: relative;
            top: 20px;
        }

        #no-search>input{width: 200px; height: 20px; position: relative; bottom: 2px;} 

        #no-search>button{height: 26px; background-color: black; color: white; font-weight: bold;}

        table{
            width: 1100px;
            height: 500px;
        }

        table *{text-align: center; padding: 0px;}

        thead{background-color: black; color: white;}

        .num{width: 110px; height: 41px;}
        
        .title{width: 660px; height: 41px; text-align: left; padding-left: 10px;}

        table td{width: 140px; height: 41px; border: 1px solid black;}
		
        .btn1{height: 26px; background-color: black; color: white; font-weight: bold;
            
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div id="outer">
        <h1>공지사항</h1>
    
        <form action="" id="no-search">
            <input type="text"> 
            <button type="submit">검색</button>
        </form>
    
        <hr>
        <div align="right">
        <button class="btn1">작성하기 </button>
        </div>

        <div align="center">
            <table>
                <thead>
                    <tr>
                        <th class="num">NO</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="num" >n.getNO</td>
                        <td class="title">NOTICETITLE</td>
                        <td>CREATEDATE</td>
                        <td>COUNT</td>
                    </tr>
                    <tr>
                        <td class="num">9</td>
                        <td class="title">9번째 공지 입니다.</td>
                        <td>2023-07-14</td>
                        <td>81</td>
                    </tr>
                    <tr>
                        <td class="num">8</td>
                        <td class="title">8번째 공지 입니다.</td>
                        <td>2023-07-07</td>
                        <td>266</td>
                    </tr>
                    <tr>
                        <td class="num">7</td>
                        <td class="title">10번째 공지 입니다.</td>
                        <td>2023-06-15</td>
                        <td>98</td>
                    </tr>
                    <tr>
                        <td class="num">6</td>
                        <td class="title">6번째 공지 입니다.</td>
                        <td>2023-05-15</td>
                        <td>152</td>
                    </tr>
                    <tr>
                        <td class="num">5</td>
                        <td class="title">5번째 공지 입니다.</td>
                        <td>2023-03-17</td>
                        <td>1036</td>
                    </tr>
                    <tr>
                        <td class="num">4</td>
                        <td class="title">4번째 공지 입니다.</td>
                        <td>2023-03-07</td>
                        <td>1445</td>
                    </tr>
                    <tr>
                        <td class="num">3</td>
                        <td class="title">3번째 공지 입니다.</td>
                        <td>2023-02-28</td>
                        <td>139</td>
                    </tr>
                    <tr>
                        <td class="num">2</td>
                        <td class="title">2번째 공지 입니다.</td>
                        <td>2023-02-01	</td>
                        <td>4910</td>
                    </tr>
                    <tr>
                        <td class="num">1</td>
                        <td class="title">1번째 공지 입니다.</td>
                        <td>2023-01-09	</td>
                        <td>180</td>
                    </tr>
                    
                </tbody>
                
            </table>
        </div>
    </div>

</body>
</html>