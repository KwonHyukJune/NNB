package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminTermsService;
import ezen.nnb.common.CommandMap;

public class AdminTermsController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminTermsService")
	private AdminTermsService adminTermsService;

	@RequestMapping(value = "/admin/Terms/list")
	public ModelAndView adminTermsList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/Terms/list");
		List<Map<String, Object>> list = adminTermsService.selectTermsList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value="/admin/Terms/writeForm")
	public ModelAndView adminTermsWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/Terms/writeForm");
		return mv;
	}
	
	@RequestMapping(value="/admin/Terms/write")
	public ModelAndView adminTermsWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/Terms/writeForm");
		
		adminTermsService.writeTerms(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/Terms/detail")
	public ModelAndView adminTermsDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/Terms/detail");
		
		Map<String,Object> map = adminTermsService.selectTermsDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/Terms/modifyForm")
	public ModelAndView adminTermsModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/Terms/modifyForm");
		
		Map<String,Object> map = adminTermsService.selectTermsDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/Terms/modify")
	public ModelAndView adminTermsModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/Terms/Detail");
		
		adminTermsService.updateTermsModify(commandMap.getMap());
		
		mv.addObject("Terms_NUM", commandMap.get("Terms_NUM"));
		return mv;
	}
	
	@RequestMapping(value="/admin/Terms/delete")
	public ModelAndView adminTermsDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/Terms/list");
		
		adminTermsService.deleteTerms(commandMap.getMap());
		
		return mv;
	}
}