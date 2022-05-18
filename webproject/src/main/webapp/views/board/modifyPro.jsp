<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}/script.js"></script>    

<h2>${page_modify}</h2>
<c:if test="${result eq 0}">
	<script type="text/javascript">
			<!--
				erroralert(modifyerror);			
			//-->
		</script>
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="board.do?pageNum=${pageNum}"/>
</c:if>



