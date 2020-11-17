package com.dev24.client.necmt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dev24.client.necmt.service.NecmtService;
import com.dev24.client.necmt.vo.NecmtVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/necmt/*")
@AllArgsConstructor
public class NecmtController {

	@Setter(onMethod_=@Autowired)
	private NecmtService necmtService;
	
	@RequestMapping(value = "/all/{ne_num}", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	public ResponseEntity<List<NecmtVO>> necmtList (@PathVariable int ne_num, Model model){
		log.info("necmtList 호출 완료");
		
		List<NecmtVO> necmtList = necmtService.necmtList(ne_num);
		
		ResponseEntity<List<NecmtVO>> entity = new ResponseEntity<List<NecmtVO>>(necmtList, HttpStatus.OK);
		
		return entity;
	}
}
