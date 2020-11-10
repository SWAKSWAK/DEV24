package com.dev24.client.freeboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev24.client.freeboard.service.FreeBoardService;
import com.dev24.client.freeboard.vo.FreeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("freeboard/*")
@AllArgsConstructor
//@SessionAttributes({"c_id", "c_num"})
public class FreeBoardController {
	private FreeBoardService freeboardService;
	
	@RequestMapping(value="/freeboardList", method=RequestMethod.GET)
	public String freeboardList(@ModelAttribute("data") FreeBoardVO fbvo, Model model) {
		log.info("freeboardList 호출 성공");
		
		List<FreeBoardVO> freeboardList = freeboardService.freeboardList(fbvo);
		model.addAttribute("freeboardList", freeboardList);
		
		return "freeboard/freeboardList";
	}
}
