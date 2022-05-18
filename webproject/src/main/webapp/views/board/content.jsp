	<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}/style_board.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
    
    
<h2>${page_content}</h2>

<table>
	<tr>
		<th>작성자 ${str_num}</th>
		<td align="center">${number}</td>
		<th>${str_readcount}</th>
		<td align="center">${dto.readcount}</td>
	</tr>
	<tr>
		<th>${str_writer}</th>
		<td align="center">${dto.writer}</td>
		<th>${str_reg_date}</th>
		<td align="center">
			<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>			
		</td>
	</tr>
	<tr>
		<th>${str_subject}</th>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr>
		<th>${str_content}</th>
		<td colspan="3"><pre>${dto.content}</pre></td>
	</tr>
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value="${btn_modify}" onclick="location='modifyForm.do?num=${dto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_delete}" onclick="location='deleteForm.do?num=${dto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_reply}" 
			onclick="location='writeForm.do?num=${dto.num}'">
			<input class="inputbutton" type="button" value="${btn_list}" onclick="location='board.do?pageNum=${pageNum}'">
		</th>
	</tr>
</table>


















