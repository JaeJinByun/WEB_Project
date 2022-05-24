package logonhandler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import logon.LogonDao;
import logon.LogonDataBean;

//회원가입 버튼 클릭시 프로세스 db insert 시키고 inputPro 페이지로 넘김
@Controller
public class InputProHandler implements Commandhandler{
	
	@Resource
	private LogonDao logonDao;
		
	@RequestMapping("/views/inputPro")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		request.setCharacterEncoding("utf-8");
		LogonDataBean dto = new LogonDataBean();
		
		dto.setId(request.getParameter("sign_up_id"));
		dto.setAdminck(0);    //처음 가입할때 0으로
		dto.setPasswd(request.getParameter("sign_up_passwd"));	
		dto.setTel(request.getParameter("tel"));
		dto.setEmail(request.getParameter("email"));
		dto.setCurrency(0);	  //재화 0으로 가입
		int result = logonDao.insertMember(dto);		
		request.setAttribute("result", result);
				
		//DB에 가입한 날짜 넣어주기 테이블에 없어서 빼둠
//		dto.setReg_date( new Timestamp( System.currentTimeMillis()));	
		
		return new ModelAndView("/views/inputPro");
	}
}





















