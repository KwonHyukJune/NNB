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
	
	@RequestMapping(value="/bank/openBankList")
	public ModelAndView openBankList(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("member/bank/bankList");
		return mv;
	}
	
	@RequestMapping(value="/bank/bankList")
	public ModelAndView bankList(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");
		List<Map<String,Object>>list=bankService.bankList(commandMap.getMap());
		System.out.println(list.get(0).get("BANK_REGDATE"));
		mv.addObject("list",list);
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;
	}
	
	@RequestMapping(value="/bank/bankDetail")
	public ModelAndView bankDetail(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("member/bank/bankDetail");
		Map<String,Object>bank=bankService.bankView(commandMap.getMap());
		mv.addObject("bank",bank);
		
		return mv;
	}
}
