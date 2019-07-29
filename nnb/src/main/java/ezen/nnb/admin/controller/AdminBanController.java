package ezen.nnb.admin.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminBanService;
import ezen.nnb.common.CommandMap;

@Controller
public class AdminBanController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminBanService")
	private AdminBanService adminBanService;
	
	@RequestMapping(value = "admin/ban")
	public ModelAndView insertBan(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/report/memberList");
		
		adminBanService.insertBan(commandMap.getMap());
		
		return mv;
		
		
	}
	
}
