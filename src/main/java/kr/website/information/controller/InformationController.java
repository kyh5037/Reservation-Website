package kr.website.information.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.website.foodlist.service.foodListService;
import kr.website.information.service.InformationService;
import kr.website.information.vo.InformationVO;
import kr.website.reserve.vo.ReserveVO;
import kr.website.review.vo.ReviewVO;
import kr.website.utils.UploadFileUtils;

@Controller
@RequestMapping(value = "/information/*")

public class InformationController {
	private static final Logger Logger =  LoggerFactory.getLogger(InformationController.class);
	
	@Inject
	InformationService service;
	@Inject
	foodListService foodService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/enroll")
	public String enroll() throws Exception {
		
		return "/information/enroll";
	}
	
	@RequestMapping(value = "/edit")
	public String edit(Model model, HttpSession session) throws Exception {
		
		int acc_no = (int) session.getAttribute("acc_no");
		
		InformationVO sto_vo = service.selectStore(acc_no);
		
		List<InformationVO> menu = service.selectMenu(sto_vo.getSto_no());
		
		model.addAttribute("store", sto_vo);
		model.addAttribute("menu", menu);
		
		return "/information/edit";
	}
	
	@RequestMapping(value = "/stoUpdate", method=RequestMethod.POST)
	public String stoUpdate(InformationVO vo, MultipartFile file, HttpSession session) throws Exception {
		InformationVO vo1 = new InformationVO();
		
		vo.setSto_no((int)session.getAttribute("sto_no"));
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		
		vo.setSto_photo(File.separator + "imgUpload" + File.separator + fileName);
		vo.setSto_thumbPhoto(File.separator + "imgUpload" + File.separator + "s" + File.separator + "s_" + fileName);
		}
		service.stoUpdate(vo);
		
		int sto_no = service.stoNo(vo.getSto_no_acc());
		try {	// 메뉴 없을경우 exception
			String[] menu_name = vo.getMenu_name().split(",");
			String[] menu_price = vo.getMenu_price().split(",");
			String[] menu_check = vo.getMenu_check().split(",");
			
			for(int i = 0; i < menu_name.length; i++) {
				vo1.setMenu_name(menu_name[i]);
				vo1.setMenu_price(menu_price[i]);
				vo1.setMenu_check(menu_check[i]);
				vo1.setMenu_no_sto(sto_no);
				service.menuInfo(vo1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		service.averagePrice(sto_no);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/stoInfo", method=RequestMethod.POST)
	public String stoInfo(InformationVO vo, MultipartFile file) throws Exception {
		InformationVO vo1 = new InformationVO();
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes()); 
		
		vo.setSto_photo(File.separator + "imgUpload" + File.separator + fileName);
		vo.setSto_thumbPhoto(File.separator + "imgUpload" + File.separator + "s" + File.separator + "s_" + fileName);
		}
		service.stoInfo(vo);
		int sto_no = service.stoNo(vo.getSto_no_acc());
		service.tbInsert(sto_no);
		try {	// 메뉴 없을경우 exception
			String[] menu_name = vo.getMenu_name().split(",");
			String[] menu_price = vo.getMenu_price().split(",");
			String[] menu_check = vo.getMenu_check().split(",");
			
			for(int i = 0; i < menu_name.length; i++) {
				vo1.setMenu_name(menu_name[i]);
				vo1.setMenu_price(menu_price[i]);
				vo1.setMenu_check(menu_check[i]);
				vo1.setMenu_no_sto(sto_no);
				service.menuInfo(vo1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		service.averagePrice(sto_no);
		
		return "redirect:/";
	}
//	@RequestMapping(value = "/sto")
//	public String stoInfo(InformationVO vo, MultipartFile file, HttpSession session) throws Exception {
//		System.out.println("hihihihi");
//		System.out.println(session.getServletContext().getRealPath("/"));
//		return "redirect:/";
//	}
	
	@RequestMapping(value = "/resInfo")
	public String resInfo(HttpSession session, Model model) throws Exception {
		
		int no = (int) session.getAttribute("acc_no");
		
		List<ReserveVO> list = null;
		
		list = service.resInfo(no);
		
		model.addAttribute("list",list);
		
		return "/information/resInfo";
	}
	
	@RequestMapping(value = "/resCancel")
	public String resCancel(HttpSession session, @RequestParam("res_no") int res_no) throws Exception{
		
		int no = (int) session.getAttribute("acc_no");
		
		ReserveVO vo = new ReserveVO();
		vo.setRes_no_acc(no);
		vo.setRes_no(res_no);
		
		service.resCancel(vo);
		
		return "redirect:/information/resInfo";
	}
	
	@RequestMapping(value = "/resManage")
	public String resManage(HttpSession session, Model model) throws Exception {
		
		int acc_no = (int) session.getAttribute("acc_no");
		//Integer sto_no = (int) session.getAttribute("sto_no");
		List<ReserveVO> vo = null;
		ReserveVO vo1 = null;
		Integer sto_no = service.stoNo(acc_no);
		session.setAttribute("sto_no", sto_no);
		if(sto_no != 0) {
//			session.setAttribute("sto_no", sto_no);
			vo = service.resManage(session, sto_no);
			vo1 = foodService.resCheck(sto_no);
			model.addAttribute("list",vo);
			model.addAttribute("tb",vo1);
		} else {
			model.addAttribute("check", "777");
		}

		return "/information/resManage";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/resCheck", method=RequestMethod.POST)
	@ResponseBody
	public String resCheck(HttpSession session, ReserveVO vo) throws Exception {
		JSONArray array = new JSONArray();

		int sto_no = (int) session.getAttribute("sto_no");
		vo.setRes_no_sto(sto_no);
		ReserveVO reservevo = foodService.resCheck(sto_no);
		
		if(reservevo.getTb_maxTable()==reservevo.getTb_curTable()&&vo.getRes_check()==1){
			array.add("예약을 초과하였습니다.");
		} else {
			service.resCheck(vo);
			if(vo.getRes_check()==1)
				service.tbUpdate(vo);
			array.add("처리가 완료 되었습니다.");
			array.add("/information/resManage");
		}
		return array.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/changeMax", method=RequestMethod.POST)
	@ResponseBody
	public String changeMax(ReserveVO vo, HttpSession session) throws Exception{
		JSONArray array = new JSONArray();
		int sto_no = (int)session.getAttribute("sto_no");
		int acc_no = (int)session.getAttribute("acc_no");
		int acc_level = (int)session.getAttribute("acc_level");
		vo.setRes_no_sto(sto_no);
		vo.setRes_no_acc(acc_no);
		try {
			if(acc_level==1) {
				service.maxUpdate(vo);
				array.add("완료");
			}else
				array.add("실패");
		}catch(Exception e) {}
		
		array.add("/information/resManage");
		
		return array.toJSONString();
	}

	@RequestMapping(value = "/myReview")
	public String myReview(HttpSession session, Model model) throws Exception {
		
		int acc_no = (int) session.getAttribute("acc_no");
		
		
		List<ReviewVO> vo = service.myReview(acc_no);
		
		model.addAttribute("review", vo);
		
		return "/information/myReview";
	}
}
