<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/회원가입</title>
<style>
@import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");


* {
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  line-height: 1.5em;
  color: black;
  font-family: "Open Sans", sans-serif;
  font-size: 15px;
}
body {
  height: 100vh;
  display: flex;
}
.main {
  width: 1300px;
  height: 800px;
  margin: auto;
  border-radius: 10px;
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
  transition: all 0.1s ease-in 0.1s;
  margin: auto;
}
/* PAGE HOME */
.home {
  width: 1300px;
  height: 800px;
  border-radius: 10px;
  color: lightgray;
  background: black;
  display: flex; 
  flex-flow: column wrap;
  justify-content: center;
  align-items: center;
  

  opacity: 1;
  transition: all 0.4s ease-in 0.2s;
}
.home h1 {
  margin-bottom: 80px;
  color: white;
  text-align: center;
}
.home h1 span {
  color: white;
  display: block;
  font-size: 2.5em;
  font-family: "Abril Fatface", cursive;
}
.home p {
  margin-top: 100px;
}
.home p a {
  color: white;
}
a.link-copy {
  text-decoration: none;
}
.btn {
  background: none;
  border: 2px solid white;
  border-radius: 150px;
  width: 300px;
  padding: 8px 16px;
  margin: 16px;
  color: white;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.1s ease-in-out 0.1s;
}
.btn:hover {
  background: white;
  color: black;
}

/* 회원가입 */
.sign-up {
  display: none;
  opacity: 1;
  width: 100%;
  height: 100%;
}
.signup-left {
  width: 50%;
  opacity: 0;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-between;
  font-size: 14px;
  background: black;
  border-radius: 10px 0 0 10px;
  transition: all 0.5s ease-in 0.2s;
}
.signup-left h1 {
  font-size: 21px;
  font-family: "Abril Fatface", cursive;
  letter-spacing: 2px;
}
.signup-left h1,
.signup-left div,
.signup-left h3,
.signup-left p {
  color: white;
}
.signup-left h3 {
  font-size: 2.2em;
}

.btn-back {
  align-self: flex-start;
  display: flex;
  align-items: center;
  font-weight: bold;
  cursor: pointer;
}
.angle-left-color {
  color: white;
  margin-right: 5px;
}
.form-area {
  position: absolute;
  top: 10%;
  left: 38%;
  width: 25%;
  height: 80%;
  padding: 20px 0;
  background: white;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  z-index: 2;

  opacity: 0;
  transition: opacity 0.5s ease-in 0.2s;
}
.organize-form {
  width: 100%;
  height: 100%;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-around;
  align-items: center;
}
.organize-form h2 {
  font-size: 1.4em;
  font-weight: normal;
}
.organize-form h2::after {
  content: "";
  display: block;
  width: 50%;
  height: 2px;
  background: black;
  margin: 0 auto;
}
.organize-form p a {
  color:  black;
  text-decoration: none;
  font-weight: bold;
}
.form-area-signup {
  opacity: 0;
  transition: all 0.4s ease-in 0.2s;
}
.form-area-signin {
  opacity: 0;
  transition: all 0.4s ease-in 0.2s;
}

.form {
  width: 85%;
}
.form-field {
  display: flex;
  flex-flow: column wrap;
  width: 100%;
}
.form-field input {
  border: none;
  padding: 5px;
  border-bottom: 1px solid rgba(116, 116, 116, 0.44);
  height: 30px;
  transition: border-bottom 0.1s ease-in-out 0.1s;
}
.form-field input:focus {
  border-bottom: 1px solid rgb(249, 63, 76);
}
.form-field label {
  position: relative;
  top: 25px;
  left: 5px;
  cursor: text;
  transition: all 0.2s ease-in-out 0.1s;
  color: rgba(116, 116, 116, 0.44);
  user-select: none;
}
.btn-sign {
  border: none;
  background: black;
  color: white;
  font-weight: bold;
  width: 100%;
  padding: 10px;
  margin-top: 20px;
  border-radius: 50px;
  cursor: pointer;
  transition: background 0.1s ease 0.1s;
}
.btn-sign:hover {
  background: lightgray;
}
.signup-right {
  width: 50%;
  padding: 20px;
  background: white;
  border-radius: 0 10px 10px 0;
  display: flex;
  flex-flow: column wrap;
  justify-content: space-between;
  align-items: flex-end;
  background-image: url("resources/image/거래사진.jpg"); 
  background-size: 70%;
  background-repeat: no-repeat;
  background-position: 235% 50%;

  opacity: 0;
  transition: opacity 0.5s ease-in 0.2s, background-position-x 0.5s ease-in 0.2s;
}
.bars-style {
  color: rgb(249, 63, 76);
  cursor: pointer;
  font-size: 16px;
}

@media (max-width: 1023px) {
  .main {
    width: 100%;
    height: 100%;
  }
  .home, .signup-left { border-radius: 0; }
  .form-area {
    left: 35%;
    width: 30%;
    height: 70%;
  }
}
@media (max-width: 768px) {
  .form-area {
    left: 20%;
    width: 60%;
  }
  .wc_message {
    opacity: 0;
    transition: opacity .1s;
  }
}

@media (max-width: 375px) {
  .form-area {
    left: 10%;
    width: 80%;
  }
}

::placeholder{
  color: lightgray;
}

.idCheck{
	background-color: black;
	color: white;
	border-radius: 10px;
	margin-top: 2px;
}
</style>
    
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
	<% if(alertMsg != null){ %>
			<script>
				alert("<%= alertMsg %>");
			</script>
			<% session.removeAttribute("alertMsg"); %>
	<% } %>
	<main class="main">
    <section class="home">
      <img src="resources/image/concat.png" style="width: 300px; height: 300px;">
      <button id="sign-up" class="btn" >로그인</button>
      <button id="sign-in" class="btn">회원가입</button>
      <p><a class="link-copy" href="<%=request.getContextPath() %>" target="_blank">메인페이지로</a></p>
    </section>
  
    <section class="sign-up">
      <article class="signup-left">
        <h1>ConCat</h1>
        <div class="wc_message">
          <h3>ConCat 마켓</h3>
          <p>에 오신걸 환영합니다.</p>
        </div>
        <div class="btn-back">
          <i class="fas fa-2x fa-angle-left angle-left-color"></i>
          HOME
        </div>
      </article>
  
      <article class="form-area">
        <!-- 로그인폼 -->
        <div class="organize-form form-area-signup">
          <h2>로그인</h2>
          <form class="form" action="<%= request.getContextPath() %>/loginset.me" method="post" name="idfindscreen">
            <div class="form-field" style="width: 350px; margin: auto;">
              <label for="id">아이디</label>
              <input type="text" id="id" name="memId" minlength="4" maxlength="12" required/>
            </div>
            <br>
  
            <div class="form-field" style="width: 350px; margin: auto;">
              <label for="password">비밀번호</label>
              <input type="password" id="password" name="memPwd" minlength="6" maxlength="15" required/>
            </div>
            <br>
  
            <button type="submit" class="btn-sign" onclick="loginclick();">로그인</button>
          </form>
          <p>아이디가 없으신가요 ? <a href="#" class="link-in">회원가입</a></p>
          <p>아이디를 잊어버리셨나요 ? <a href="<%=request.getContextPath() %>/seachid.me" class="idfind">아이디찾기</a></p>
          <p>비밀번호를 잊어버리셨나요 ? <a href="<%=request.getContextPath() %>/seachpwd.me" class="pwdfind">비밀번호찾기</a></p>
  
        </div>
  
        <!-- 회원가입폼 -->
        <div class="organize-form form-area-signin" id="test">
          <h2>회원가입</h2>
          <form class="form" action="<%=request.getContextPath()%>/memberjoin.me" method="post" id="enrollform" >
            <div class="form-field">
              <input type="text" name="memId" id="memId" placeholder="아이디 : 영문자,숫자 포함 4~12자 입력" minlength="4" maxlength="12" required/>
              <button type="button" onclick="idCheck();" class="idCheck">중복확인</button>
              <br>
            </div>
  
            <div class="form-field">
              <input type="password" name="memPwd1" id="memPwd1" placeholder="비밀번호 : 영문자,숫자,특수문자 포함 6자~15자 입력" required /> <br>
            </div>
            <div class="form-field">
              <input type="password" name="memPwd" id="memPwd2" placeholder="위의 비밀번호와 일치되게 입력"required /> <br>
            </div>
            <div class="form-field">
              <input type="text" name="memName" id="memName" placeholder="이름 : 한글 2글자 ~ 5글자 입력"  required/> <br>
            </div>
            <div class="form-field">
              <input type="text" name="nickName" id="nickName" placeholder="닉네임 : 한글 2 ~ 5글자, 영어,숫자 15글자 입력" required/> <br>
            </div>
            <div class="form-field">
              <input type="email" name="email" id="email" placeholder="이메일 : 이메일형식에 맞게 입력" required/> <br>
            </div>
            <div class="form-field">
              <input type="text" name="phone" id="phone" onKeyup = "addHypen(this);" placeholder="전화번호 : -빼고 입력" required/>
            </div>
    
            <button type="submit" class="btn-sign btn-up" onclick="joinClick();">회원가입</button>
            <br>
            <div>
              <br>
              <input type="checkbox" required>  Concat마켓의 이용약관 및 정보이용에 동의합니다.(필수)
            </div>
          </form>
          <p>아이디가 있으신가요 ? <a href="#" class="link-up">로그인</a></p>
        </div>
      </article>
  
      <article class="signup-right">
        <i class="fas fa-2x fa-bars bars-style"></i>
        <p><a class="link-copy" href="<%=request.getContextPath() %>" target="_blank">메인페이지로</a></p>
  
      </article>
    </section>
  </main>

      <script>
        // Elements
        const el = {
        signUpHome: document.getElementById('sign-up'),
        signInHome: document.getElementById('sign-in'),
        btnHome: document.querySelector('.btn-back'),
        pageMain: document.querySelector('.main'),
        pageHome: document.querySelector('.home'),
        pageSignUp: document.querySelector('.sign-up'),
        formArea: document.querySelector('.form-area'),
        sideSignLeft: document.querySelector('.signup-left'),
        sideSignRight: document.querySelector('.signup-right'),
        formSignUp: document.querySelector('.form-area-signup'),
        formSignIn: document.querySelector('.form-area-signin'),
        linkUp: document.querySelector('.link-up'),
        linkIn: document.querySelector('.link-in'),
        btnSignUp: document.querySelector('.btn-up'),
        btnSignIn: document.querySelector('.btn-in'),
        labels: document.getElementsByTagName('label'),
        inputs: document.getElementsByTagName('input'),
        };


        // ADD Events
        // Show the page Sign Up
        el.signUpHome.addEventListener('click', function(e) {
        showSign(e, 'signup');
        });
        el.linkUp.addEventListener('click', function(e) {
        showSign(e, 'signup');
        });

        // Show the page sign in
        el.signInHome.addEventListener('click', function(e) {
        showSign(e, 'signin');
        });
        el.linkIn.addEventListener('click', function(e) {
        showSign(e, 'signin');
        });
        el.btnSignUp.addEventListener('click', function(e) {
        showSign(e, 'signin');
        });

        // Show the page Home
        el.btnHome.addEventListener('click', showHome);


        // Functions Events
        // function to show screen Home
        function showHome(event) {
        
        
        setTimeout(function() {
            el.sideSignLeft.style.padding = '0';
            el.sideSignLeft.style.opacity = '0';
            el.sideSignRight.style.opacity = '0';
            el.sideSignRight.style.backgroundPositionX = '235%';

            el.formArea.style.opacity = '0';
            setTimeout(function() {
            el.pageSignUp.style.opacity = '0';
            el.pageSignUp.style.display = 'none';
            for (input of el.inputs)  {
                input.value = '';
            }
            }, 900);

        }, 100);

        setTimeout(function() {
            el.pageHome.style.display = 'flex';
        },1100);
        
        setTimeout(function() {
            el.pageHome.style.opacity = '1';
        }, 1200);

        }
        // function to show screen Sign up/Sign in
        function showSign(event, sign) {

        if (sign === 'signup') {
            el.formSignUp.style.display = 'flex';
            el.formSignIn.style.opacity = '0';
            setTimeout(function() {
            el.formSignUp.style.opacity = '1';
            }, 100);
            el.formSignIn.style.display = 'none';

        } else {
            el.formSignIn.style.display = 'flex';
            el.formSignUp.style.opacity = '0';
            setTimeout(function() {
            el.formSignIn.style.opacity = '1';
            }, 100);
            el.formSignUp.style.display = 'none';
        }

        el.pageHome.style.opacity = '0';
        setTimeout(function() {
            el.pageHome.style.display = 'none';
        }, 700);
        
        setTimeout(function() {
            el.pageSignUp.style.display = 'flex';
            el.pageSignUp.style.opacity = '1';
            
            setTimeout(function() {
            el.sideSignLeft.style.padding = '20px';
            el.sideSignLeft.style.opacity = '1';
            el.sideSignRight.style.opacity = '1';
            el.sideSignRight.style.backgroundPositionX = '230%';

            el.formArea.style.opacity = '1';
            }, 10);

        }, 900);
        }

        // Behavior of the inputs and labels
        for (input of el.inputs) {

	        input.addEventListener('keydown', function() {
	            this.labels[0].style.top = '10px'
	        });
	        input.addEventListener('blur', function() {
	            if (this.value === '') {
	            this.labels[0].style.top = '25px'
	            }
	        })
        }
        
     
      </script>
      
      <script>
	    function addHypen(obj) {
		    var number = obj.value.replace(/[^0-9]/g, "");
		    var phone = "";
	
		    if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}
    </script>
    
    <script>
    		function idCheck(){
    			
    			const $idInput1 = $("#enrollform input[name=memId]");
    			
    			
    			$.ajax({
    				url:"idCheck.me",
    				data:{checkId:$idInput1.val()},
    				success:function(result){
    					if(result == 'NNNNN'){ //실패
                alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
    						$idInput1.focus();
    					}else{ // 성공
    						if(confirm("사용가능한 아이디입니다. 사용하시겠습니까 ? ")){
    							$("#enrollform :submit").removeAttr("disabled");
    							$idInput1.attr("readonly", true);
    						}else{
    							$idInput1.focus();
    						}
    					}
    				},
    				error:function(){
    					console.log("실패야 이자식아")
    				}
    				
    			})	
        	}
    		
    </script>
    
    <script>
    	function joinClick(){
    		const idInput = document.querySelector("#memId");
        	const pwdInput1 = document.querySelector("#memPwd1");
    		const pwdInput2 = document.querySelector("#memPwd2");
        	const nameInput = document.querySelector("#memName");
        	const nickInput = document.querySelector("#nickName");
        	const emailInput = document.querySelector("#email");
        	const phoneInput = document.querySelector("#phone");
			console.log(idInput);
	        // 1) 아이디 검사
	        let regExp = /^[a-z][a-z\d]{3,11}$/;
	        if(!regExp.test(idInput.value)){
	            alert("맞는 형식의 아이디를 입력해주세요.");
	            idInput.select();
	            return false;
	        }
	        
	        // 2) 비밀번호 검사
	        regExp =/^[a-z\d!@#$%^&*]{6,15}$/i;
	        if(!regExp.test(pwdInput1.value)){
	            alert("맞는 형식의 비밀번호를 입력해주세요.");
	            pwdInput1.value = "";
	            pwdInput1.focus();
	            return false;
	        }
	
	        // 3) 비밀번호 일치여부 확인
	        if(pwdInput1.value != pwdInput2.value){
	            alert("비밀번호가 일치하지 않습니다.");
	            pwdInput2.value="";
	            pwdInput2.focus();
	            return false;
	        }
	
	        // 4) 이름
	        regExp =/[가-힣]{2,}/;
	        if(!regExp.test(NameInput.value)){
	            alert("맞는 형식의 이름을 입력해주세요.");
	            NameInput.select();
	            return false;
	        }
	
	        // 5) 닉네임
	        regExp =/^[가-힣\w!@#$%^&*]{2,15}$/i;
	        if(!regExp.test(nickInput.value)){
	          alert("맞는 형식의 닉네임을 입력해주세요.");
	          pwdInput2.value="";
	          pwdInput2.focus();;
	          return false;
	        }
	
	        // 6) 전화번호
	        regExp = /^[\d]{,13}$i/;
	          if(!regExp.test(phoneInput.value)){
	            alert("맞는 형식의 전화번호를 입력해주세요.");
	            phoneInput.value = "";
	            phoneInput.focus();
	            return false;
	        }
	
	    	}

      function loginclick() {
        const login1 = document.querySelector("id");
        const login2 = document.querySelector("password");

         // 1) 아이디 검사
        let regExp = /^[a-z][a-z\d]{3,11}$/;
        if(!regExp.test(login1.value)){
            alert("맞는 형식의 아이디를 입력해주세요.");
            login1.select();
            return false;
        }
        
        // 2) 비밀번호 검사
        regExp =/^[a-z\d!@#$%^&*]{8,15}$/i;
        if(!regExp.test(login2.value)){
            alert("맞는 형식의 비밀번호를 입력해주세요.");
            login2.value = "";
            login2.focus();
            return false;
        }
        
	
	    	}

      function loginclick() {
        const login1 = document.querySelector("id");
        const login2 = document.querySelector("password");

         // 1) 아이디 검사
        let regExp = /^[a-z][a-z\d]{3,11}$/;
        if(!regExp.test(login1.value)){
            alert("맞는 형식의 아이디를 입력해주세요.");
            login1.select();
            return false;
        }
        
        // 2) 비밀번호 검사
        regExp =/^[a-z\d!@#$%^&*]{8,15}$/i;
        if(!regExp.test(login2.value)){
            alert("맞는 형식의 비밀번호를 입력해주세요.");
            login2.value = "";
            login2.focus();
            return false;
        }
        
      }
    </script>
	
</body>
</html>