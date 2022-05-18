package boardhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDao;
import board.BoardDataBean;
import logonhandler.Commandhandler;

@Controller
public class ModifyProHandler implements Commandhandler{
	
	@Resource
	BoardDao boardDao;
	
	@RequestMapping("/views/modifyPro")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		request.setCharacterEncoding("utf-8");
		
	//<!-- 넘어오는 데이터 num email, subject, content, passwd -->
	 	BoardDataBean dto = new BoardDataBean();
	 	dto.setNum(Integer.parseInt(request.getParameter("num")));
	 	dto.setEmail(request.getParameter("email"));
	 	dto.setSubject(request.getParameter("subject"));
	 	dto.setContent(request.getParameter("content"));
	 	dto.setPasswd(request.getParameter("passwd"));

		int result = boardDao.modifyArticle(dto);

		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return new ModelAndView("/views/board/modifyPro");
	}
}
