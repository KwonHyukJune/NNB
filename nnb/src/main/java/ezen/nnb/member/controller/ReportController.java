package ezen.nnb.member.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.ReportService;


@Controller
public class ReportController {
			@Resource(name="ReportService")
			private ReportService reportService;
		
		//폼	
		@RequestMapping(value="/report/form")  
		public ModelAndView openReportForm(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/report/reportForm");
			return mv;
		}//등록
		@RequestMapping(value="/report/submit")
		public ModelAndView submitReport(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/report/report");
			reportService.submitReport(commandMap.getMap());
			return mv;
		}
	
	
}

 