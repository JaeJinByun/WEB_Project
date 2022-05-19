package board;

import java.util.List;
import java.util.Map;

import DB.SqlMapClient;


//싱글톤 패턴 
public class BoardDBBean implements BoardDao{
	
	//글 개수 받아오기
	public int getCount() {
		String sql = "select count(*) from board";
		return SqlMapClient.getSession().selectOne("DB.getCount",sql);
	}
	
	//페이징처리
	public List<BoardDataBean> getArticles(Map<String,Integer>map){
		return SqlMapClient.getSession().selectList("DB.getArticles",map);			
	}
	
	//글 가져오기 
	public BoardDataBean getArticle( int num ) {
		return SqlMapClient.getSession().selectOne("DB.getArticle",num);
	}
	
	//조회수 처리
	public void addCount(int num) {
		SqlMapClient.getSession().update("DB.addCount",num);
	}
	
	//글 등록
	public int insertArticle(BoardDataBean dto) {	
		//그리고 넘긴다. return 값은 업데이트된 행의 개수를 int 형으로 반환한다.
		return SqlMapClient.getSession().insert("DB.insertArticle", dto);
			
	}
	
	//글 번호와 비밀번호를 체크 
	public int check (int num, String passwd) {
		int result = 0;
		BoardDataBean dto = getArticle( num );
		if(passwd.equals(dto.getPasswd())) {
			result = 1; //비번같다
		}else {
			result = 0; //틀리다
		}
		
		return result;
	}
	
	
	//글삭제
	//글삭제
	public int deleteArticle(int num) {	//num = 삭제하려는 글번호 
		int result = 0;
									
		SqlMapClient.getSession().delete("DB.deleteArticle",num);
									
		return result;
	}
	
	
	
	public int modifyArticle(BoardDataBean dto) {
	
		return SqlMapClient.getSession().update("DB.modifyArticle",dto);
	}
	
		
}


















































