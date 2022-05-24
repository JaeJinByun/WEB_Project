<%@page import="java.sql.Timestamp"%>
<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<h2> ${page_input}</h2>

<c:if test="${result eq 0}">
 	<% //결과값이 없을때 %>
		<script type="text/javascript">
		<!-- 
		erroralert("inputerror");
		-->
		</script>
</c:if>
<c:if test="${result ne 0}">	
	<c:redirect url="login.do"/>
</c:if>























	
	