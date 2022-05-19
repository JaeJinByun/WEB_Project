package boardhandler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import board.BoardDao;
import board.BoardDataBean;

@Controller
public class WriteProHandler implements Commandhandler{
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/views/writePro")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		request.setCharacterEncoding("utf-8");
	
	//------------------DTO 데이터 세팅 -----------------------------------------------------//
		// post 값으로 넘어온 데이터들 : writer email subject content passwd 가 입력한값으로 넘어온다 
		// hidden 으로 넘어온 데이터들 : num ref re_step re_level  
		BoardDataBean dto = new BoardDataBean();
		dto.setWriter(request.getParameter("writer"));
		dto.setEmail(request.getParameter("email"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPasswd(request.getParameter("passwd"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setIp(request.getRemoteAddr());		
	//-------------------------------------------------------------------------------------//

	//---------------DAO를 통해 함수처리및 결과값 받기----------------------------------------------//
		
		int result = boardDao.insertArticle(dto);

		request.setAttribute("result", result);
		
		return new ModelAndView("/views/board/writePro");
	}
}
