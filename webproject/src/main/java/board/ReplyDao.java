package board;

import java.util.List;

public interface ReplyDao {
	/* 게시글 별 댓글 가져오기  */
	public List<ReplyDataBean> getReplys(int number); //글번호 주고 댓글들 가져오기
	/* 댓글 등록 */
	public void addReply(ReplyDataBean dto);
}
