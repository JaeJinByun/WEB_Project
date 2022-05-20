package board;

import java.util.List;

public interface ReplyDao {
	/* 게시글 별 댓글 가져오기  */
	public List<ReplyDataBean> getReplys(int number); //글번호 주고 댓글들 가져오기
	/* 댓글 등록 */
	public void addReply(ReplyDataBean dto);
	/* 댓글 그룹안에서 순서 가져오기 */
	public int getGrps(ReplyDataBean dto);
	/* 대댓글 등록 */
	public void addRe_Reply(ReplyDataBean dto);
	/* 모댓글인지 대댓글인지 구분*/
	public int checkReply(int re_no);
	/* 모댓글 삭제시 삭제된 댓글입니다. 로 보이게하기 */
	public void deleteReplyP(int re_no);
	/* 대댓글 삭제 */
	public void deleteReply(int re_no);
}
