<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .head{
        width: 1000px;
        height: 300px;
        margin: auto;
    }
    
    .head1{
        text-align: center;
        width: 300px;
        height: 300px;
        float: left;
        margin-left: 50px;
    }

    .head2{
        width: 600px;
        height: 100px;
        float: right;
        margin-right: 30px;
    }

    .head1>img{
        margin-top: 20px;
    }

    .head2>p+h2{
        margin-top: 50px;
        margin-left: 20px;
    }

    .head2>p+h3{
        margin-left: 20px;
    }

    .content{
        border: 1px solid black;
        width: 1000px;
        height: 800px;
        margin: auto;
    }

    form>div{
        margin-left: 30px;
        margin-top: 20px;
    }
    
    form button{
        width: 100px;
        height: 50px;
        margin-left: 400px;
        margin-top: 50px;
        background-color: beige;
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<div class="head">
        <div class="head1"> 
        </div>

        <div class="head2">
            <p><h3><%= loginMember.getNickname() %>님,  거래는 어떠셨나요 ?</h3></p>
            <br>
            <p><h3>후기를 작성해주세요</h3></p>
        </div>
    </div>

    <div class="content">
        <form action="<%= contextPath %>/insert.re" method="post" enctype="multipart/form-data">
            	
            <div>
            	<input type="hidden" name="memNo" value="<%= loginMember.getMemNo() %>">
                거래 상대 아이디 :
                <input type="text" name="cellId">
            </div>
            <div><h3>평점을 입력해주세요</h3></div>
            <div style="font-size: large; font-weight: 600;" id="score">
				<input type="radio" name="score" value="5" id="rate1"><label
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
            
            <script>
                $(function(){
                    $("input[type='checkbox']").click(function(){
                        $(this).css("backgroundcolor", "orange");
                    })
                })
            </script>
			
			<div style="margin-top: 40px;">리뷰작성제목</div>
            <div>
          		<textarea name="title" cols="60" rows="4" style="resize: none;">
            	</textarea>
            </div>
			
            <div style="margin-top: 40px;">리뷰작성</div>
            <div>
           		 <textarea name="content" cols="60" rows="10" style="resize: none;">
            	</textarea>
            </div>
            <div style="width: 200px; height: 200px; border: 1px solid gray;">선택한 파일 이미지</div>
            <div>
            	<input type="file" name="file">
            </div>
            <div>
                <input type="checkbox" style="margin-left: 30px;">
                <div style="display: inline; border: 1px solid gray; font-size: large;">리뷰 수집 및 사용 권한 동의</div>
            </div>
            <div>
            	<button type="submit">작성하기</button>
            	<button type="reset">취소하기</button>
            </div>
        </form>
    </div>
</body>
</html>