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
		
		/* 답글 버튼 */
	    $('.btn-reply').on('click',function(){
	      var closestDiv = $(this).closest('div'); // also you can use $(this).parent()
	      $('.commentReply').not(closestDiv.next('.commentReply')).hide();
	      closestDiv.next('.commentReply').slideToggle(0);
	    }); 
		
	    /*  댓글 수정 버튼  */
	    $('.btn-modify').on('click',function(){
	      var closestDiv = $(this).closest('div'); // also you can use $(this).parent()
	      $('.modifyReply').not(closestDiv.nextAll('.modifyReply')).hide();
	      closestDiv.nextAll('.modifyReply').slideToggle(0);
		}); 
	    
	    /*  댓글 삭제 버튼  */
	    $('.btn-delete-reply').on('click',function(){
		     //삭제 버튼 누른 댓글의 번호
		     var re_no = $(this).attr('id');		     
		      
		    //데이터 보내기
		      $.ajax({
		    	 url : "/webproject/views/replyDeletePro.do",
		    	 type: "POST",
		    	 data: {
		    		re_no : re_no
		    	 },
		    	 success : function(){
		    		 console.log("보내기 성공");
		    		 location.reload();
		    	 }		    	 
		      });	
		}); 
	    	     
	    /*  대댓글 확인 버튼  */
	    $('.btn-send-reply').on('click',function(){
	      //대댓글 내용
	      var text = $(this).closest('div').prevAll('.textarea-wrapper').find('textarea').val();  
	      if(text == "" || text == null){
	    	 alert("댓글을 입력하세요.");
	      }else{
		      //부모 댓글 번호
		      var p_reply_no  = $(this).attr('id');
		      //게시글 번호
		      var board_no    = "${dto.num}";
		      //아이디 
		      var id 		  = "${sessionScope.id}";
		      
		      //데이터 보내기
		      $.ajax({
		    	 url : "/webproject/views/rreplyPro.do",
		    	 type: "POST",
		    	 data: {
		    		text : text,
		    	 	p_reply_no : p_reply_no,
		    	 	board_no : board_no,	    	 	
		    	 	id : id
		    	 },
		    	 success : function(){
		    		 console.log("보내기 성공");
		    		 location.reload();
		    	 }
		    	 
		      });	  
	      }
	    });
	    
	    /*  댓글 수정 확인 버튼  */
	    $('.btn-modify-reply').on('click',function(){
	      //대댓글 내용
	      var text = $(this).closest('div').prevAll('.textarea-wrapper').find('textarea').val();  
	      if(text == "" || text == null){
	    	 alert("댓글을 입력하세요.");
	      }else{
		      //수정할 댓글 번호
		      var re_no  = $(this).attr('id');
		      
		      //데이터 보내기
		      $.ajax({
		    	 url : "/webproject/views/modifyreplyPro.do",
		    	 type: "POST",
		    	 data: {
		    		re_content : text,
		    	 	re_no : re_no
		    	 	
		    	 },
		    	 success : function(){
		    		 console.log("보내기 성공");
		    		 location.reload();
		    	 }
		    	 
		      });	
	      }
	    });
	    
	    /* 취소 버튼 */
	    $('.btn-cancel-reply').on('click',function(){
	      var closestDiv = $(this).closest('div').prevAll('.commentReply');
	      $('.commentReply').not(closestDiv.next('.commentReply')).hide();
	      closestDiv.next('.commentReply').slideToggle(0);
	    });
	    
	    $('.btn-cancel-modify').on('click',function(){
		  var closestDiv = $(this).closest('div').prevAll('.modifyReply');
		  $('.modifyReply').not(closestDiv.next('.modifyReply')).hide();
		  closestDiv.next('.modifyReply').slideToggle(0);
		});
	    
	});
	
	//-->
</script>       

<body>           
<h2>${page_content}</h2>

<form name="contentForm" method="post" action="replyPro.do" onsubmit="return replyCheck()">
<input type="hidden" name="sessionid" value="${sessionScope.id}">
<input type="hidden" name="boardnum" value="${dto.num}">
<input type="hidden" name="bnumber" value="${bnumber}">
<input type="hidden" name="pageNum" value="${pageNum}">
<input type="hidden" name="currentPage" value="${currentPage}">
<table>
	<tr>
		<th>작성자 ${str_num}</th>
		<td align="center">${bnumber}</td>
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
			<td colspan="4">
				<!-- 부모댓글 일경우 -->
				<c:if test="${rdto.re_level eq 0}">
				  <strong> 
				  	<span class="nickName">${rdto.id}</span>
				  	(${rdto.re_reg_date})
				  </strong><br>&emsp;&emsp;
					<div>${rdto.re_content}</div><br>
				  <div class="comment-wrapper">
			        <div class="reply p-2">
			        	<c:if test="${sessionScope.id ne null}"><!-- 로그인한 상태인지 -->
				            <c:if test="${rdto.dcheck eq 0}"><!-- 삭제된 글인지 (삭제됐으면 안보이게)-->
				            <input type="button" class="btn btn-primary btn-reply" value="답글">
				           	 	<c:if test="${sessionScope.id eq  rdto.id}">
					            	<input type="button" class="btn btn-delete-reply" id="${rdto.re_no}" value="삭제">
					            	<input type="button" class="btn btn-primary btn-modify" id="${rdto.re_no}" value="수정">	
					            </c:if>		            
				            </c:if>
			            </c:if>
			        </div>
			        <div class="commentReply" data-id="">
			            <div class="post-reply-wrapper">
			                <div class="textarea-wrapper">
			                    <textarea class="textareReply" id="textarea-reply" placeholder="댓글을 입력하세요"></textarea>
			                </div>
			                <div>
			                    <span class="post-reply">
			                        <input type="button" class="btn-send-reply" id="${rdto.re_no}" data-id="1" value="확인">
			                    </span>
			                    <span class="post-reply">
			                        <input type="button" class="btn-cancel-reply" value="취소">
			                    </span>
			                </div>
			            </div>
			        </div>
			        <div class="modifyReply" data-id="">
			            <div class="post-reply-wrapper">
			                <div class="textarea-wrapper">
			                    <textarea class="textareReply" id="textarea-reply">${rdto.re_content}</textarea>
			                </div>
			                <div>
			                    <span class="post-reply">
			                        <input type="button" class="btn-modify-reply" id="${rdto.re_no}" data-id="1" value="확인">
			                    </span>
			                    <span class="post-reply">
			                        <input type="button" class="btn-cancel-modify" value="취소">
			                    </span>
			                </div>
			            </div>
			        </div>
			    </div>
				</c:if>
				
				<!-- 대댓글일 경우 -->
				<c:if test="${rdto.re_level ne 0}">&emsp;&emsp;
				<img src="/webproject/views/img/replyArrow.png" border="0" width="20">
				<strong> 
				  	<span class="nickName">${rdto.id}</span>
				  	(${rdto.re_reg_date})
				  </strong><br>&emsp;&emsp;
					<div>&emsp;&emsp;&emsp;&emsp;&emsp;${rdto.re_content}</div><br>
				  <div class="comment-wrapper">
			        <div class="reply p-2">
			        	<c:if test="${sessionScope.id ne null}"><!-- 로그인한 상태인지 -->
				            <input type="button" class="btn btn-primary btn-reply" value="답글">
				            <c:if test="${sessionScope.id eq rdto.id}">			         
					            <input type="button" class="btn btn-delete-reply" id="${rdto.re_no}" value="삭제">
					            <input type="button" class="btn btn-primary btn-modify" id="${rdto.re_no}" value="수정">			            
				            </c:if>
			            </c:if>
			        </div>
			        
			        <div class="commentReply" data-id="">
			            <div class="post-reply-wrapper">
			                <div class="textarea-wrapper">
			                    <textarea class="textareReply" id="textarea-reply" placeholder="댓글을 입력하세요"></textarea>
			                </div>
			                <div>
			                    <span class="post-reply">							<!--부모 댓글의 번호-->
			                        <input type="button" class="btn-send-reply" id="${rdto.grp}" data-id="1" value="확인">
			                    </span>
			                    <span class="post-reply">
			                        <input type="button" class="btn-cancel-reply" value="취소">
			                    </span>
			                </div>
			            </div>
			        </div>
			        <div class="modifyReply" data-id="">
			            <div class="post-reply-wrapper">
			                <div class="textarea-wrapper">
			                    <textarea class="textareReply" id="textarea-reply">${rdto.re_content}</textarea>
			                </div>
			                <div>
			                    <span class="post-reply">
			                        <input type="button" class="btn-modify-reply" id="${rdto.re_no}" data-id="1" value="확인">
			                    </span>
			                    <span class="post-reply">
			                        <input type="button" class="btn-cancel-modify" value="취소">
			                    </span>
			                </div>
			            </div>
			        </div>
			    </div>
			    </c:if>
			</td>	
		</tr>
	</c:forEach>
	<tr>
	<th colspan="4">
	<c:if test="${count gt 0}">		
		<c:if test="${startPage gt pageSize}">
			<a href="content.do?num=${dto.num}&pageNum=${pageNum}&bnumber=${number+1}&currentPage=${startPage-pageSize}">[◀]</a>
		</c:if>	
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="${i+1}">
			<c:if test="${i eq currentPage}">
				<b>[${i}]</b>
			</c:if> 
			<c:if test="${i ne currentPage}">
				<a href="content.do?num=${dto.num}&pageNum=${pageNum}&bnumber=${number+1}&currentPage=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage lt pageCount}">
		<a href="content.do?num=${dto.num}&pageNum=${pageNum}&bnumber=${number+1}&currentPage=${startPage+pageSize}">[▶]</a>
		</c:if>		
	</c:if>
	</th>
	</tr>
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
</body>
















