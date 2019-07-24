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
	
	@RequestMapping(value = "/admin/faq/detail")
	public ModelAndView adminFaqDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/faq/detail");
		
		return mv;
	}
}
