<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인/회원가입</title>
<style>
@import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

/* font-family: 'Abril Fatface', cursive;
font-family: 'Open Sans', sans-serif; */

* {
  margin: 0;
  padding: 0;
  outline: none;
  box-sizing: border-box;
  line-height: 1.5em;
  color: lightgray;
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
  /* display: flex; */
  /* background: rgb(249, 63, 76); */
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
  display: flex; /* flex or none */
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
  align-self: center;
  width: 200px;
  padding: 8px 16px;
  margin: 14px;
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
  display: none; /*flex or none*/
  opacity: 1;
  width: 100%;
  height: 100%;
}
.signup-left {
  width: 50%;
  /* padding: 20px; */
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
  /* display: none; */
  opacity: 0;
  transition: all 0.4s ease-in 0.2s;
}
.form-area-signin {
  /* display: none; */
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
  width: 80%;
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
/*     display: none; */
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
    </style>
</head>
<body>
	<main class="main">
    <section class="home">
      <img src="resources/image/concat.png" style="width: 300px; height: 300px;">
      <button id="sign-up" class="btn">로그인</button>
      <button id="sign-in" class="btn">회원가입</button>
      <p><a class="link-copy" href="http://localhost:8001/Concat/#" target="_blank">메인페이지로</a></p>
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
          <form class="form" action="<%=request.getContextPath()%>/loginset.me" method="post">
            <div class="form-field" style="width: 350px; margin: auto;">
              <label for="id">아이디</label>
              <input type="text" id="id" name="memId" required/>
            </div>
            <br>
  
            <div class="form-field" style="width: 350px; margin: auto;">
              <label for="password">비밀번호</label>
              <input type="password" id="password" name="memPwd" required/>
            </div>
            <br>
  
            <button type="submit" class="btn-sign btn-up" style="width: 300px;">로그인</button>
          </form>
          <p>아이디가 없으신가요 ? <a href="#" class="link-in">회원가입</a></p>
          <p>아이디를 잊어버리셨나요? ? <a href="#" class="idfind">아이디찾기</a></p>
  
        </div>
  
        <!-- 회원가입폼 -->
        <div class="organize-form form-area-signin">
          <h2>회원가입</h2>
          <form class="form" action="<%=request.getContextPath()%>/memberjoin.me" method="post">
            <div class="form-field">
              <label for="id"></label>
              <input type="text" name="id_in" id="id-in" placeholder="아이디를 입력해주세요" required/>
            </div>
  
            <div class="form-field">
              <label for="password-in">비밀번호</label>
              <input type="password" name="password_in" id="password-in" required />
            </div>
            <div class="form-field">
              <label for="password1-in">비밀번호 확인</label>
              <input type="password" name="password1_in" id="password1-in" required />
            </div>
            <div class="form-field">
              <label for="phone">핸드폰번호</label>
              <input type="text" name="phone" id="phone"  required/>
            </div>
            <div class="form-field">
              <label for="name">이름</label>
              <input type="text" name="name" id="nickname" required/>
            </div>
            <div class="form-field">
              <label for="nickname">닉네임</label>
              <input type="text" name="nickname" id="nickname" required/>
            </div>
            <div class="form-field">
              <label for="email">이메일</label>
              <input type="email" name="email" id="email" required/>
            </div>
          
            
            <button class="btn-sign btn-in">회원가입</button>
          </form>
          <p>아이디가 있으신가요 ? <a href="#" class="link-up">로그인</a></p>
        </div>
      </article>
  
      <article class="signup-right">
        <i class="fas fa-2x fa-bars bars-style"></i>
        <p><a class="link-copy" href="http://localhost:8001/Concat/#" target="_blank">메인페이지로</a></p>
  
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
        console.log(input)
        input.addEventListener('keydown', function() {
            this.labels[0].style.top = '10px';
        });
        input.addEventListener('blur', function() {
            if (this.value === '') {
            this.labels[0].style.top = '25px';
            }
        })
        }
        
     
      </script>
	
</body>
</html>