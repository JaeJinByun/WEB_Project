package logon;

import java.util.List;

import DB.SqlMapClient;

//DAO = Data Access Object
//싱글톤 패턴

public class LogonDBBean implements LogonDao{
		
	//회원가입하기 가입정보 db 저장
	public int insertMember( LogonDataBean dto ) {		
		return SqlMapClient.getSession().insert( "DB.insertMember", dto );
	}
	
	//아이디 중복 체크
	public int check(String id) {	
		return SqlMapClient.getSession().selectOne("DB.check", id);
	}
	
	//로그인 확인 용 = id 에 맞는 비밀번호가 맞는지 
	public int check(String id, String passwd) {
		int count = check(id);
		int result = 0;
		
		if(count != 0) { //아이디가있다
			LogonDataBean dto = getMember(id); 
			if(dto.getPasswd().equals(passwd)) {
				result = 1; //아이디 비번 맞음
			}else {
				result = 0; //비번 틀림
			}
		}else {  //아이디가 없다
			result = -1;
		}	
		return result;
	}
	// 관리자 인지
	public int adminck(String id) {
		return SqlMapClient.getSession().selectOne("DB.adminck", id);
	}
	
	//db delete 처리 메소드
	public int deleteMember(String id) {	
		return SqlMapClient.getSession().delete( "DB.deleteMember", id);
	}
	
	//회원 유저의 정보 가져오기
	public LogonDataBean getMember( String id ) {
		return SqlMapClient.getSession().selectOne( "DB.getMember", id );
	}
	//모든 유저의 정보 가져오기
	public List<LogonDataBean> getAllmembers(){
		return SqlMapClient.getSession().selectList("DB.getAllmembers");
	}
	//회원 정보 수정
	public int modifyMember(LogonDataBean dto) { //update 시키기..
		return SqlMapClient.getSession().update("DB.modifyMember",dto); 
	}
	
	
}





















