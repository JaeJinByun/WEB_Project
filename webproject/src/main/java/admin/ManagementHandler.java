package admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import logon.LogonDao;
import logon.LogonDataBean;

@Controller
public class ManagementHandler implements Commandhandler{
	@Resource
	private LogonDao logonDao;
	
	
	@RequestMapping("/views/manage")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//회원정보 불러오기
		
		List<LogonDataBean> dtos = logonDao.getAllmembers();
		request.setAttribute("dtos", dtos);
		
		return new ModelAndView("/views/admin/manage");
	}
}
