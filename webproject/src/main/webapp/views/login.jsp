<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %> 
<link href="${project}/style_login.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
<script src="/webproject/jquery-3.6.0.js"></script>    
<script type="text/javascript">
//<!--
		$(document).ready(
			function() {
				/* 부엉이 미디어처리 */
				$('input').on('focus', () => {
					  $('*').addClass('password');
					}).on('blur', () => {
					 $('*').removeClass('password');
					});
				
				/* 화면 전환 슬로우 효과 */	
				jQuery(function($) {
				    $("body").css("display", "none");
				    $("body").fadeIn(1200);
				    $("a.transition").click(function(event){
				        event.preventDefault();
				        linkLocation = this.href;
				        $("body").fadeOut(1000, redirectPage);
				    });
				    function redirectPage() {
				    window.location = linkLocation;
				    }
				});	
				/* 버튼 클릭시 로그인 <--> 회원가입 */
				document.querySelector('.img__btn').addEventListener('click', function() {
			  	document.querySelector('.cont').classList.toggle('s--signup'); });
								
				/* 아이디 중복체크 ajax */
				$("#sign_up_id").blur(function() {
					// id = "id" / name = "id"
					var user_id = $('#sign_up_id').val();
					console.log(user_id);
					$.ajax({
						url : "/webproject/views/confirmid.do",
						type : "POST",
						data : {
							user_id : user_id
						},
						dataType : "text",
						success : function(data) {
							console.log("1 = 중복o / 0 = 중복x : "+ data);							
							
							if (data == 1) {
									// 1 : 아이디가 중복되는 문구
									$("#id_check").text("사용중인 아이디입니다.");
									$("#id_check").css("color", "red");
									$("#sign_up").attr("disabled", true);
							}else{
									
								if(user_id == ""){
										$('#id_check').text('아이디를 입력해주세요.');
										$('#id_check').css('color', 'red');
										$("#reg_submit").attr("disabled", true);				
								
								} else if(data == 0){
										
										$("#id_check").text("사용가능한 아이디입니다.");
										$("#id_check").css("color", "blue");
										$("#sign_up").attr("disabled", false);
											
								} else {
											
										$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
										$('#id_check').css('color', 'red');
										$("#sign_up").attr("disabled", true);
								}
									
							}
							}, error : function() {
									console.log("실패");
							}
						});
					});
					
					
	});
//-->
</script>
<div id="stars-container">
			<div id='stars'></div>
			<div id='stars2'></div>
			<div id='stars3'></div>
			<div class="owl">
	  <div class="hand"></div>
	  <div class="hand hand-r"></div>
	  <div class="arms">
	    <div class="arm"></div>
	    <div class="arm arm-r"></div>
	  </div>
</div>
<!-- 로그인 부분 -->
<div class="cont"  style="position:relative;">
<form class="login" name="loginform" method="post" action="loginPro.do" onsubmit="return maincheck()">
  <div class="form sign-in">
    <h2>Welcome back,</h2><br>
    <label>
      <span>ID</span>
      <input type="text" id="sign_in_id" name="sign_in_id"/>
    </label>
    <label>
      <span>Password</span>
      <input type="password" id="sign_in_password" name="sign_in_passwd"/>
    </label><br>
    <button type="submit" class="submit">Sign In</button><br>
    <button type="button" class="fb-btn" onclick="location='main.do'">Go Back To <span>MainPage</span></button>
  </div>
</form>
  <!-- 회원가입 부분 -->
<form name="inputform" method="post" action="inputPro.do" onsubmit="return inputcheck()">
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>New here?</h2>
        <p>Sign up and discover great amount of new opportunities!</p>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already has an account, just sign in. We've missed you!</p>
      </div>
      <div class="img__btn">
        <span class="m--up">Sign Up</span>
        <span class="m--in">Sign In</span>
      </div>
    </div>
    <div class="form sign-up">
      <h2>Time to feel like home,</h2>
      <label>
        <span>ID</span>
        <input type="text" id="sign_up_id" name="sign_up_id" maxlength="20"/>
      </label>
      <label>
      <span class="check_font" id="id_check"></span>
      </label>
      <label>
        <span>Email</span>
        <input type="email" id="email" name="email"/>
      </label>
      <label>
        <span>Password</span>
        <input type="password" id="sign_up_password" name="sign_up_passwd" maxlength="20"/>
      </label>
      <label>
        <span>Password Confirm</span>
        <input type="password" id="sign_up_repassword" name="sign_up_repasswd" maxlength="20"/>
      </label>
      <label>
        <span>Phone Number</span>
        <input type="text" id="tel" name="tel"/>
      </label>
      <button type="submit" class="submit" name="sign_up">Sign Up</button>
    </div>
  </div>
  </form>
</div>
</div>
	





