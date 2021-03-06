package logonhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import logon.LogonDao;

@Controller
public class LoginProHandler implements Commandhandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/views/loginPro")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String id = request.getParameter("sign_in_id");
		String passwd = request.getParameter("sign_in_passwd");	
		
		int result = logonDao.check(id , passwd);
		
		//어드민인지? 0이면 일반회원 1이면 관리자
		int admin = logonDao.adminck(id);
		System.out.println(admin);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		request.setAttribute("admin", admin);
		
		//아이디 비번이 맞았을때 
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);				
		}
		
		
		
		return new ModelAndView("/views/loginPro");			
	}
}
