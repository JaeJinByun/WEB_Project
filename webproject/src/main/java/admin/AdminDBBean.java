package admin;

import java.util.List;
import java.util.Map;

import DB.SqlMapClient;
import logon.LogonDataBean;

public class AdminDBBean implements AdminDao{
	
	//유저 수 구하기
	public int getMemberCount() {
		return SqlMapClient.getSession().selectOne("DB.getMemberCount");
	}
	
	//모든 유저의 정보 가져오기 <페이징처리>
	public List<LogonDataBean> getAllmembers(Map<String,Integer>map){
		return SqlMapClient.getSession().selectList("DB.getAllmembers", map);
	}
	
	//유저 검색 
	public List<LogonDataBean> memberSearch(Map<String, String> map) {	
		return SqlMapClient.getSession().selectList("DB.memberSearch", map);
	}
	
	//유저 검색한 인원수
	public int getmemberSearchCount(String id) {
		return SqlMapClient.getSession().selectOne("DB.memberSearchCount",id);
	}

	//회원 삭제
	public void deleteMember(String id) {
		SqlMapClient.getSession().update("DB.deleteMember",id);	
	}
	
	//회원등급 수정
	public void modifyLevel(String id) {
		SqlMapClient.getSession().update("DB.modifyLevel",id);	
	}
	//재화 수정
	public void modifyCurrency(LogonDataBean dto) {
		SqlMapClient.getSession().update("DB.modifyCurrency",dto);
	}
	
}
