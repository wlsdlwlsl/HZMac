package com.dogether.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dogether.domain.AdminVO;
import com.dogether.domain.MemberVO;
import com.dogether.service.AdminLoginService;

@Controller
@RequestMapping("admin")
public class adminLoginController {

	@Autowired
	public AdminLoginService adminLoginService;
	
	@PostMapping(value = "adminlogin.do", produces = "application/text; charset=UTF-8")
	public String adminlogin(AdminVO vo, HttpSession session ,Model m) {
		System.out.println(vo.getAdminID());
		AdminVO result = adminLoginService.adminIdCheck_Login(vo);
		String message = "님 로그인되었습니다.";
		// 로그인이 됬으면
		if (result != null) {
			session.setAttribute("adminID", result.getAdminID());
			m.addAttribute("message",message);
			return "admin/adminpage";
		} else {
			message = "존재하지 않는 아이디입니다.";
			m.addAttribute("message",message);
			return "adminLogin";
		}
	}
}
