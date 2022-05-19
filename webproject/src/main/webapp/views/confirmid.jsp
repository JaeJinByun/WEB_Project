<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="${project}/style_member_owl.css" rel="stylesheet" type="text/css"	>
<script src="${project}/script.js"></script>

<h2 align="center">${page_confirm}</h2>
<%
	int result = (Integer)request.getAttribute("result"); //0이면 중복x 나머지 중복
	String id = (String)request.getAttribute("id");
%>

<c:if test="${result eq 0}">
	<%//아이디가없다.%>
		<table border="1" style="margin: auto; text-align: center;">
			<tr>
				<th> <span>${id}</span>${msg_id_o}</th>
			</tr>
			
			<tr>
				<td align="center">
					<input type="button" value="${btn_ok}" onclick="setid('${id}')">
				</td>
			</tr>
		</table>
</c:if>
<c:if test="${result ne 0}">
		<%//아이디가 있다.%>
		<form name="confirmform" method="post" action="confirmid.do" onsubmit="return confirmcheck()">
		<table border="1" style="margin: auto; text-align: center;">
			<tr>
				<th colspan="2">
					<span>${id}${msg_id_x}</span>
				</th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> <input class="input" style="width: 160px; height: 30px" type="text" name="id" maxlength="20" autofocus> </td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_ok}">
					<input class="inputbutton" type="button" value="${btn_cancel}"
						onclick="window.close()">
			</tr>
		</table>
		</form>
</c:if>
