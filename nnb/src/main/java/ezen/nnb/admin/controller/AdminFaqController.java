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

	@RequestMapping(value = "/admin/faq/list")
	public ModelAndView adminFaqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/faq/list");
		List<Map<String, Object>> list = adminFaqService.selectFaqList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value="/admin/faq/writeForm")
	public ModelAndView adminFaqWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faq/writeForm");
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/write")
	public ModelAndView adminFaqWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faq/writeForm");
		
		adminFaqService.writeFaq(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/detail")
	public ModelAndView adminFaqDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faq/detail");
		
		Map<String,Object> map = adminFaqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/faq/modifyForm")
	public ModelAndView adminFaqModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faq/modifyForm");
		
		Map<String,Object> map = adminFaqService.selectFaqDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/sample/updateBoard.do")
	public ModelAndView adminFaqModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faq/Detail");
		
		adminFaqService.updateFaq(commandMap.getMap());
		
		mv.addObject("FAQ_NUM", commandMap.get("FAQ_NUM"));
		return mv;
	}
	
	@RequestMapping(value="/sample/deleteBoard.do")
	public ModelAndView adminFaqDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faq/list");
		
		adminFaqService.deleteFaq(commandMap.getMap());
		
		return mv;
	}
}

