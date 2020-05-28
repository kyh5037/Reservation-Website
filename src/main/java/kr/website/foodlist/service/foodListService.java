package kr.website.foodlist.service;

import java.util.List;

import kr.website.foodlist.vo.foodListVO;

public interface foodListService {
	
	// 내 주변 밥집 호출
	public List<foodListVO> foodView(foodListVO vo) throws Exception;
	
	// 상세보기
	public foodListVO foodDetail(int no) throws Exception;
	
}
