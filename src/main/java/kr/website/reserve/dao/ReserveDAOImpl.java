package kr.website.reserve.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.reserve.vo.ReserveVO;

@Repository
public class ReserveDAOImpl implements ReserveDAO {
	
	@Inject
	private SqlSession sql;
	
	public void reserve(ReserveVO vo) throws Exception {
		sql.insert("store.reserve", vo);
	}
}
