package boardhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDao;
import logon.LogonDao;
import logon.LogonDataBean;
import logonhandler.Commandhandler;

@Controller
public class WriteFormHandler implements Commandhandler{
	@Resource
	BoardDao boardDao;
	
	@Resource
	LogonDao logonDao;
	
	@RequestMapping("/views/writeForm")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		LogonDataBean dto = new LogonDataBean(); 
		
		//제목글인 경우 (일반글)
		int num = 0;		//제목글 / 답변글
		request.setAttribute("num", num);
		
		//여기서 작성자정보 받아서 
		//작성자 이메일 뽑아와야함 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
	
		dto = logonDao.getMember(id);
		String email = dto.getEmail();
		
		request.setAttribute("id", id);
		request.setAttribute("email", email);
		
		return new ModelAndView("/views/board/writeForm");
	}
}
