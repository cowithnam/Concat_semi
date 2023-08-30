<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://www.eicn.co.kr/theme/basic/css/default.css?ver=171222">
	<link rel="stylesheet" href="http://www.eicn.co.kr/skin/board/estimate/style.css?ver=171222">
<style>

    #outer{
        width: 1100px;
        height: 800px;
        margin: auto;
    }

    div{
        box-sizing: border-box;
    }
    
    .btn_confirm write_div{
        margin: auto;
        text-align: center;
        
        
    }

</style>

</head>
<body style="position: relative;">

    <%@ include file="../common/menubar.jsp" %>

        <div id="outer">
            <h1 align="center"><b>블랙리스트 신고글 작성</b></h1>
            
     	<form action="<%= contextPath %>/insert.bl" method="post" enctype="multipart/form-data">
       		<div id="content">

            <section id="bo_w" style="width: 1000;">
                
            <div class="bo_w_tit write_div">
            		<input type="hidden" name="userNo" value="<%= loginMember.getMemNo() %>">
            
                    <div>
                        <label class="bo_w_title" for="wr_1"><h1><b>제목</b></h1></label>
                        <br><br>
                        <input type="text" name="title" id="wr_1" class="frm_input required" required>
                    </div>
                    
                    <br>
                    
                    <div>
                        <label class="bo_w_title" for="wr"><b>신고 아이디<b></b></label>
                        <br><br>
                        <input type="text" name="blackId" id="wr" class="frm_input required"  placeholder="신고대상">
                    </div>
                    
                    <br>
                    
                    <div class="wr_content ">
                    	신고내용
                    	<br> 
                        <textarea id="wr_content" name="content" style="width:100%; height:300px; resize: none;" placeholder="신고내용">
                        
                        </textarea>                        
                    </div>

					<div>
						첨부파일
						<br>
                        <input type="file" name="file">
                	 </div>
            
	                <div class="btn_confirm write_div" style="text-align: center;">
	                        <button type="submit" style="width: 100px; height: 40px; background-color: black; color: white;" >작성하기</button>
	                        <button type="reset" style="width: 100px; height: 40px;" name="btn2">취소</button>
	                        <button type="button" style="width: 100px; height: 40px;" onclick="history.back();">뒤로가기</button>  
	                </div>
                </div>
	            </section>
	            </div>
          	</form>
		</div>
    
</body>
</html>