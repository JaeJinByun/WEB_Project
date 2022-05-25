package DB;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import admin.AdminDBBean;
import admin.AdminDao;
import board.BoardDBBean;
import board.BoardDao;
import board.ReplyDBBean;
import board.ReplyDao;
import logon.LogonDBBean;
import logon.LogonDao;

@Configuration
public class CreateBean {
	
	@Bean
	public LogonDao logonDao() {
		return new LogonDBBean();
	}
	
	@Bean
	public BoardDao boardDao() {
		return new BoardDBBean();
	}
	@Bean
	public ReplyDao replyDao() {
		return new ReplyDBBean();
	}
	
	@Bean
	public AdminDao adminDao() {
		return new AdminDBBean();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
}















