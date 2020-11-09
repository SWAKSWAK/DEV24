package com.dev24.admin.pdetail.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev24.admin.pdetail.service.PdetailService;
import com.dev24.admin.pdetail.vo.AdminPdetailViewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller("admin.pdetailController")
@AllArgsConstructor
@RequestMapping("/admin/*")
@Log4j
public class PdetailController {
	private PdetailService pdetailService;

	/** 구매 상세 페이지 출력*/
	@GetMapping(value="/admin/pdetailList")
	public String pdetailList(@ModelAttribute("data") AdminPdetailViewVO pdvo, Model model) {
		log.info("pdetailList 호출 성공");
		
		try {
			List<AdminPdetailViewVO> plist = pdetailService.pdetailList(pdvo);
			int result = 0;
			result = plist.get(0).getP_num(); // 구매 상세는 무조건 구매가 일어나야 발생하는 정보로 list값이 null이 될 수 없음
			model.addAttribute("p_num", result);
			model.addAttribute("plist", plist);

		}catch(Exception e) {
			log.info("해당 구매건의 구매 상제 정보 조회 오류.");
			e.printStackTrace();
		}
		
		return "/admin/pdetailList";
	}
	
	
	/** 구매번호 출력 */
	@ResponseBody
	//@RequestMapping(value="/admin/pdetail/{p_num}", produces= {MediaType.TEXT_PLAIN_VALUE})
	@RequestMapping(value="/purchaseNumber", produces= {MediaType.TEXT_PLAIN_VALUE})
	public String getPurchaseNumber(@RequestParam("p_num") int p_num) {
		log.info("getPurchaseNumber 호출 성공");
		int result = 0;
		result = pdetailService.getPurchaseNumber(p_num);
		
		// 컨트롤러의 반환값은 뷰 정보로 간주하기 때문에 일반 문자임을 아래와 같이 표기해야함!
		return String.valueOf(result);
	}
	
}
