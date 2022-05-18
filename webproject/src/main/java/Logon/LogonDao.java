package logon;

public interface LogonDao {
	public int check(String id);	//아이디 중복 체크
	public int check(String id, String passwd); // 아이디에 맞는 패스워드 검증 로그인확인용
	public int insertMember( LogonDataBean dto );
	public LogonDataBean getMember(String id);
//	public int modifyMember(LogonDataBean dto);
//	public int deleteMember(String id);
}
