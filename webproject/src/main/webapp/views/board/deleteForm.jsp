<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 데이터값 받아서 dto -> dao 처리 -->

<%@ include file="setting.jsp" %>
<link href="${project}/style_board.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>

    
<h2>${page_delete}</h2>

<form name="passwdform" method="post" action="deletePro.do">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table class="table">
		<tr>
			<th colspan="2">${msg_delete}</th>
		</tr>
		<tr>
			<th>${str_passwd}</th>
			<td><input class="input" type="password" name="passwd" maxlength="20" autofocus></td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="${btn_delete}">
				<input class="inputbutton" type="button" value="${btn_cancel}" onclick="location='board.do?pageNum=${pageNum}'">
			</th>
		</tr>
	</table>
</form>

































