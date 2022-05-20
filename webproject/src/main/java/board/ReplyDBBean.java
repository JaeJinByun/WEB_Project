package board;

import java.util.List;

import DB.SqlMapClient;

public class ReplyDBBean implements ReplyDao{
	
	//댓글들 가져오기
	public List<ReplyDataBean> getReplys(int number) {
		return SqlMapClient.getSession().selectList("DB.getReplys",number);
	}
	
	//댓글 등록
	public void addReply(ReplyDataBean dto) {
		SqlMapClient.getSession().insert("DB.addReply", dto);	
	}
	
	//댓글 그룹내에서 순서가져오기
	public int getGrps(ReplyDataBean dto) {
		return SqlMapClient.getSession().selectOne("DB.getGrps",dto);
	}
	
	//대댓글 등록하기
	public void addRe_Reply(ReplyDataBean dto) {
		SqlMapClient.getSession().insert("DB.addRe_Reply",dto);
		
	}
	
	//모댓글인지 대댓글인지 구결
	public int checkReply(int re_no) {
		return SqlMapClient.getSession().selectOne("DB.checkReply",re_no);
	}
	
	//부모댓글 삭제시
	public void deleteReplyP(int re_no) {
		SqlMapClient.getSession().update("DB.deleteReplyP",re_no);
		
	}
	
	//대댓글 삭제시
	public void deleteReply(int re_no) {
		SqlMapClient.getSession().delete("DB.deleteReply",re_no);
		
	}
}
























