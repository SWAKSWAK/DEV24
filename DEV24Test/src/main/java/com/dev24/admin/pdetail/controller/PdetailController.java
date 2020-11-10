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

	/** ���� �� ������ ���*/
	@GetMapping(value="/admin/pdetailList")
	public String pdetailList(@ModelAttribute("data") AdminPdetailViewVO pdvo, Model model) {
		log.info("pdetailList ȣ�� ����");
		
		try {
			List<AdminPdetailViewVO> plist = pdetailService.pdetailList(pdvo);
			int result = 0;
			//result = plist.get(0).getP_num(); // ���� �󼼴� ������ ���Ű� �Ͼ�� �߻��ϴ� ������ list���� null�� �� �� ����
			result = pdvo.getP_num();
			model.addAttribute("p_num", result);
			model.addAttribute("plist", plist);

		}catch(Exception e) {
			log.info("�ش� ���Ű��� ���� ���� ���� ��ȸ ����.");
			e.printStackTrace();
		}
		
		return "/admin/pdetailList";
	}
	
	
	
}
