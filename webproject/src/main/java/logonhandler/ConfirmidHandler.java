package logonhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import logon.LogonDao;

@Controller
public class ConfirmidHandler{
	
	@Resource
	private LogonDao logonDao;

	@RequestMapping("/views/confirmid")
	@ResponseBody
	public String idCheck(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String id = request.getParameter("user_id");
		String result = Integer.toString(logonDao.check( id ));
		// result 가 0 이면 아이디가없다
		// result 가 1 이면 아이디 존재
		System.out.println(result);
		return result;
	}
	
}




















