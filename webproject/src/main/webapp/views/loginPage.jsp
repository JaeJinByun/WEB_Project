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
				});;
			}
		);
 
	//-->
</script>

<title>로그인페이지</title>

<body>
	<div class="owl">
	  <div class="hand"></div>
	  <div class="hand hand-r"></div>
	  <div class="arms">
	    <div class="arm"></div>
	    <div class="arm arm-r"></div>
	  </div>
	</div>
	<form class="login" name="loginform" method="post" action="loginPro.do" onsubmit="return maincheck()">
	<div class="form">
		<h2>Welcome TO OwlBox</h2>
	  	<div class="control">
	    	<label for="id" class="fa fa-envelope"></label>
	   	 	<input id="id" placeholder="ID" type="text" name="id"></input>
		</div>
		<div class="control">
	  		<label for="password" class="fa fa-asterisk"></label>
	  		<input id="password" placeholder="Password" type="password" name="passwd"></input>
		</div>	
		<div class="button">					
			<table class="table">		
				<tr>		
					<th><div class="text-box"><a href="javascript:loginform.submit();" class="btn btn-white btn-animate">Sign in</a></div></th>	
				</tr>
				<tr>				
					<th><div class="text-box2"><a href="#" class="btn btn-white btn-animate" onclick="location='inputForm.do'">Sign up</a></div></th>	
				</tr>
			</table>
		</div>	
	</div>
</form>
</body>

















