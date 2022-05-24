package boardhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import board.ReplyDao;
import board.ReplyDataBean;

@Controller
public class ReplyProHandler implements Commandhandler{
	
	@Resource
	private ReplyDao replyDao;
	
	@RequestMapping("/views/replyPro.do")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String bnumber = request.getParameter("bnumber");
		String pageNum = request.getParameter("pageNum");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		/*  reply     = 댓글 내용   
		 *  sessionid = 작성자 아이디
		 *  boardnum  = 게시글 번호
 		 */	
	//	int number = Integer.parseInt(request.getParameter("number"));
	//	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		
    //------------DTO 세팅------------------------------------//
		ReplyDataBean dto = new ReplyDataBean();

		dto.setRe_content(request.getParameter("reply"));
		dto.setId(request.getParameter("sessionid"));
		int board_no = Integer.parseInt(request.getParameter("boardnum"));
		dto.setBoard_no(board_no);
		
		replyDao.addReply(dto);
		
		
		return new ModelAndView("redirect:content.do?num="+board_no+"&pageNum="+pageNum+"&bnumber="+bnumber+"&currentPage="+currentPage);
	}
	
	
	@RequestMapping("/views/rreplyPro.do")
	public void RreplyPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ReplyDataBean dto = new ReplyDataBean();
		
		//대댓글 내용
		String text = request.getParameter("text");
		dto.setRe_content(text);
		
		//부모댓글 번호
		int p_reply_no = Integer.parseInt(request.getParameter("p_reply_no"));
		dto.setGrp(p_reply_no);
		
		//게시글번호
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		dto.setBoard_no(board_no);
		
		//아이디
		String id 	 = request.getParameter("id");
		dto.setId(id);
			
		//해당 댓글의 grps(그룹내에서의 순서) 뽑아서 가져오기
		int grps = replyDao.getGrps(dto) + 1;
		dto.setGrps(grps);
		dto.setRe_level(1);
		
		replyDao.addRe_Reply(dto);
		
	}
	
	//댓글 삭제
	@RequestMapping("/views/replyDeletePro.do")
	public void RreplyDeletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//모댓글인지 대댓글인지 구별 ㄱ
		
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		int result = replyDao.checkReply(re_no);
		
		if(result == 0) {
			replyDao.deleteReplyP(re_no);
		}else {
			replyDao.deleteReply(re_no);
		}
		
	}
	
	//댓글 수정
	@RequestMapping("/views/modifyreplyPro.do")
	public void ModifyreplyPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ReplyDataBean dto = new ReplyDataBean();
		int re_no = Integer.parseInt(request.getParameter("re_no"));
		String re_content = request.getParameter("re_content");
		
		dto.setRe_no(re_no);
		dto.setRe_content(re_content);
		
		replyDao.modifyReply(dto);
		
	}
	
	
}


































