package com.dev24.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonVO {
	// 검색 기능을 위한 VO
	private String search = "";
	private String keyword = "";
	
	private String date_start = ""; // 기본값 sysdate
	private String date_end = ""; // 기본값sysdate
	
	private String refundCheck = ""; // 환불여부 기준
}
