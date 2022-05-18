package logonhandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InputFormHandler implements Commandhandler{
	@RequestMapping("/views/inputForm")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		return new ModelAndView("/views/inputForm");
	}
}
