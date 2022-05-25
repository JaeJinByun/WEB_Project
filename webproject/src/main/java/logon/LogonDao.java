package logon;

public interface LogonDao {
	public int check(String id);			      //아이디 중복 체크
	public int check(String id, String passwd);   //아이디에 맞는 패스워드 검증 로그인확인용
	public int adminck(String id); 				  //관리자인지
	public int insertMember( LogonDataBean dto ); //유저 가입
	public LogonDataBean getMember(String id);	  //id 에 맞는 유저 구해오기
//	public int modifyMember(LogonDataBean dto);
//	public int deleteMember(String id);
	
}
