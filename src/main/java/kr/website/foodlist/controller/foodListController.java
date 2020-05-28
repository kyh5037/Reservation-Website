package kr.website.foodlist.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.website.foodlist.service.foodListService;
import kr.website.foodlist.vo.foodListVO;
import kr.website.member.controller.MemberController;


@Controller
@RequestMapping(value = "/foodlist/*")
public class foodListController {
	
	private static final Logger Logger =  LoggerFactory.getLogger(foodListController.class);
	
	@Inject
	foodListService service;

	// 내 주변 밥집 화면 호출
	@RequestMapping(value = "/foodView")
	public String foodView(Model model, foodListVO vo) throws Exception {
		Logger.info("foodView");
		
		List<foodListVO> view = null;
		view = service.foodView(vo);
		
		model.addAttribute("view", view);
		
		return "/foodlist/foodView"; 
	}
	
	@RequestMapping(value = "/foodDetail", method=RequestMethod.POST)
	public String foodDetail(Model model, foodListVO vo) throws Exception {
		
		int no = vo.getSto_no();
	
		foodListVO detail = service.foodDetail(no);
		
		model.addAttribute("detail", detail);
		
		return "/foodlist/foodDetail";
	}
	
	@RequestMapping(value = "/reserve", method=RequestMethod.POST)
	public String foodReserve(Model model, foodListVO vo) throws Exception {
		
		int no = vo.getSto_no();
		
		foodListVO reserve = service.foodDetail(no);
		
		model.addAttribute("reserve", reserve);
		
		return "/foodlist/reserve";
	}
}
