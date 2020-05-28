package kr.website.reserve.dao;

import kr.website.reserve.vo.ReserveVO;

public interface ReserveDAO {
	
	// 예약
	public void reserve(ReserveVO vo) throws Exception;
}
