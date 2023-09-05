<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Concat</title>
<style>
  #content{
  	width: 1500px;
  	height: 600px;
  	margin: auto;
  	padding-left: 117px;
  }
  .list-area{
  	width: 1400px;
  	margin: auto;
    padding-left: 70px;
  }
    
  .thumbnail:hover{
  	cursor: pointer;
  	opacity: 0.7;
  }

  .thumbnail{
  	border: 1px solid lightgray;
   	width: 220px;
   	height: 270px;
   	padding-top: 7px;
   	margin: 10px;
  	display: inline-block;
   	border-radius: 5px;
  }
</style>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	
	<br>
	<div id="content">
    	<div id="banner">
     		<span id="span1">Concat</span>
     		<span id="span2">사람과 사람 사이를 이어주다</span>
        </div>
        <div>
            <div class="new-title">
                <br>
                <h2 style="padding-left: 10px">최신 상품</h2>
                <hr>
            </div>
            <div class="list-area">
            </div>
        </div> 
    </div>
    
    <script>
   		window.onload = function() {
    		$.ajax({
    			url:"main.bo",
    			success:function(list){
    				console.log(list);
    				let div = "";
    				if(!list.isEmpty){
	    				for(let i=0; i<list.length;i++){
	    					div += "<div class='thumbnail' align='center'><img src='"
	    					      + list[i].thumbnail + "' width='200' height='180' style='border-radius: 5px;'>"
	    					      + " <span style='font-size: 11px;'>[" + list[i].brand + "]</span> <br>"
	    					      + "<span style='font-size: 20px; font-weight: bolder;'>"
	    					      + list[i].boardTitle + "</span> <br>"
	    					      + "<span style='font-size: 15px; font-weight: bold; margin-bottom: 20px;'>"
	    					      + list[i].price + "</span></div>"
	    				}
    				}
    				$(".list-area").html(div);
    			},
    			error:function(){
    				console.log("오류 났습니다")
    			}
    		})
    	};
    </script>
	
</body>
</html>