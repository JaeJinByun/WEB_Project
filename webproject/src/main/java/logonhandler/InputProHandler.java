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
		
		dto.setId(request.getParameter("id"));
		dto.setAdminck(0);
		dto.setPasswd(request.getParameter("passwd"));
			
		/* 전화번호 합쳐서 저장시키기 */
		String tel = null;
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3  = request.getParameter("tel3");
		if(!tel1.equals("") && !tel2.equals("") && !tel3.equals("")){
			tel = tel1 + "-" + tel2 + "-" + tel3;		
		}
		dto.setTel(tel);
		
		/* 이메일 합쳐서 저장시키기 */
		String email = null;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		email = email1 + "@" + email2;
		dto.setEmail(email);
		
		dto.setCurrency(0);
		
		//DB에 가입한 날짜 넣어주기 테이블에 없어서 빼둠
//		dto.setReg_date( new Timestamp( System.currentTimeMillis()));	
		
		int result = logonDao.insertMember(dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("/views/inputPro");
	}
}





















