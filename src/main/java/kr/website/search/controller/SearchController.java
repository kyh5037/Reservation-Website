package kr.website.search.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.website.foodlist.service.foodListService;
import kr.website.foodlist.vo.foodListVO;
import kr.website.search.service.SearchService;

@Controller
@RequestMapping("/search/*")
@SuppressWarnings("unchecked")
public class SearchController {
	
	private static final Logger Logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private SearchService service;
	@Inject
	private foodListService foodService;
	
	// 검색 리스트 화면 호출
	@RequestMapping(value="searchList", method=RequestMethod.POST)
	public String  write(@RequestParam("search") String search, Model model) throws Exception {
		Logger.info("search");
		
		if(search == "" || search == null) return "/search/searchList";
		List<foodListVO> view = service.list(search);
		for(int i=0; i<view.size(); i++) {
			try {
			List<String> tag = foodService.tag(view.get(i).getSto_no());
			int congest = foodService.congest(view.get(i).getSto_no());
			
			String tag_name = new String();
			for(int j=0; j < tag.size(); j++) {
				tag_name = tag_name + "#" + tag.get(j) + " "; 
			}
			
			view.get(i).setTag(tag_name);
			view.get(i).setCongest(congest);
			}catch(Exception e) {}
		}
		if(view.isEmpty()) return "/search/searchList";
		String x = view.get(0).getSto_gps_x();
		String y = view.get(0).getSto_gps_y();
		
		model.addAttribute("view", view);
		model.addAttribute("gps_x", x);
		model.addAttribute("gps_y", y);
		
		return "/foodlist/foodView";
	}
	
	
}
