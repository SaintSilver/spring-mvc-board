package com.kutar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kutar.common.Criteria;
import com.kutar.mapper.ReplyMapper;
import com.kutar.model.ReplyPageDTO;
import com.kutar.model.ReplyVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{

	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO reply) {
		return mapper.insert(reply);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		return mapper.update(reply);
	}

	@Override
	public int remove(Long rno) {
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}

}
