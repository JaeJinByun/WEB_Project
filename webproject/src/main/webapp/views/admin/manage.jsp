<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/webproject/views/script.js"></script>
<script src="/webproject/jquery-3.6.0.js"></script>  

<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<h2>관리자 페이지</h2>
	<table border="1">
			<tr>
				<td>아이디</td>
				<td>회원종류</td>
				<td>비밀번호</td>
				<td>전화번호</td>
				<td>이메일</td>
				<td>재화</td>
			</tr>
		<c:forEach var="dto" items="${dtos}">
			<tr>		
				<td>${dto.id}</td>
				<td>${dto.adminck}</td>
				<td>${dto.passwd}</td>
				<td>${dto.tel}</td>
				<td>${dto.email}</td>
				<td>${dto.currency}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>