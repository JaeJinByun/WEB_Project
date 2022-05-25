package adminhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.AdminDao;

@Controller
public class LevelModifyHandler {
	
	@Resource
	private AdminDao adminDao;
	
	@RequestMapping("/views/modifyLevel")
	public void Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		adminDao.modifyLevel(id);
	}
}
