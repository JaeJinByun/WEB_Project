package logonhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import logon.LogonDao;

@Controller
public class MainHandler implements Commandhandler{
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/views/main")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		return new ModelAndView("/views/main");
	}

}
