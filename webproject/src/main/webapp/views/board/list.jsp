<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}/style_list.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
<script src="/webproject/jquery-3.6.0.js"></script>

<script type="text/javascript">
	//<!--
	//포커싱 할때의 미디어 처리
	$(document).ready(
		function() {
			$('a').on('mouseover', () => {
				  $('*').addClass('password');
				}).on('mouseout', () => {
				 $('*').removeClass('password');
				});;
				
			jQuery(function($) {
			    $("body").css("display", "none");
			    $("body").fadeIn(1200);
			    $("a.transition").click(function(event){
			        event.preventDefault();
			        linkLocation = this.href;
			        $("body").fadeOut(1000, redirectPage);
			    });
			    function redirectPage() {
			    window.location = linkLocation;
			    }
			});	
			$("#write_btn").click(function(){
				if(!"${sessionScope.id}"){
					alert("로그인을 해주세요.");
					window.location.href='/webproject/views/login.do';
				}else{
					window.location.href='/webproject/views/writeForm.do';
				}
				
			});
			
			
		});
 
	//-->
</script>

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
</head>


<body>
<!-- navbar -->
<div>
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
                <li class="navbar__menu__item" onclick="location='login.do'">Sign In</li>
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
</div>

<!-- 게시판 -->

<div class="container">
  <h2>Welcome To Owl Board</h2>
  
  <ul class="responsive-table">
    <li class="table-header">
      <div class="col col-1">글 번호</div>
      <div class="col col-2">제목</div>
      <div class="col col-3">작성자</div>
      <div class="col col-4">작성일</div>
      <div class="col col-5">조회수</div>
      <div class="col col-6">IP
      <div class="container2">
	    <div class="center">
	      <button class="btn" id="write_btn" >
	        <svg width="120px" height="40px" viewBox="0 0 180 60" class="border">
	          <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
	          <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
	        </svg>
	        <span>글쓰기</span>
	      </button>
	    </div>
  	  </div>
      </div>
    </li>
    <% //글이 없는 경우%>
    <c:if test="${count eq 0}">
    <li class="table-row">
      <div class="col col-1" data-label="Job Id">--</div>
      <div class="col col-2" data-label="Customer Name">글이 없습니다.</div>
      <div class="col col-3" data-label="Amount">---</div>
      <div class="col col-4" data-label="Payment Status">--</div>
      <div class="col col-5" data-label="Payment Status">--</div>
      <div class="col col-6" data-label="Payment Status">--</div>
    </li>
    </c:if>
    <% //글이 있는 경우 %>
    <c:if test="${count ne 0}">		
		<c:forEach var="dto" items="${dtos}">
    		<li class="table-row">
		      <div class="col col-1" data-label="Job Id">${number}</div>
		      <c:set var="number" value="${number-1}"/>
		      <div class="col col-2" data-label="Customer Name">
		      	<a href="content.do?num=${dto.num}&pageNum=${pageNum}&bnumber=${number+1}&currentPage=1">
				${dto.subject}
				</a>	
		      </div>
		      <div class="col col-3" data-label="Amount">${dto.writer}</div>
		      <div class="col col-4" data-label="Payment Status">
		      	<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
		      </div>
		      <div class="col col-5" data-label="Payment Status">${dto.readcount}</div>
		      <div class="col col-6" data-label="Payment Status">${dto.ip}</div>
    	    </li>
    	 </c:forEach>
	</c:if>
  </ul>
  <div style="text-align:center;">
  <c:if test="${count gt 0}">
	<c:if test="${startPage gt pageSize}">
		<div align="center"><a href="board.do?PageNum=${startPage-pageSize}">[◀]</a>></div>
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
	</div>
</div>
</body>

 
    
    