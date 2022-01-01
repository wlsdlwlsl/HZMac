package com.dogether.controller.notification;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("notification")
public class NotificationController {
	
	@RequestMapping("{step}.do")
	public String stepDo(@PathVariable String step) {
		return "notification/"+ step;
	}
	
}
