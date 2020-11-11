package com.dev24.client.freeboard.freecmt.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev24.client.freeboard.freecmt.service.FreeCmtService;
import com.dev24.client.freeboard.freecmt.vo.FreeCmtVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/freecmt")
@AllArgsConstructor

public class FreeCmtController {
	
	private FreeCmtService freecmtService;
	
	@GetMapping(value="/all/{fb_num}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FreeCmtVO>> freeCmtList(@PathVariable("fb_num") Integer fb_num, Model model){
		log.info("freeCmtList 호출 성공");
		
		ResponseEntity<List<FreeCmtVO>> entity = null;
		entity = new ResponseEntity<>(freecmtService.freeCmtList(fb_num), HttpStatus.OK);
		return entity;
	}
	
	@PostMapping(value="/freecmtInsert", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> freeCmtInsert(@RequestBody FreeCmtVO fcmtvo){
		log.info("freecmtInsert 호출 성공!");
		log.info("FreeCmtVO"+fcmtvo);
		int result =0;
		
		result = freecmtService.freeCmtInsert(fcmtvo);
		return result==1? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
						new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	
	}
}
