package kr.website.foodlist.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.foodlist.vo.foodListVO;

@Repository
public class foodListDAOImpl implements foodListDAO {
	
	@Inject
	private SqlSession sql;
	
	@Override
	public List<foodListVO> foodView(foodListVO vo) throws Exception {
		return sql.selectList("foodlist.list", vo);
	}
	
	@Override
	public foodListVO foodDetail(int no) throws Exception {
		return sql.selectOne("foodlist.detail", no);
	}
}
