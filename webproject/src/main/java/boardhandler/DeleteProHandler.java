package boardhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDao;
import logonhandler.Commandhandler;

@Controller
public class DeleteProHandler implements Commandhandler{
	@Resource
	BoardDao boardDao;
	
	@RequestMapping("/views/deletePro")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");
		
		//num 글번호 게시글 지우기전 비밀번호 확인
		int resultCheck = boardDao.check(num, passwd);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("resultCheck", resultCheck);
		
		//비밀번호 맞을때
		if( resultCheck != 0) {
			int result = boardDao.deleteArticle( num );
			request.setAttribute("result",result);
		}
		
		return new ModelAndView("/views/board/deletePro");
	}
}
