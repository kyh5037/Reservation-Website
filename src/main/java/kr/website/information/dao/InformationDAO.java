package kr.website.information.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.review.vo.ReviewVO;

public interface InformationDAO {
	
	public void stoInfo(InformationVO vo) throws Exception;
	
	public void stoUpdate(InformationVO vo) throws Exception;
	
	public void menuInfo(InformationVO vo) throws Exception;
	
	public int stoNo(int no) throws Exception;
	
	public InformationVO selectStore(int no) throws Exception;
	
	public List<InformationVO> selectMenu(int no) throws Exception;
	
	public void averagePrice(int no) throws Exception;
	
	public List<ReserveVO> resInfo (int no) throws Exception;
	
	public List<ReserveVO> resManage (HttpSession session, int no) throws Exception;
	
	public void resCancel(ReserveVO vo) throws Exception;
	
	public void resCheck(ReserveVO vo) throws Exception;
	
	public void tbUpdate(ReserveVO vo) throws Exception;
	
	public void tbInsert(int no) throws Exception;
	
	public void maxUpdate(ReserveVO vo)throws Exception;
	
	public List<ReviewVO> myReview(int no) throws Exception;
}
