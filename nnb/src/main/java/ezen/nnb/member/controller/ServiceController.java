package ezen.nnb.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.member.service.ServiceService;

@Controller(value = "/service")
public class ServiceController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "serviceService")
	private ServiceService serviceService;

	@RequestMapping(value = "/faq")
	public ModelAndView faqList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/service/faq");
		List<Map<String, Object>> list = serviceService.openFAQList(commandMap);
		mv.addObject("list", list);
		return mv;
	}
}

