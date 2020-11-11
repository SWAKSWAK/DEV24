package com.dev24.client.freeboard.freecmt.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public ResponseEntity<List<FreeCmtVO>> freeCmtList(@PathVariable("fb_num") Integer fb_num){
		log.info("freeCmtList 호출 성공");
		
		ResponseEntity<List<FreeCmtVO>> entity = null;
		entity = new ResponseEntity<>(freecmtService.freeCmtList(fb_num), HttpStatus.OK);
		return entity;
	}
}
