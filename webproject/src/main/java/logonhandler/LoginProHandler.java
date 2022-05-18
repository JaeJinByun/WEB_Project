package logonhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logon.LogonDao;

@Controller
public class LoginProHandler implements Commandhandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/views/loginPro")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");	
		
		int result = logonDao.check(id , passwd);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);			
		}
		
		return new ModelAndView("/views/loginPro");
	}
}
