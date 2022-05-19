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
		
		String number = request.getParameter("number");
		String pageNum = request.getParameter("pageNum");
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
		
//		replyDao.addReply(dto);
		
		
		return new ModelAndView("redirect:content.do?num="+board_no+"&pageNum="+pageNum+"&number="+number);
	}
	
	@RequestMapping("/views/rereplyPro.do")
	
	
	
}















