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
public class ContentHandler implements Commandhandler{
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/views/content")
	@Override
	public ModelAndView  Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum =  request.getParameter("pageNum");
		int number = Integer.parseInt(request.getParameter("number"));
	
	
		
		BoardDataBean dto = boardDao.getArticle(num);
		if(!request.getRemoteAddr().equals(dto.getIp())){ // 다른사람이 읽었을때만 
			boardDao.addCount(num); //어떤 글의 조회수를 처리할꺼냐 
		}
	
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("dto", dto);
		
		return new ModelAndView("/views/board/content");
	}
}
