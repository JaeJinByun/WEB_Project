package board;

import java.sql.Timestamp;

public class ReplyDataBean {
	private int re_no;  			//댓글 번호
	private Timestamp re_reg_date; 	//댓글 단 날짜
	private String re_content;		//댓글 내용
	private int re_level; 			//댓글인지 댓글의 답글인지 구분 0=댓글 1=댓글의 답글
	private String id;				//작성자
	private int board_no; 			//게시글 번호  
	private int grp;				//댓글 그룹번호
	private int grps;				//그룹 안에서의 순서
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public Timestamp getRe_reg_date() {
		return re_reg_date;
	}
	public void setRe_reg_date(Timestamp re_reg_date) {
		this.re_reg_date = re_reg_date;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getGrps() {
		return grps;
	}
	public void setGrps(int grps) {
		this.grps = grps;
	}
	
	
}
