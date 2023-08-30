<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
            #outer {
                width: 1100px;
                height: 600px;
                margin: auto;
            }

            h1 {
                display: inline;
            }

            #no-search {
                float: right;
                position: relative;
                top: 20px;
            }

            #no-search>input {
                width: 200px;
                height: 20px;
                position: relative;
                bottom: 2px;
            }

            #no-search>button {
                height: 26px;
                background-color: black;
                color: white;
                font-weight: bold;
            }

            table {
                width: 1100px;
                height: 500px;
            }

            table * {
                text-align: center;
                padding: 0px;
            }

            thead {
                background-color: black;
                color: white;
                
            }

            .num {
                width: 110px;
                height: 41px;
            }

            .title {
                width: 660px;
                height: 41px;
                text-align: left;
                padding-left: 10px;
            }

            table td {
                width: 140px;
                height: 41px;
               
                border-bottom: 1px solid black;
                
            }



            .enroll-btn {
                width: 80px;
                height: 40px;
                background-color: black;
                color: white;
                font-size: 16px;
                font-weight: bold;
                border-radius: 5px;
                margin-top: 5px;
                margin-right: 2px;
            }

            #custom-menu {
                position: fixed;
                left: -5px;
                top: 400px;

            }


            .faq-container{
                width: 1100px;
                height: 600px;
                
            }
            .faq-container>div{
                width: 800px;
                height: 50px;
                border: 0.5px solid black;
                margin: 20px;
                border-radius: 10px;
            }
            .faq{
                
            }
          
            .faq-top>.faq-1{float: left;
                width: 25%;
            }
            .answer{
                display: none;
            }
           







        </style>
    </head>

    <body>
        <%@ include file="../common/menubar.jsp" %>

            <br><br>

            <div id="outer">
                <h1>FAQ</h1>


                <form action="" id="no-search">
                    <input type="text">
                    <button type="submit">검색</button>
                </form>

                <hr>
                <div>
                <table class="area-no" style="height: 10px;">
                    <thead>
                        <tr>
                            <th class="num" width="15%">NO</th>
                            <th  width="60%">제목</th>
                            <th  width="15%">작성일</th>
                            <th  width="15%">조회수</th>
                        </tr>
                    </thead>
                        
                    <tbody>
                <tr class="faq">
                    <td >
                       글번호
                    </td>
                    <td >
                       제목
                    </td>
                    <td >
                       작성일
                    </td>
                    <td >
                       조회수
                    </td>
                </tr>
                <tr class="answer">
                    <td colspan="4">
                        답변
                    </td>
                </tr>
                
               

                

               
               
            </div>
        </tbody>
        </table>
    </body>
    <script>
        $(function(){
            $('.faq').click(function(){
                const $.answer
            })
            
        })

    </script>

    </html>