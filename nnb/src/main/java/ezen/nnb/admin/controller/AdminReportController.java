package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminReportService;
import ezen.nnb.common.CommandMap;

@Controller
public class AdminReportController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminReportService")
	private AdminReportService adminReportService;

	@RequestMapping(value = "/admin/reportList")
	public ModelAndView adminReportList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/report/list");

		List<Map<String, Object>> list = adminReportService.selectReportList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	@RequestMapping(value = "/admin/reportDetail")
	public ModelAndView adminReportDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/report/detail");
		Map<String, Object> map = adminReportService.selectReportDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}
}