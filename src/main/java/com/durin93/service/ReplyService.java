package com.durin93.service;

import java.util.List;

import com.durin93.domain.Criteria;
import com.durin93.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo)throws Exception;
	
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
}
