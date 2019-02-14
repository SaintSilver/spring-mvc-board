package com.kutar.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kutar.common.Criteria;
import com.kutar.model.BoardVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class BoardMapperTest {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void getList() {
		mapper.getList().forEach(board->log.info(board.toString()));
	}
	
	@Test
	public void getListWithPaging() {
		Criteria cri = new Criteria();
		cri.setKeyword("test");
		cri.setType("T");
		mapper.getListWithPaging(cri).forEach(board->log.info(board.toString()));
	}
	
	@Test
	public void getTotalCount() {
		Criteria cri = new Criteria();
		//cri.setKeyword("test");
		//cri.setType("TC");
		mapper.getTotalCount(cri);
	}
	
	@Test
	public void insert() {
		BoardVO board = new BoardVO();
		board.setTitle("test 제목");
		board.setContent("test 내용");
		board.setWriter("tester");
		mapper.insert(board);
		log.info(board.toString());
	}
	
	@Test
	public void insertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("test 제목");
		board.setContent("test 내용");
		board.setWriter("tester");
		mapper.insertSelectKey(board);
		log.info(board.toString());
	}
	
	@Test
	public void read() {
		log.info(mapper.read(1L).toString());
	}
	
	@Test
	public void update() {
		BoardVO board = new BoardVO();
		board.setBno(3L);
		board.setTitle("test 수정 제목");
		board.setContent("test 수정 내용");
		board.setWriter("tester");
		mapper.update(board);
	}
	
	@Test
	public void delete() {
		mapper.delete(2L);
	}
}
