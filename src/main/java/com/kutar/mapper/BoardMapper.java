package com.kutar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kutar.common.Criteria;
import com.kutar.model.BoardVO;

public interface BoardMapper {

	List<BoardVO> getList();
	List<BoardVO> getListWithPaging(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	void insert(BoardVO board);
	void insertSelectKey(BoardVO board);
	BoardVO read(Long bno);
	int delete(Long bno);
	int update(BoardVO board);
	
	//댓글수 업데이트
	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
