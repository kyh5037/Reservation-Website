package kr.website.reserve.service;

import kr.website.reserve.vo.ReserveVO;

public interface ReserveService {
	
	// 예약
	public void reserve(ReserveVO vo) throws Exception;
}
