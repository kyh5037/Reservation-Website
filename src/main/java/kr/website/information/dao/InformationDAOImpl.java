package kr.website.information.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.review.vo.ReviewVO;

@Repository
public class InformationDAOImpl implements InformationDAO {
	
	@Inject
	private SqlSession sql;
	
	@Override
	public void stoInfo(InformationVO vo) throws Exception {
		sql.insert("information.stoInfo", vo);
	}
	
	@Override
	public void stoUpdate(InformationVO vo) throws Exception {
		sql.update("information.stoUpdate", vo);
	}
	
	@Override
	public void menuInfo(InformationVO vo) throws Exception {
		sql.insert("information.menuInfo", vo);
	}
	
	@Override
	public int stoNo(int no) throws Exception {
		if(sql.selectOne("information.stoNo", no) == null) {
			return 0;
		}
		return sql.selectOne("information.stoNo", no);
	}
	
	@Override
	public InformationVO selectStore(int no) throws Exception {
		return sql.selectOne("information.selectStore", no);
	}
	
	@Override
	public List<InformationVO> selectMenu(int no) throws Exception{
		return sql.selectList("information.selectMenu", no);
	}
	
	@Override
	public void averagePrice(int no) throws Exception {
		sql.update("information.averagePrice", no);
	}
	
	@Override
	public List<ReserveVO> resInfo (int no) throws Exception {
		return sql.selectList("information.resInfo", no);
	}
	
	@Override
	public List<ReserveVO> resManage (HttpSession session, int no) throws Exception {
		
		return sql.selectList("information.resManage", no);
	}
	
	
	
	@Override
	public void resCheck(ReserveVO vo) throws Exception {
		sql.update("information.resCheck", vo); 
	}
	
	@Override
	public void resCancel (ReserveVO vo) throws Exception{
		sql.delete("information.resCancel", vo);
	}
	
	@Override
	public void tbUpdate(ReserveVO vo) throws Exception {
		sql.update("information.tbUpdate", vo);
	}
	
	@Override
	public void tbInsert(int no) throws Exception{
		sql.insert("information.tbInsert", no);
	}
	
	@Override
	public void maxUpdate(ReserveVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update("information.maxUpdate", vo);
	}

	@Override
	public List<ReviewVO> myReview(int no) throws Exception {
		return sql.selectList("information.myReview", no);
	}
}
