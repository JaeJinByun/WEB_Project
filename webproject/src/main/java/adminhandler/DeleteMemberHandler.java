package adminhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import admin.AdminDao;

@Controller
public class DeleteMemberHandler implements Commandhandler{
	@Resource
	private AdminDao adminDao;
	
	@RequestMapping("/views/deleteMember")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		adminDao.deleteMember(id);
		
		return new ModelAndView("/views/admin/deletePro");
	}
}
