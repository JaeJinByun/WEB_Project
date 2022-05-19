package DB;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

/* handler 인터페이스  */
/* 핸들러 호출은 무조건 커맨드핸들러를 거친다. */
public interface Commandhandler {
	
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	
}
