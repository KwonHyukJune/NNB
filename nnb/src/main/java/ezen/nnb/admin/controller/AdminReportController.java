package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminMemberService;
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

	@Resource(name="adminMemberService") 
	private AdminMemberService adminMemberService;

	
	@RequestMapping(value = "/admin/reportRoomList")
	public ModelAndView adminReportRoomList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/reportRoomList");

		List<Map<String, Object>> list = adminReportService.selectReportRoomList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	@RequestMapping(value = "/admin/reportMemberList")
	public ModelAndView adminReportMateList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("reportMemberList");

		List<Map<String, Object>> list = adminReportService.selectReportMateList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value="/admin/reportRoomDetail")
	public ModelAndView adminRoomReportDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/reportRoomDetail");
		
		Map<String,Object> map = adminReportService.selectReportRoomDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/reportMemberDetail")
	public ModelAndView adminMateReportDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("reportMemberDetail");
		
		Map<String,Object> map = adminReportService.selectReportMateDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	/*
	@RequestMapping(value="/admin/report/roomDetail")
	public ModelAndView adminRoomReportDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/report/roomDetail");
		
		Map<String,Object> map = adminReportService.selectReportRoomDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/report/mateDetail")
	public ModelAndView adminMateReportDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/report/mateDetail");
		
		Map<String,Object> map = adminReportService.selectReportMateDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	
	
	
   x * @RequestMapping(value="/admin/Report/roomDelete") public ModelAndView
	 * adminReportDelete(CommandMap commandMap) throws Exception{ ModelAndView mv =
	 * new ModelAndView("redirect:/admin/report/roomList");
	 * 
	 * adminMessageService.adminMessageWrite(commandMap.getMap());
	 * adminRoomService.deleteRoom(commandMap.getMap());
	 * 12323543
	 * return mv; }
	 */
}
