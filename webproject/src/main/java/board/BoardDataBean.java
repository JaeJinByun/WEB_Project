package board;

import java.sql.Timestamp;

public class BoardDataBean {
	private int num;			//글번호
	private String writer; 		//작성자
	private String email;		//이메일
	private String subject;		//글제목
	private String passwd;		//비밀번호
	private Timestamp reg_date; //작성일
	private int readcount;		//조회수
	private String content;		//글내용
	private String ip;			//ip
	
	public int getNum() {
		return num;
	}
	public void setNum(int number) {
		this.num = number;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}

		
	
}
