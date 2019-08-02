package ezen.nnb.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.BankService;

@Controller
public class BankController {
	@Resource(name="bankService")
	private BankService bankService;
	
	@RequestMapping(value="/bank/list")
	public ModelAndView bankList(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("member/bank/bankList");
		List<Map<String,Object>>bankList=bankService.bankList(commandMap.getMap());
		mv.addObject("bankList",bankList);
		
		return mv;
	}
	
	@RequestMapping(value="/bank/view")
	public ModelAndView bankview(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("member/bank/bankview");
		Map<String,Object>bank=bankService.bankView(commandMap.getMap());
		mv.addObject("bank",bank);
		
		return mv;
	}
}
