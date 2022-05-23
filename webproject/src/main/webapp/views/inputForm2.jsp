<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %> 
<link href="${project}/style_inputForm.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
<script src="/webproject/jquery-3.6.0.js"></script>    

<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <!-- Somehow I got an error, so I comment the title, just uncomment to show -->
    <!-- <title>Login & Signup Form | CodingNepal</title> -->
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
    <div class="wrapper">
    <div class="owl">
	  <div class="hand"></div>
	  <div class="hand hand-r"></div>
	  <div class="arms">
	    <div class="arm"></div>
	    <div class="arm arm-r"></div>
	  </div>
	</div>
      <div class="title-text">
        <div class="title login">Login Form</div>
	<div class="title signup">Signup Form</div>
	</div>
<div class="form-container">
        <div class="slide-controls">
          <input type="radio" name="slide" id="login" checked>
          <input type="radio" name="slide" id="signup">
          <label for="login" class="slide login">Login</label>
          <label for="signup" class="slide signup">Signup</label>
          	<div class="slider-tab"></div>
		</div>
<div class="form-inner">
		<form action="#" class="login">
            <div class="field">
              <input type="text" placeholder="Email Address" required>
            </div>
			<div class="field">
              <input type="password" placeholder="Password" required>
            </div>
			<div class="pass-link">
			<a href="#">Forgot password?</a></div>
			<div class="field btn">
			<div class="btn-layer">
			</div>
			<input type="submit" value="Login">
			            </div>
			<div class="signup-link">Not a member? <a href="">Signup now</a></div>
		</form>
		<form action="#" class="signup">
		    <div class="field">
		        <input type="text" placeholder="User ID" required>            	
		     </div>
			 <div class="field">
		         <input type="password" placeholder="Password" required>
		     </div>
			 <div class="field">
		         <input type="password" placeholder="Confirm password" required>
		     </div>
		     <div class="field">
		         <input type="text" placeholder="Email" required>
		     </div>
		     <div class="field">
		         <input type="text" placeholder="Phone Num" required>
		     </div>
			 <div class="field btn">
		         <div class="btn-layer"></div>
			     <input type="submit" value="Signup">
		     </div>
		</form>	
		</div>
	</div>
</div>
<script type="text/javascript">
//<!--
		//비밀번호 포커싱 할때의 미디어 처리
		$(document).ready(
			function() {
				$('input[type="password"]').on('focus', () => {
					  $('*').addClass('password');
					}).on('focusout', () => {
					 $('*').removeClass('password');
					});;
				}
			);		

      const loginText = document.querySelector(".title-text .login");
      const loginForm = document.querySelector("form.login");
      const loginBtn = document.querySelector("label.login");
      const signupBtn = document.querySelector("label.signup");
      const signupLink = document.querySelector("form .signup-link a");
      signupBtn.onclick = (()=>{
        loginForm.style.marginLeft = "-50%";
        loginText.style.marginLeft = "-50%";
      });
      loginBtn.onclick = (()=>{
        loginForm.style.marginLeft = "0%";
        loginText.style.marginLeft = "0%";
      });
      signupLink.onclick = (()=>{
        signupBtn.click();
        return false;
      });
    //-->	
    </script>

  </body>
</html>