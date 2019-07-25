package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminBankService;
import ezen.nnb.common.CommandMap;



@Controller
public class AdminBankController {
	Logger log=Logger.getLogger(this.getClass());//consol창에 뜨게하려고 씀
	@Resource(name="adminBankService") 
	//service 영역의 접근을 위한 선언
	//@resource annotation을 통해서 필요한 bean을 수동으로 등록하는 것
	private AdminBankService adminBankService;
	
	@RequestMapping(value="/admin/bankList")
	public ModelAndView adminBankList(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("/admin/bank/list");
		
		List<Map<String,Object>> list=adminBankService.selectBankList(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
	@RequestMapping(value="/admin/bankWriteForm")
	public ModelAndView adminBankWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/bank/writeForm");
		return mv;
	}
	@RequestMapping(value="/admin/bankWrite")
	public ModelAndView adminBankWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/bankList");
		adminBankService.insertBankWrite(commandMap.getMap());
		
		return mv;
	}
	@RequestMapping(value="/admin/bankDetail")
	public ModelAndView adminBankDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/bank/detail");
		Map<String,Object> map = adminBankService.selectBankDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	@RequestMapping(value="/admin/bankModifyForm")
	public ModelAndView adminBankModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/bank/modifyForm");
		Map<String,Object> map = adminBankService.selectBankDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	@RequestMapping(value="/admin/bankModify")
	public ModelAndView adminBankModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/bankDetail");
		adminBankService.updateBankModify(commandMap.getMap());
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/admin/bankDelete")
	public ModelAndView adminBankDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/bankList");
		
		adminBankService.deleteBank(commandMap.getMap());
		
		return mv;
	}
}

	
