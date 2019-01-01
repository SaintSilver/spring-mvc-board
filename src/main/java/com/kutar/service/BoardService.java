package com.kutar.service;

import java.util.List;

import com.kutar.common.Criteria;
import com.kutar.model.BoardVO;

public interface BoardService {

	void register(BoardVO board);
	BoardVO get(Long bno);
	boolean modify(BoardVO board);
	boolean remove(Long bno);
	
	List<BoardVO> getList(Criteria cri);
	int getTotal();
}
