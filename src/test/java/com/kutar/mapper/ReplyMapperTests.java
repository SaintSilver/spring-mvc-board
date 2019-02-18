package com.kutar.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kutar.common.Criteria;
import com.kutar.model.ReplyVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class ReplyMapperTests {
	
	@Autowired
	private ReplyMapper mapper;
	
	private Long[] bnoArr = {32760L, 32755L, 32754L, 24562L, 24561L};
	
	@Test
	public void testMapper() {
		log.info(mapper.toString());
	}
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i->{
			ReplyVO reply = new ReplyVO();
			reply.setBno(bnoArr[i % 5]);
			reply.setReply("댓글 테스트: " + i);
			reply.setReplyer("댓글자: " +i);
			mapper.insert(reply);
		});
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(5L).toString());
	}
	
	@Test
	public void testDelete() {
		mapper.delete(4L);
	}
	
	@Test
	public void testUpdate() {
		ReplyVO reply = mapper.read(5L);
		reply.setReply("업데이트된 댓글");
		mapper.update(reply);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria(2);
		log.info(cri.toString());
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 32760L);
		replies.forEach(reply->log.info(reply.toString()));
	}
	
}
