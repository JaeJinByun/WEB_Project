package boardhandler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DB.Commandhandler;
import board.BoardDao;
import board.BoardDataBean;

@Controller
public class LogOutBoardHandler implements Commandhandler{
	
	@Resource
	BoardDao boardDao;
	
	@RequestMapping("/views/logOutboard")
	@Override
	public ModelAndView Process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		int count = 0; 
		int size = 10;	//한 페이지에 size개씩
		int start = 0;
		int end = 0;
		String pageNum = null;	//페이지넘버
		int currentPage = 0;	//현재 페이지
		int pageSize = 5;		// [1] [2] [3] [4] [5]
		
		count = boardDao.getCount();
	
		pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		currentPage = Integer.parseInt( pageNum );
		start = (currentPage - 1) * size + 1;		// ex) 4번 페이지는 31~40의 번호를 가진 게시글이 나와야함
		end = start + size -1;						// 
		
		if( end > count ) end = count;
		int number = count - (currentPage-1)*size; 	// ex) 50 - (5-1)*10  = 나온값부터 보겠다.  
		
		int startPage = (currentPage/pageSize)*pageSize  + 1; //ex 2 페이지 보겠다  
		if(startPage%pageSize == 0) startPage -= pageSize;
		
		int endPage = startPage + pageSize -1;
		int pageCount = ( count/size ) + (count % size > 0 ? 1 : 0);
		if(endPage > pageCount) endPage = pageCount;
	
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		if(count>0) {
			List<BoardDataBean> dtos = boardDao.getArticles(map);
			request.setAttribute("dtos", dtos);
		}
		
		
		return new ModelAndView("/views/board/list");
	}

}
