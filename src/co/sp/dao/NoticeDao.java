package co.sp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.sp.beans.Notice_s;
import co.sp.mapper.NoticeMapper;

@Repository
public class NoticeDao {
	@Autowired
	private NoticeMapper noticemapper;
	
	public void addNotice(Notice_s noticeBean) {
		noticemapper.addNotice(noticeBean);
	}
	
	public void deleteNotice(Notice_s noticeBean) {
		noticemapper.deleteNotice(noticeBean);
	}
	
	public List<Notice_s> getNotice(Notice_s noticeBean) {
		return noticemapper.getNotice(noticeBean);
	}
	
	public void updateNotice(Notice_s noticeBean) {
		noticemapper.updateNotice(noticeBean);
	}
	
	public int getNoticeCnt() {
		return noticemapper.getNoticeCnt();
	}
}