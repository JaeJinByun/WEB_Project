 package boardhandler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import board.BoardDao;
import board.BoardDataBean;
import board.ReplyDao;
import board.ReplyDataBean;
import board.ReplyVO;

@Controller
public class ContentHandler implements Commandhandler{
	
	@Resource
	private BoardDao boardDao;
	
	@Resource
	private ReplyDao replyDao;
	
	
	@RequestMapping("/views/content")
	@Override
	public ModelAndView  Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum =  request.getParameter("pageNum");				
		int bnumber = Integer.parseInt(request.getParameter("bnumber")); //글번호
		
		//해당 게시글의 댓글 개수
		int count = 0;
		int size = 5;	//한 페이지에 size개씩
		int start = 0;
		int end = 0;
		int currentPage = 1;	//현재 페이지
		int pageSize = 3;		// [1] [2] [3] [4] [5]
		
		count = replyDao.getReplyCount(num); 	
		
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		if(currentPage == 0) {
			currentPage = 1;
		}
		start = (currentPage - 1) * size + 1;		// ex) 4번 페이지는 31~40의 번호를 가진 게시글이 나와야함
		end = start + size -1;						// 
		
		if( end > count ) end = count;
		int number = count - (currentPage-1)*size; 	// ex) 50 - (5-1)*10  = 나온값부터 보겠다.  
		
		int startPage = (currentPage/pageSize)*pageSize  + 1; //ex 2 페이지 보겠다  
		if(startPage%pageSize == 0) startPage -= pageSize;
		
		int endPage = startPage + pageSize -1;
		int pageCount = ( count/size ) + (count % size > 0 ? 1 : 0);
		if(endPage > pageCount) endPage = pageCount;
		

		BoardDataBean dto = boardDao.getArticle(num);
		if(!request.getRemoteAddr().equals(dto.getIp())){ // 다른사람이 읽었을때만 
			boardDao.addCount(num); //어떤 글의 조회수를 처리할꺼냐 
		}
		
		request.setAttribute("count", count);
		
		request.setAttribute("number", number);		
		request.setAttribute("currentPage", currentPage); //댓글 현재 페이지
		request.setAttribute("pageSize", pageSize);		  //총 페이지 사이즈
		request.setAttribute("startPage", startPage);	  //시작 페이지
		request.setAttribute("endPage", endPage);		  //끝나는 페이지
		request.setAttribute("pageCount", pageCount);	  //페이지 수
		
		
		request.setAttribute("bnumber", bnumber);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		
		
		ReplyVO rdto = new ReplyVO();
		rdto.setStart(start);
		rdto.setEnd(end);
		rdto.setBoard_no(dto.getNum());
		
		
		List<ReplyDataBean> dtos = replyDao.getReplys(rdto);
		request.setAttribute("rdtos", dtos);
		
		
		/*
		int board_no = dto.getNum();
		//댓글 가져오기 
		List<ReplyDataBean> replydtos = replyDao.getReplys(board_no);
		request.setAttribute("rdtos", replydtos); //리플들 보냄
		*/
		
		return new ModelAndView("/views/board/content");
	}
}


















