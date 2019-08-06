package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminFaqService;
import ezen.nnb.common.CommandMap;


@Controller
public class AdminFaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminFaqService")
	private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/admin/openFaqList") 
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView("/admin/faq/faqList"); 
		return mv; 
	} 
	
	@RequestMapping(value = "/admin/faq/list")
	public ModelAndView adminFaqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = adminFaqService.selectFaqList(commandMap.getMap());
		
		mv.addObject("list", list);
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;
	}

	@RequestMapping(value="/admin/faq/writeForm")
	public ModelAndView adminFaqWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faq/faqWrite");
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/write")
	public ModelAndView adminFaqWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faq/faqList");
		
		adminFaqService.writeFaq(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/detail")
	public ModelAndView adminFaqDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faq/faqDetail");
		
		Map<String,Object> map = adminFaqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/modifyForm")
	public ModelAndView adminFaqModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faq/faqModify");
		
		Map<String,Object> map = adminFaqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/modify")
	public ModelAndView adminFaqModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faq/detail");
		
		adminFaqService.updateFaq(commandMap.getMap());
		
		mv.addObject("num", commandMap.get("num"));
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/delete")
	public ModelAndView adminFaqDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faq/list");
		System.out.println("FAQ_DELETE"+commandMap.getMap());

		adminFaqService.deleteFaq(commandMap.getMap());
		
		return mv;
	}
}









