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
}
