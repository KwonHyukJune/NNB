package ezen.nnb.member.controller;

import javax.annotation.Resource;


import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.ReportService;


@Controller
public class ReportController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportService")
	private ReportService reportService;
	
	@RequestMapping(value = "/reportForm") //방내놓기 폼으로 이동 시켜준다
	public ModelAndView reportForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/reportForm");
		return mv;
	}
	
	@RequestMapping(value = "/report") //방내놓기 폼으로 이동 시켜준다
	public ModelAndView report(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		reportService.report(commandMap.getMap());
		return mv;
	}
}

 