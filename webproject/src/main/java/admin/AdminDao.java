package admin;

import java.util.List;
import java.util.Map;

import logon.LogonDataBean;

public interface AdminDao {
	//유저 수 구하기
	public int getMemberCount();				
	//모든 유저의 정보 가져오기
	public List<LogonDataBean> getAllmembers(Map<String,Integer>map);   
	//회원관리 페이지 
	public List<LogonDataBean> memberSearch(Map<String,String>map);     
	//회원 삭제
	public void deleteMember(String id); 		  
	//검색한 회원 수
	public int getmemberSearchCount(String id);   
	//회원 등급 수정
	public void modifyLevel(String id);	
	//재화 변경
	public void modifyCurrency(LogonDataBean dto);
}
