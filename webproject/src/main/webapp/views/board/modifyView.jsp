<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}/style_board.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>

<h2>${page_modify}</h2>

<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
			erroralert(passwderror);
		//-->
		</script>
</c:if>
<c:if test="${result ne 0}">
	<body>
	<form name="modifyform" method="post" action="modifyPro.do" onsubmit="return modifycheck()">
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<table class="table">
				<tr>
					<th colspan="2">${msg_modify}</th>
				</tr>
				<tr>
					<th>${str_writer}</th>
					<td>${dto.writer}</td>
				</tr>
				<tr>
					<th>${str_email}</th>
					<td>${dto.email}</td>
				</tr>
				<tr>
					<th>
						${str_subject}
					</th>
					<td>
						<input class="input" type="text" name="subject" value="${dto.subject}" >
					</td>
				</tr>
				<tr>
					<th>${str_content}</th>
					<td>
						<textarea name="content" rows="10" cols="40">${dto.content}</textarea>
					</td>
				</tr>
				<tr>
					<th>${str_passwd}</th>
					<td>
						<input class="input" type="password" name="passwd" maxlength="20" value="${dto.passwd}">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_modify}">
						<input class="inputbutton" type="reset" value="${btn_cancel}">
						<input class="inputbutton" type="button" value="${btn_modify_cancel}" onclick="location='board.do?pageNum=${pageNum}'">
						
					</th>
				</tr>
			</table>
		</form>
	</body>
</c:if>






















