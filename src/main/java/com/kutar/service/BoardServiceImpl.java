package com.kutar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kutar.mapper.BoardMapper;
import com.kutar.model.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		log.info("새로운 글 등록 : {}", board.toString());
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("글 수정: {}", board.toString());
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("글 삭제 : {}", bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

}
