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
	 <div class="control">
	 	 <label for="id" class="fa fa-user"></label>
		 <input type="text" id=id name="id" maxlength="20" placeholder="Userid" autofocus>
		 &emsp;
		 <input class="inputbutton" id="idbtn" type="button" value="${btn_confirm}" onclick="confirmid()">
	</div>
	<div class="control">
	  	<label for="password" class="fa fa-asterisk"></label>
	  	<input id="password" placeholder="Password" type="password" name="passwd" autoComplete="on">
	</div>	
	<div class="control">
	  	<label for="repassword" class="fa fa-asterisk"></label>
	  	<input id="repassword" placeholder="Password Confirm" type="password" name="repasswd" autoComplete="on">	
	</div>
	<div class="control">
	  	<label for="name" class="fa fa-user"></label>
	  	<input id="name" placeholder="User Name" type="text" name="name" autoComplete="on">	
	</div>
	<div class="controlJ">               
	  	<label for="jumin1" class="fa fa-user"></label>
	  	<input id="jumin1" placeholder="주민등록번호" type="text" name="jumin1" maxlength="6">
	  	&emsp;&nbsp;&nbsp; - &nbsp;&emsp;&nbsp;
	  	<input id="jumin2" placeholder="주민등록번호" type="text" name="jumin2" maxlength="7">	
	</div>
	<div class="controlJ">               
	  	<label for="tel1" class="fa fa-mobile"></label>
	  	<input id="tel1"  placeholder="전화번호" type="text" name="tel1" maxlength="4"> &emsp;
	  -	&emsp;<input id="tel2"  type="text" name="tel2" maxlength="4"> &emsp;
	  -	&emsp;<input id="tel3"  type="text" name="tel3" maxlength="4"> &emsp;	
	</div>
	
</div>


<!-- 
<form class="login2" name="inputform" method="post" action="inputPro.do" onsubmit="return inputcheck()">
	<input type="hidden" name="confirm" value="0">
	
	<table class="table2" >
		<tr>
			<th class="text">${str_id}</th>
			<td><input class="inputtext2" type="text" name="id" maxlength="20" placeholder="Userid" autofocus>
				<input class="inputbutton" type="button" value="${btn_confirm}" onclick="confirmid()">
			</td>
		</tr>
		<tr>
			<th class="text"> ${str_passwd} </th>
			<td> <input class="inputtext2" type="password" name="passwd" maxlength="30" placeholder="Password" autoComplete="on"></td>
		</tr>
		<tr>
			<th class="text"> ${str_repasswd} </th>
			<td><input class="inputtext2" type="password" name="repasswd" maxlength="30" placeholder="Password Confirm" autoComplete="on"></td>
		</tr>
		<tr>
			<th class="text"> ${str_name}</th>
			<td> <input class="inputtext2" type="text" name="name" maxlength="30" placeholder="UserName"> </td>
		</tr>
		<tr>
			<th class="text"> ${str_jumin}</th>
			<td> 
				<input class="inputtext2" style="width:80px;" type="text"  name="jumin1" maxlength="6"
					onkeyup="nextjumin1()">
				
				<input class="inputtext2" style="width:100px;" type="text" name="jumin2" maxlength="7"
					onkeyup="nextjumin2()">
			</td>
		</tr>
		<tr>
			<th class="text"> ${str_tel} </th>
			<td> 
				<input class="inputtext2" style="width:70px;" type="text" name="tel1" maxlength="3"
					onkeyup="nexttel1()">
				- <input class="inputtext2" style="width:70px;" type="text" name="tel2" maxlength="4"
					onkeyup="nexttel2()">
				- <input class="inputtext2" style="width:70px;" type="text" name="tel3" maxlength="4"
					onkeyup="nexttel3()">	
			</td>
		</tr>
		<tr>
			<th class="text"> ${str_email} </th>
			<td>
				<input class="inputemail" style="width:100px;" type="text" name="email1" maxlength="15">
				@
				<input class="inputemail" style="width:100px;" type="text" name="email2" maxlength="15">
				
				<select id="select" name="select" onchange="changeSelect()">
					<option value="0"> 직접입력 </option>
					<option value="naver.com"> 네이버 </option>
					<option value="daum.net"> 다음 </option>
					<option value="gmail.com"> 구글 </option>
					<option value="nate.com"> 네이트 </option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="${btn_length}">
				<input class="inputbutton" type="reset" value="${btn_cancel}">
				<input class="inputbutton" type="button" value="${btn_input_cancel}" onclick="location='main.do'">
			</th>
		</tr>
	</table>
</form>
-->















