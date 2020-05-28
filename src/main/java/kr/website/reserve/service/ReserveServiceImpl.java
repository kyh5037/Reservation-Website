package kr.website.reserve.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.website.reserve.dao.ReserveDAO;
import kr.website.reserve.vo.ReserveVO;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Inject
	private ReserveDAO dao;
	
	public void reserve(ReserveVO vo) throws Exception {
		
		dao.reserve(vo);
	}
	
}
