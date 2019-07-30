package ezen.nnb.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.LoginService;
import ezen.nnb.member.service.RoomService;

@Controller
public class RoomController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "roomService")
	private RoomService roomService;
	
	@RequestMapping(value = "/registForm")
	public ModelAndView registForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/room/registForm");
		return mv;
	}
	
	@RequestMapping(value = "/regist") // 
	public ModelAndView regist(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		roomService.insertRoomInfo(commandMap.getMap());
		return mv;
	}
}
