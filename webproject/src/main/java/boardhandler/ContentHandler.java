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
		int bnumber = Integer.parseInt(request.getParameter("bnumber")); //湲�踰덊샇
		
		//�빐�떦 寃뚯떆湲��쓽 �뙎湲� 媛쒖닔
		int count = 0;
		int size = 5;	//�븳 �럹�씠吏��뿉 size媛쒖뵫
		int start = 0;
		int end = 0;
		int currentPage = 1;	//�쁽�옱 �럹�씠吏�
		int pageSize = 3;		// [1] [2] [3] [4] [5]
		
		count = replyDao.getReplyCount(num); 	
		
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		if(currentPage == 0) {
			currentPage = 1;
		}
		start = (currentPage - 1) * size + 1;		// ex) 4踰� �럹�씠吏��뒗 31~40�쓽 踰덊샇瑜� 媛�吏� 寃뚯떆湲��씠 �굹���빞�븿
		end = start + size -1;						// 
		
		if( end > count ) end = count;
		int number = count - (currentPage-1)*size; 	// ex) 50 - (5-1)*10  = �굹�삩媛믩��꽣 蹂닿쿋�떎.  
		
		int startPage = (currentPage/pageSize)*pageSize  + 1; //ex 2 �럹�씠吏� 蹂닿쿋�떎  
		if(startPage%pageSize == 0) startPage -= pageSize;
		
		int endPage = startPage + pageSize -1;
		int pageCount = ( count/size ) + (count % size > 0 ? 1 : 0);
		if(endPage > pageCount) endPage = pageCount;
		

		BoardDataBean dto = boardDao.getArticle(num);
		if(!request.getRemoteAddr().equals(dto.getIp())){ // �떎瑜몄궗�엺�씠 �씫�뿀�쓣�븣留� 
			boardDao.addCount(num); //�뼱�뼡 湲��쓽 議고쉶�닔瑜� 泥섎━�븷爰쇰깘 
		}
		
		request.setAttribute("count", count);
		
		request.setAttribute("number", number);		
		request.setAttribute("currentPage", currentPage); //�뙎湲� �쁽�옱 �럹�씠吏�
		request.setAttribute("pageSize", pageSize);		  //珥� �럹�씠吏� �궗�씠利�
		request.setAttribute("startPage", startPage);	  //�떆�옉 �럹�씠吏�
		request.setAttribute("endPage", endPage);		  //�걹�굹�뒗 �럹�씠吏�
		request.setAttribute("pageCount", pageCount);	  //�럹�씠吏� �닔
		
		
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
		//�뙎湲� 媛��졇�삤湲� 
		List<ReplyDataBean> replydtos = replyDao.getReplys(board_no);
		request.setAttribute("rdtos", replydtos); //由ы뵆�뱾 蹂대깂
		*/
		
		return new ModelAndView("/views/board/content");
	}
}


















