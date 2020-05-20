package com.cannes.movie.service;

import java.util.List;

import com.cannes.movie.domain.ReplyVO;

public interface ReplyService {

	/* 공용 메소드(회원, 관리자, 비회원) */
	int create(ReplyVO vo); // 영화 감상평 등록
	List<ReplyVO> readAll(int movieNo); // 영화 감상평 전체 가져오기(해당영화)
	int update(ReplyVO vo); // 영화 감상평 수정
	int delete(int replyNo); // 영화 감상평 삭제	
	
} // end ReplyService
