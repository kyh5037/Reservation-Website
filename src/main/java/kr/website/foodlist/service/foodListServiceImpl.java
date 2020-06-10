package kr.website.foodlist.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.website.foodlist.dao.foodListDAO;
import kr.website.foodlist.vo.foodListVO;
import kr.website.information.vo.InformationVO;

@Service
public class foodListServiceImpl implements foodListService {
	
	@Inject
	private foodListDAO dao;
	
	@Override
	public List<foodListVO> foodView(foodListVO vo) throws Exception {
		return dao.foodView(vo);
	}
	
	@Override
	public foodListVO foodDetail(int no) throws Exception {
		return dao.foodDetail(no);
	}
	
	@Override
	public List<InformationVO> menu(int no) throws Exception {
		return dao.menu(no);
	}
}
