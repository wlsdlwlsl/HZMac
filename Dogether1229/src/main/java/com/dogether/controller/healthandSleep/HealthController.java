package com.dogether.controller.healthandSleep;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dogether.domain.BoardVO;
import com.dogether.domain.Board_LikeVO;
import com.dogether.domain.Board_ReplyVO;
import com.dogether.domain.HealthCareCenterVO;
import com.dogether.service.BoardServiceImpl;
import com.dogether.service.HealthServiceImpl;

@Controller
@RequestMapping("healthcenter")
public class HealthController {
	
	@RequestMapping("/")
	public String getHealthList() {
		return "healthcenter/healthcenter";
	}
	
}
