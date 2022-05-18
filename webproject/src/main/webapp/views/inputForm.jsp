<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="${project}/style_member_owl.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
<script src="/webproject/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//<!--
	//비밀번호 포커싱 할때의 미디어 처리
	$(document).ready(
		function() {
			$('input[type="password"]').on('focus', () => {
				  $('*').addClass('password');
				}).on('focusout', () => {
				  $('*').removeClass('password');
				});
			}
		);
 
	//-->
</script>


<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		${page_input}</h2>



<div class="owl">
	  <div class="hand"></div>
	  <div class="hand hand-r"></div>
	  <div class="arms">
	    <div class="arm"></div>
	    <div class="arm arm-r"></div>
	  </div>
</div>
<div class="inputform">
	 <form name="inputform" method="post" action="inputPro.do" onsubmit="return inputcheck()">
	 <input type="hidden" name="confirm" value="0">
	 <div class="control">
	 	 <label for="id" class="fa fa-user"></label>
		 <input type="text" id=id name="id" maxlength="20" placeholder="Userid" autofocus>
		 &emsp;
		 <input class="inputbutton" id="idbtn" type="button" value="${btn_confirm}" onclick="confirmid()">
	</div>
	<div class="control">
	  	<label for="password" class="fa fa-asterisk"></label>
	  	<input id="password" placeholder="Password" type="password" name="passwd" autoComplete="on" maxlength="20">
	</div>	
	<div class="control">
	  	<label for="repassword" class="fa fa-asterisk"></label>
	  	<input id="repassword" placeholder="Password Confirm" type="password" name="repasswd" autoComplete="on" maxlength="20">	
	</div>
	<div class="control">
	  	<label for="email1" class="fa fa-envelope"></label>
	  	<input id="email1" style="width:140px;" placeholder="email" type="text" name="email1" autoComplete="on"> @
	  	<input id="email2" style="width:120px;" placeholder="email" type="text" name="email2" autoComplete="on">
	  	<select id="select" name="select" onchange="changeSelect()">
					<option value=""> 직접입력 </option>
					<option value="naver.com"> 네이버 </option>
					<option value="daum.net"> 다음 </option>
					<option value="gmail.com"> 구글 </option>
					<option value="nate.com"> 네이트 </option>
		</select>	
	</div>
	<div class="controlJ">               
	  	<label for="tel1" class="fa fa-mobile"></label>
	  	<input id="tel1"  placeholder="전화번호" type="text" name="tel1" maxlength="3" onkeyup="nexttel2()"> &emsp;
	  -	&emsp;<input id="tel2"  type="text" name="tel2" maxlength="4" onkeyup="nexttel3()"> &emsp;
	  -	&emsp;<input id="tel3"  type="text" name="tel3" maxlength="4"> &emsp;	
	</div>
	<div>
		<input class="inputbutton" type="submit" value="${btn_length}">
		<input class="inputbutton" type="button" value="${btn_input_cancel}" onclick="location='main.do'">
	</div>
	</form>
</div>
















