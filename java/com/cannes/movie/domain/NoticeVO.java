package com.cannes.movie.domain;

import java.util.Date;

public class NoticeVO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	
	// 생성자
	public NoticeVO() {}
	public NoticeVO(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
	}
	// end 생성자
	
	// getter, setter
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	// end getter, setter
	
	@Override
	public String toString() {
		String str = "공지 번호 : " + noticeNo + "\n"
					+ "공지 제목 : " + noticeTitle + "\n"
					+ "공지 내용 : " + noticeContent + "\n"
					+ "공지 작성일 : " + noticeDate;
		return str;
	} // end toString()
	
	
} // end NoticeVO
