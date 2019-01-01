package com.kutar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kutar.common.Criteria;
import com.kutar.model.BoardVO;

public interface BoardMapper {

	List<BoardVO> getList();
	List<BoardVO> getListWithPaging(Criteria cri);
	
	@Select("SELECT COUNT(*) FROM tbl_board WHERE bno > 0")
	int getTotalCount();
	
	void insert(BoardVO board);
	void insertSelectKey(BoardVO board);
	BoardVO read(Long bno);
	int delete(Long bno);
	int update(BoardVO board);
}
