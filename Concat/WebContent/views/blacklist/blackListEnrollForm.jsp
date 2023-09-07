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
<body style="position: relative;">

    <%@ include file="../common/menubar.jsp" %>

    <br>
    <div class="outer2">
    
        <div>
            <h1 align="center" class="title1"><b>블랙리스트 신고글 작성</b></h1>
        </div>

        <form action="<%= contextPath %>/insert.bl" method="post" enctype="multipart/form-data">
            <table class="insert-black">
                <tr>
                    <th height="50">신고제목</th>
                    <td >
                        <input type="text" name="title" placeholder="신고제목" required>
                    </td>
                </tr>
                <tr>
                    <th height="50">신고아이디</th>
                    <td>
                        <input type="text" name="blackId" placeholder="신고대상" required>    
                    </td>
                </tr>
                <tr>
                    <th height="175">신고내용</th>
                    <td>
                        <textarea name="content" cols="75" rows="10" style="resize: none;" required></textarea>
                    </td>
                </tr>
                <tr>
                    <th width="170" height="150">첨부이미지</th>
                    <td width="830">
                        <div class="img-area">
                            <img src="resources/image/noneImg.png" width="180" height="180" id="productImg" onclick="chooseFile()">
                            <div id="file-area" style="display: none;">
                            	<input id="file" type="file" name="file" onchange="loadImg(this);">
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <br>
            <input type="hidden" name="userNo" value="<%= loginMember.getMemNo() %>">
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