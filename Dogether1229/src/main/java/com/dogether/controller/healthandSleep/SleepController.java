package com.dogether.controller.healthandSleep;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sleep")
public class SleepController {
	
	@RequestMapping("/")
	public String sleep() {
		System.out.println("수면시간계산기 페이지로 이동!!");
		return "sleep/sleep";
	}
	
	//디른 시간 추천받기를 눌렀을 때 sleep.jsp로 이동
	@RequestMapping("back.do")
	public String back() {
		return "sleep";
	}
	
}
