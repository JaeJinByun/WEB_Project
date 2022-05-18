<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="/webproject/views/board/style_board.css" rel="stylesheet" type="text/css">
<script src="/webproject/views/board/script.js"></script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OwlBox</title>

    <link rel="icon" type="image/png" href="img/icon.png" >
    <script src="https://kit.fontawesome.com/c9ab076429.js" crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=PT+Serif&display=swap');
    </style>
    <link rel="stylesheet" href="./style.css">
</head>

<!-- navbar -->
<body>
    <nav id="navbar">
        <div class="navbar__logo">
            <a href=main.do>
                <img src="img/logo.png" alt="Logo" width="400" height="200">
            </a>
        </div>
        <!-- 로그인이 안됐을때 -->
        <c:if test="${sessionScope.id eq null }">
        <div>
            <ul class="navbar__menu">
                <li class="navbar__menu__item">Collection</li>
                <li class="navbar__menu__item">My Page</li>
                <li class="navbar__menu__item" onclick="location='board.do'">Board</li>
                <li class="navbar__menu__item" onclick="location='loginPage.do'">Sign In</li>
            </ul>
        </div> 
        </c:if>
        <!-- 로그인이 됐을때 -->
        <c:if test="${sessionScope.id ne null }">
        <div>
            <ul class="navbar__menu">
                <li class="navbar__menu__item">Collection</li>
                <li class="navbar__menu__item">My Page</li>
                <li class="navbar__menu__item" onclick="location='board.do'">Board</li>
                <li class="navbar__menu__item" onclick="location='logOutboard.do'">Logout</li>
            </ul>
        </div>
        </c:if>
    </nav>


<!-- 게시판 -->
<table>
	<tr>
		<td colspan="6" align="right">
			<a href="writeForm.do" onclick="make(event)">글쓰기&nbsp;&nbsp;&nbsp;</a>
			<script>
   			 function make(e) {
   				 if( !<%=session.getAttribute("id")%>){
	        		 alert("로그인을 해주세요.");					 
   				 }
        		 //e.preventDefault();   // use this to NOT go to href site
    			}
			</script>
		</td>
	</tr>
	<tr>
		<th style="width:7%;"> 글번호 </th>
		<th style="width:40%;"> 제목 </th>
		<th style="width:15%;"> 작성자 </th>
		<th style="width:15%;"> 작성일 </th>
		<th style="width:8%;"> 조회수 </th>
		<th>  IP </th>
	</tr>
	<c:if test="${count eq 0}">
	<%	//글이 없는경우 %>
			<tr>
				<td colspan="6" align="center">
					${msg_list_x}
				</td>
			</tr>
	</c:if>
	<c:if test="${count ne 0}">		
		<c:forEach var="dto" items="${dtos}">
		<%//글이 있는경우%>
			<tr>
				<td align="center">	<!-- 글번호 -->
					${number}
					<c:set var="number" value="${number-1}"/>
				</td>	
				<td>
				
					<c:if test="${dto.readcount ne -1}">		
						<a href="content.do?num=${dto.num}&pageNum=${pageNum}&number=${number+1}">
							${dto.subject}
						</a>
					</c:if>	
				</td>
				<td align="center">
					${dto.writer}
				</td>
				<td>
					<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<td align="center">
				<c:if test="${dto.readcount eq  -1}">
						0
				</c:if>
				<c:if test="${dto.readcount ne  -1}">							
					${dto.readcount}
				</c:if>	
				</td>
				<td align="center">
					${dto.ip}
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<c:if test="${count gt 0}">
	<c:if test="${startPage gt pageSize}">
		<a href="board.do?PageNum=${startPage-pageSize}">[◀]</a>
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="${i+1}">
		<c:if test="${i eq currentPage}">
			<b>[${i}]</b>
		</c:if> 
		<c:if test="${i ne currentPage}">
			<a href="board.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${endPage lt pageCount}">
		<a href="board.do?pageNum=${startPage+pageSize}">[▶]</a>
	</c:if>
</c:if>
</body>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    