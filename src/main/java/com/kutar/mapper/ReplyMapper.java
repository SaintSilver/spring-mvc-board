package com.kutar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kutar.common.Criteria;
import com.kutar.model.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO reply);
	
	public ReplyVO read(Long rno);
	
	public int update(ReplyVO reply);
	
	public int delete(Long rno);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
	
	public int getCountByBno(Long bno);
	
}
