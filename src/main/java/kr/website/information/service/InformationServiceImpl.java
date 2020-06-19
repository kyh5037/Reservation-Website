package kr.website.information.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.website.information.dao.InformationDAO;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.review.vo.ReviewVO;

@Service
public class InformationServiceImpl implements InformationService {
	
	@Inject
	private InformationDAO dao;
	
	@Override
	public void stoInfo(InformationVO vo) throws Exception {
		dao.stoInfo(vo);
	}
	
	@Override
	public void stoUpdate(InformationVO vo) throws Exception {
		dao.stoUpdate(vo);
	}
	
	@Override
	public void menuInfo(InformationVO vo) throws Exception {
		dao.menuInfo(vo);
	}
	
	@Override
	public int stoNo(int no) throws Exception {
		return dao.stoNo(no);
	}
	
	@Override
	public InformationVO selectStore(int no) throws Exception{
		return dao.selectStore(no);
	}
	
	@Override
	public List<InformationVO> selectMenu (int no) throws Exception{
		return dao.selectMenu(no);
	}
	
	@Override
	public void averagePrice(int no) throws Exception{
		dao.averagePrice(no);
	}
	
	@Override
	public List<ReserveVO> resInfo(int no) throws Exception {
		return dao.resInfo(no);
	}
	
	@Override
	public List<ReserveVO> resManage (HttpSession session, int no) throws Exception {
		return dao.resManage(session, no);
	}
	
	@Override
	public void resCancel(ReserveVO vo) throws Exception{
		dao.resCancel(vo);
	}
	
	@Override
	public void resCheck (ReserveVO vo) throws Exception {
		dao.resCheck(vo);
	}
	
	@Override
	public void tbUpdate (ReserveVO vo) throws Exception {
		dao.tbUpdate(vo);
	}
	
	@Override
	public void tbInsert (int no) throws Exception{
		dao.tbInsert(no);
	}
	
	@Override
	public void maxUpdate(ReserveVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.maxUpdate(vo);
	}

	@Override
	public List<ReviewVO> myReview(int no) throws Exception {
		return dao.myReview(no);
	}
}
