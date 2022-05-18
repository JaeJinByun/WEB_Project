<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  조각코드를 삽입 //공통코드 사용하기 위함 예를들어 변수  -->
<%@ include file="setting.jsp" %> 
<!-- 만들어둔 css파일 사용 -->
<link href="${project}/style_member.css" rel="stylesheet" type="text/css"	>
<script src="${project}/script.js"></script>

<h2>${page_login}</h2>

<c:set var="result" value="${requestScope.result}"/>
<c:set var="id"		value="${requestScope.id}"/>

<c:if test="${result eq -1}">
	<%  //아이디가없다    %>
		
		<script type="text/javascript">
			<!--
			erroralert( iderror );
			//-->
		</script>
</c:if>
<c:if test="${result eq 0}">
	<%  //비밀번호가 다르다   %>
		
		<script type="text/javascript">
		<!--
		erroralert( passwderror );
		//-->
		</script>
</c:if>
<c:if test="${result eq 1}">		
	<% //비밀번호가 같다  %>			
	<c:redirect url="main.do"/>
</c:if>

































