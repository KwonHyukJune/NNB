package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminTermsService;
import ezen.nnb.common.CommandMap;

@Controller
public class AdminTermsController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminTermsService")
	private AdminTermsService adminTermsService;

	@RequestMapping(value = "/admin/terms/list")
	public ModelAndView adminTermsList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/terms/termsList");
		System.out.println("termsList"+commandMap.getMap());

		List<Map<String, Object>> list = adminTermsService.selectTermsList(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("size", list.size());
		return mv;
	}

	@RequestMapping(value="/admin/terms/termsWrite")
	public ModelAndView adminTermsWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/terms/termsWrite");
		return mv;
	}
	
	@RequestMapping(value="/admin/terms/write")
	public ModelAndView adminTermsWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/terms/list");
		
		adminTermsService.writeTerms(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/terms/detail")
	public ModelAndView adminTermsDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/terms/termsDetail");
		System.out.println("dd"+commandMap.getMap());

		Map<String,Object> map = adminTermsService.selectTermsDetail(commandMap.getMap());
		String str = map.get("TERMS_CONTENT").toString().replace("\n", "<br>");
		map.replace("TERMS_CONTENT", str);
		mv.addObject("terms", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/terms/termsModifyForm")
	public ModelAndView adminTermsModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/terms/termsModify");
		System.out.println(commandMap.getMap());

		Map<String,Object> map = adminTermsService.selectTermsDetail(commandMap.getMap());
		mv.addObject("terms", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/terms/termsModify")
	public ModelAndView adminTermsModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/terms/list");
		System.out.println("dd"+commandMap.getMap());

		adminTermsService.updateTermsModify(commandMap.getMap());
		
		mv.addObject("num", commandMap.get("num"));
		return mv;
	}
	
	@RequestMapping(value="/admin/terms/delete")
	public ModelAndView adminTermsDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/terms/list");
		System.out.println("aaaa"+commandMap.getMap());
		adminTermsService.deleteTerms(commandMap.getMap());
		
		return mv;
	}
}