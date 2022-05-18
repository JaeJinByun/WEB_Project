package logonhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logon.LogonDao;

@Controller
public class ConfirmidHandler implements Commandhandler{
	
	@Resource
	private LogonDao logonDao;

	@RequestMapping("/views/confirmid")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter("id");		
		int result = logonDao.check( id );
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		return new ModelAndView("/views/confirmid");
	}
	
}
