package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminBankService;



@Controller
public class AdminBankController {
	Logger log=Logger.getLogger(this.getClass());//consol창에 뜨게하려고 씀
	@Resource(name="adminBankService")
	private AdminBankService adminBankService;
	
	@RequestMapping(value="/admin/bankList")
	public ModelAndView BankList(Map<String,Object> commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("/admin/bankList");
		
		List<Map<String,Object>> list=adminBankService.selectBankList(commandMap);
		mv.addObject("list",list);
		
		return mv;
	}
	
}
