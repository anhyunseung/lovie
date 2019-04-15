package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.Comment_noticeDTO;
import poly.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {

	List<NoticeDTO> getNoticeList() throws Exception;

	void InsertNoticeInfo(NoticeDTO pDTO) throws Exception;

	NoticeDTO getNoticeInfo(NoticeDTO pDTO) throws Exception;

	void updateNoticeInfo(NoticeDTO pDTO) throws Exception;

	void deleteNoticeInfo(NoticeDTO pDTO) throws Exception;

	public void insertComment(Comment_noticeDTO cdto) throws Exception;
	
	public void deleteComment(Comment_noticeDTO cdto) throws Exception;
	
	public void updateComment(Comment_noticeDTO cdto) throws Exception;
	
	public List<Comment_noticeDTO> getComment(NoticeDTO rdto) throws Exception;

	void deleteCommentALL(String seq) throws Exception;
}