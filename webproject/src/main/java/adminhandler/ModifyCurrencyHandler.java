package adminhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.AdminDao;
import logon.LogonDataBean;

@Controller
public class ModifyCurrencyHandler {
	@Resource
	private AdminDao adminDao;
	
	@RequestMapping("/views/modifyCurrency")
	public void Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		int currency = Integer.parseInt(request.getParameter("currency"));
		
		LogonDataBean dto = new LogonDataBean();
		dto.setId(id);
		dto.setCurrency(currency);
		
		adminDao.modifyCurrency(dto);
	}
	
}
