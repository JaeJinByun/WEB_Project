package logon;

//DTO = Data Transfer Object

public class LogonDataBean {
	private String id;			//아이디
	private int adminck;		//사용자종류 0 or 1
	private String passwd;		//비밀번호
	private String tel;			//전화번호
	private String email;		//이메일
	private int currency;       //보유재화
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAdminck() {
		return adminck;
	}
	public void setAdminck(int adminck) {
		this.adminck = adminck;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCurrency() {
		return currency;
	}
	public void setCurrency(int currency) {
		this.currency = currency;
	}
	
	
	
	
}
