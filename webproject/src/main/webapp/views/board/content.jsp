<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}/style_board.css" rel="stylesheet" type="text/css">
<script src="${project}/script.js"></script>
<script type="text/javascript">
	//<!--
	$(document).ready(function(){
	    $('.btn-reply').on('click',function(){
	      var closestDiv = $(this).closest('div'); // also you can use $(this).parent()
	      $('.commentReply').not(closestDiv.next('.commentReply')).hide();
	      closestDiv.next('.commentReply').slideToggle(0);
	    });
	    
	    $('.btn-send-reply').on('click',function(){
	      var textareaVal = $(this).closest('div').prevAll('.textarea-wrapper').find('textarea').val();  
	      console.clear();
	      console.log(textareaVal);
	      alert(textareaVal); //답글의 내용 
	      
	      $.ajax({
				type: "POST",               // 요청방식
				url: "rereplyPro.do",       // 요청문서의 url주소
				data:   ,         			// 전달할 변수와 값 설정
				dataType: ,		            // 요청에대한 응답결과의 데이터형식
				// [응답결과를 어떻게 처리할 것인가? >> 익명함수설정]
				// 1. 정상적인 응답결과를 제공받아 처리하는 함수를 설정
				//     => 응답결과가 자동으로 함수의 매개변수에 전달되어 저장
				success: function(html) {
					$("#message").html(html);
				},
				// 2. 비정상적인 응답결과를 제공받아 처리하는 함수를 설정
				//    => XMLHttpRequest객체가 자동으로 함수의 매개변수에 전달되어 저장
				error: function() {
					console.log("댓글 등록 실패");
				}
			});
	      
	    });
	    
	    $('.btn-cancel-reply').on('click',function(){
	      var closestDiv = $(this).closest('div').prevAll('.commentReply');
	      $('.commentReply').not(closestDiv.next('.commentReply')).hide();
	      closestDiv.next('.commentReply').slideToggle(0);
	    });	
	});
	//-->
</script>    
    
    
<h2>${page_content}</h2>

<form name="contentForm" method="post" action="replyPro.do" onsubmit="return replyCheck()">
<input type="hidden" name="sessionid" value="${sessionScope.id}">
<input type="hidden" name="boardnum" value="${dto.num}">
<input type="hidden" name="number" value="${number}">
<input type="hidden" name="pageNum" value="${pageNum}">
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
		<td colspan="3" style="height : 300px;"><pre>${dto.content}</pre></td>
	</tr>
	<!-- 로그인 된 상태일때만 댓글 입력가능 -->
	<c:if test="${sessionScope.id ne null}">
		<tr>
			<th>댓글</th>
			<td colspan="3">
				<textarea name="reply" rows="3" cols="5" style="width:90%;" placeholder="댓글을 입력하세요."></textarea>			
				<input type="submit" value="등록" style="height:30px;"> 								
			</td>
		</tr>		
	</c:if>
	<!--  댓글 가져오기  -->
	<c:forEach var="rdto" items="${rdtos}">
		<tr>
			<td colspan="4">&emsp;&emsp;
				${rdto.id} (${rdto.re_reg_date})<br><br>&emsp;&emsp;
				<span>${rdto.re_content}</span>
				<!-- 답글 부분 -->
				<div class="comment-wrapper">
			        <div class="reply p-2">
			            <input type="button" type="button" class="btn btn-primary btn-reply" value="답글">               
			        </div>
			        <div class="commentReply" data-id="">
			            <div class="post-reply-wrapper">
			                <div class="textarea-wrapper">
			                    <textarea class="textareReply" id="textarea-reply"></textarea>
			                </div>
			                <div>
			                    <span class="post-reply">
			                        <button class="btn-send-reply" id="btn-send-reply" data-id="2">확인</button>  
			                    </span>
			                    <span class="post-reply">
			                        <input type="button" class="btn-cancel-reply" value="닫기">
			                    </span>
			                </div>
			            </div>
			        </div>
			    </div>
			    <!-- 답글 부분 -->
			</td>	
			
		</tr>
	</c:forEach>
	<!--  댓글  가져오기-->
	
	<tr>
		<th colspan="4">
			<c:if test="${sessionScope.id eq dto.writer}">
				<input class="inputbutton" type="button" value="${btn_modify}" onclick="location='modifyForm.do?num=${dto.num}&pageNum=${pageNum}'">
				<input class="inputbutton" type="button" value="${btn_delete}" onclick="location='deleteForm.do?num=${dto.num}&pageNum=${pageNum}'">			
			</c:if>
			<input class="inputbutton" type="button" value="${btn_list}" onclick="location='board.do?pageNum=${pageNum}'">
		</th>
	</tr>
</table>
</form>

















