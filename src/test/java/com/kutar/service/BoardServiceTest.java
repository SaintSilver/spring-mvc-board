package com.kutar.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kutar.common.Criteria;
import com.kutar.model.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {
	
	@Autowired
	private BoardService service;

	@Test
	public void register() {
		BoardVO board = new BoardVO();
		board.setTitle("test 제목");
		board.setContent("test 내용");
		board.setWriter("tester");
		service.register(board);
		log.info(board);
	}
	
	@Test
	public void getListWithPaging() {
		service.getList(new Criteria(3)).forEach(board->log.info(board));
	}
	
	@Test
	public void getTotal() {
		service.getTotal(new Criteria());
	}
	
	@Test
	public void read() {
		log.info(service.get(1L));
	}
	
	@Test
	public void modify() {
		BoardVO board = new BoardVO();
		board.setBno(1L);
		board.setTitle("test 수정 제목");
		board.setContent("test 수정 내용");
		board.setWriter("tester");
		log.info(service.modify(board));
	}
	
	@Test
	public void delete() {
		log.info(service.remove(11L));
	}
}
