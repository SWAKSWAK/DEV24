package com.dev24.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes({"c_id", "c_num"})
public class MainController {
	final static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index(Model model) {

		//임시 로그인용.  프로젝트 완료 시 삭제
		model.addAttribute("c_id", "swak");
		model.addAttribute("c_num", "2");
		return "index";
	}
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminIndex() {
		return "/admin/adminIndex";
	}
	
	
}
