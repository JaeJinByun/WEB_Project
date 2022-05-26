<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/webproject/views/script.js"></script>
<script src="/webproject/jquery-3.6.0.js"></script>  
<script type="text/javascript">
//<!--
	$(document).ready(function() {
		
			/* 아이디 검색 */
	        $("input[name='search_btn']").click(function () {
	            var id = $("#searchId").val();
	            
	            location.href = "/webproject/views/manageSearch.do?id=" + id;		            
	          });
	        
			/* 회원 삭제 버튼 */
	        $("input[name='delete_btn']").click(function () {
	            var id = $(this).attr('id'); 
	            console.log(id);
	            if(id == 'admin'){
	            	alert("관리자는 삭제할수 없습니다.");
	            }else{
		            location.href = "/webproject/views/deleteMember.do?id=" + id;	   
	            }
	          });
			
			/* 유저 등급 변경 */
	        $("input[name='modify_btn']").click(function () {
	            var id = $(this).closest("tr").attr("class"); 
	            if(id == 'admin'){
	            	alert("관리자는 변경할수 없습니다.");
	            }else{
		            $.ajax({
		                url : '/webproject/views/modifyLevel.do',               
		                type : 'POST', 
		                data : {
		                  id : id
		                },
		                success : function(result) { 
		                    console.log(result);
		                    location.reload();
		                },
		                error : function(error) { // 결과 에러 콜백함수
		                    console.log(error)
		                }
		            })        	
	            }
	          });
			
			/* 재화 변경 버튼 */
	        $("input[name='currency_btn']").click(function () {
	        	var id = $(this).closest("tr").attr("class");
	            var currency = $(this).closest("tr").find(":input[name='currency']").val();
	            	            
	            $.ajax({
	                url : '/webproject/views/modifyCurrency.do',               
	                type : 'POST', 
	                data : {
	                  id : id,
	                  currency : currency
	                },
	                success : function(result) { 
	                    console.log(result);
	                    location.reload();
	                },
	                error : function(error) { // 결과 에러 콜백함수
	                    console.log(error)
	                }
	            }) 
	            
	          });
			
			
			
        })

//-->
</script>
<!-- 로그인 안되어있을때 + 어드민이 아닐때 -->
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="main.do"/>
</c:if>

<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/webproject/resources/bootstrap.min.css">
<link rel="stylesheet" href="/webproject/views/admin/style_admin.css">
</head>
<body>
	<div style="text-align: center;">
		<h2>관리자 페이지입니다.</h2>	
	</div>
	<nav id="nav-1">
	  <a class="link-1" href="main.do" style="text-decoration: none;">Home</a>
	  <a class="link-1" href="board.do" style="text-decoration: none;">Board</a>
	  <a class="link-1" href="#" style="text-decoration: none;">무슨메뉴로하징</a>
	  <a class="link-1" href="logOut.do" style="text-decoration: none;">Logout</a>
	</nav>	
	<div style="margin-left: 10%; margin-top: 2%; margin-bottom: 2%;">
	아이디 검색 : <input type="text" id="searchId">
	<input type="button" name="search_btn" value="검색">
	</div>
	<table id="example" class="table table-striped table-bordered" style="margin:0 auto; width:80%; text-align: center; opacity:1;">
			<thead>
            <tr>
                <th>아이디</th>
                <th>회원 종류</th>
                <th>비밀번호</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>재화</th>
                <th>탈퇴시키기</th>
            </tr>
        	</thead>
        <tbody>
		<c:forEach var="dto" items="${dtos}">
			<tr class="${dto.id}">		
				<td>${dto.id}</td>
				<c:if test="${dto.adminck eq 0}">
					<td>${dto.adminck}<input type="button" name="modify_btn" value="관리자권한 부여" style="float: right;"></td>
				</c:if>
				<c:if test="${dto.adminck ne 0}">
					<td>${dto.adminck}<input type="button" name="modify_btn" value="일반 유저로 강등" style="float: right;"></td>
				</c:if>
				<td>${dto.passwd}</td>
				<td>${dto.tel}</td>
				<td>${dto.email}</td>
				<td>
					<input type="number" value="${dto.currency}" name="currency" min="0" max="9999" step="10"/>
					<input type="button" name="currency_btn" value="확인">
				</td>
				<td><input type="button" id="${dto.id}" name="delete_btn" value="회원 삭제"></td>
			</tr>
		</c:forEach>		
		</tbody>
	</table>
		<!-- 페이지 선택 -->
		<div style="text-align:center;">
		  <c:if test="${count gt 0}">
			<c:if test="${startPage gt pageSize}">
				<div align="center"><a href="manage.do?PageNum=${startPage-pageSize}">[◀]</a>></div>
			</c:if>		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="${i+1}">
				<c:if test="${i eq currentPage}">
					<b>[${i}]</b>
				</c:if> 
				<c:if test="${i ne currentPage}">
					<a href="manage.do?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${endPage lt pageCount}">
				<a href="manage.do?pageNum=${startPage+pageSize}">[▶]</a>
			</c:if>
			</c:if>
		</div>
</body>
</html>
