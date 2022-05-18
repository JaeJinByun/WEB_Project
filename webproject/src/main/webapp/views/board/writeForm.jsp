<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}/style_board.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>

<!-- 글쓰기 페이지 -->
<h2>${page_write}</h2>

<!-- 로그인이 안되어있을때  -->
<c:if test="${sessionScope.id eq null }">
	<c:redirect url="/views/loginPage.do"/>
</c:if>



<form name="writeForm" method="post" action="writePro.do" onsubmit="return writecheck()">
	<input type="hidden" name="num" value="${num}">	
	<table>
		<tr>
			<th colspan="2" style="text-align:right">
				<a href="board.do">${str_list}&nbsp;&nbsp;&nbsp;</a> <!-- 글목록 -->
			</th>
		</tr>
		<tr>
			<th>${str_writer}</th>
			<td><input class="input" type="text" name="writer"  value="${id}" readonly style="background: #c4c4c4;"></td>
		</tr>
		<tr>
			<th>${str_email} </th>
			<td><input class="input" type="text" name="email" value="${email}" readonly style="background: #c4c4c4;"></td>
		</tr>
		<tr>
			<th>${str_subject}</th>
			<td><input class="input" type="text" name="subject" maxlength="100"></td>
		</tr>
		<tr>
			<th>${str_content}</th>
			<td><textarea name="content" rows="10" cols="40" rows="15"></textarea></td>
		</tr>
		<tr>
			<th>${str_passwd}</th>
			<td><input class="input" type="password" name="passwd" maxlength="20"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="${btn_write}"> <!-- 글작성 버튼 -->
				<input class="inputbutton" type="reset" value="${btn_cancel}"> <!-- 취소버튼 -->
				<input class="inputbutton" type="button" value="${btn_list}" onclick="location='board.do'">  <!-- 메인메뉴로 돌아가기 버튼 -->
			</th>
		</tr>
	</table>
</form>



















