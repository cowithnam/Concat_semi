<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    .outer2{
        width: 1100px;
        margin: auto;
    }

    .head2{
        text-align: center;
    }

    .insert-black{
        margin: auto;
    }

    .insert-black input{
        width: 515px;
        height: 30px;
        font-size: 15px;
    }

    .insert-black,.insert-black td,.insert-black th {
        border-collapse : collapse;
    }

    .insert-black tr{
        border-bottom: 1px solid lightgray;
    }

    .insert-black td,.insert-black th{
        padding: 12px 0px;
    }

    .insert-black td{
        width: 550px;
    }

    .insert-black th{
        text-align: left;
        padding-left: 10px;
    }

    input[type=radio]{
	    display: none;
	}

	label{
        font-size: 3em;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
	}
	label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#score{
        direction: rtl;
        text-align: left;
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

    button:hover{
        cursor: pointer;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer2">
        <div class="head">
            <h1 style="text-align: center;">후기 작성</h1>
            <hr style="width: 720px;">
            <div class="head2">
            	<% if(loginMember != null){ %>
                <p><h3><%= loginMember.getNickname() %>님,  거래는 어떠셨나요 ?</h3></p>
                <% } %>
                <p><h3>후기를 작성해주세요</h3></p>
            </div>
        </div>

        <form action="<%= contextPath %>/insert.re" method="post" enctype="multipart/form-data">
            <table class="insert-black">
                <tr>
                    <th height="50">리뷰제목</th>
                    <td >
                        <input type="text" name="title" placeholder="리뷰제목" required maxlength="20">
                    </td>
                </tr>
                <tr>
                    <th height="50">판매자 아이디</th>
                    <td>
                        <input type="text" name="cellId" placeholder="판매자 아이디" required maxlength="10">    
                    </td>
                </tr>
                <tr>
                    <th height="175">리뷰 내용</th>
                    <td>
                        <textarea name="content" cols="75" rows="10" style="resize: none;" placeholder="리뷰내용" required></textarea>
                    </td>
                </tr>

                <tr>
                    <th height="50">평점을 입력해주세요</th>
                    <td>
                        <div style="font-size: large; font-weight: 600;" id="score">
                            <input type="radio" name="score" value="5" id="rate1" required><label
                                for="rate1">★</label>
                            <input type="radio" name="score" value="4" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="score" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="score" value="2" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="score" value="1" id="rate5"><label
                                for="rate5">★</label>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th width="170" height="150">첨부이미지</th>
                    <td width="830">
                        <div class="img-area">
                            <img src="resources/image/noneImg.png" width="180" height="180" id="productImg" required onclick="chooseFile()">
                            <div id="file-area" style="display: none;">
                                <input id="file" type="file" name="file" onchange="loadImg(this);" required>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <br>
            <input type="hidden" name="memNo" value="<%= loginMember.getMemNo() %>">
            <div class="btn" style="text-align: center;">
                <button type="submit" style="width: 100px; height: 40px; background-color: black; color: white;" >작성하기</button>
                <button type="reset" style="width: 100px; height: 40px; background-color: black; color: white;" name="btn2">취소</button>
                <button type="button" style="width: 100px; height: 40px; background-color: black; color: white;" onclick="history.back();">뒤로가기</button>  
            </div>
        </form>
    </div>
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
                    $("#productImg").attr("src", e.target.result);
                }
            }else{
                $("#productImg").attr("src", "resources/image/noneImg.png");
            }
        }
    </script>
<%@ include file="../common/footerbar.jsp" %>
</body>
</html>