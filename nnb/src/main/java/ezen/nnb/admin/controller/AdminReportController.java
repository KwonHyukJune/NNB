package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminReportService;
import ezen.nnb.admin.service.AdminRoomService;
import ezen.nnb.common.CommandMap;

@Controller
public class AdminReportController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminReportService")
	private AdminReportService adminReportService;
	
	@Resource(name="adminRoomService") 
	private AdminRoomService adminRoomService;

	@RequestMapping(value = "/admin/report/roomList")
	public ModelAndView adminReportRoomList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/report/roomList");

		List<Map<String, Object>> list = adminReportService.selectReportRoomList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	@RequestMapping(value = "/admin/report/memberList")
	public ModelAndView adminReportMemberList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/report/memberList");

		List<Map<String, Object>> list = adminReportService.selectReportMemberList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	@RequestMapping(value="/admin/report/detail")
	public ModelAndView adminFaqDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/faq/detail");
		
		Map<String,Object> map = adminReportService.selectReportDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	/*
	 * @RequestMapping(value="/admin/Report/roomDelete") public ModelAndView
	 * adminReportDelete(CommandMap commandMap) throws Exception{ ModelAndView mv =
	 * new ModelAndView("redirect:/admin/report/roomList");
	 * 
	 * adminMessageService.adminMessageWrite(commandMap.getMap());
	 * adminRoomService.deleteRoom(commandMap.getMap());
	 * 12323543
	 * return mv; }
	 */
}
