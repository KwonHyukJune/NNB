package ezen.nnb.member.controller;

import java.util.Map;

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

	@RequestMapping(value = "/room/writeForm")
	public ModelAndView writeFormRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/room/writeForm");
		return mv;
	}

	@RequestMapping(value = "/room/write") //
	public ModelAndView writeRoom(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		roomService.insertRoom(commandMap.getMap(), request);
		return mv;
	}

	@RequestMapping(value = "/room/detail") //
	public ModelAndView detailRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("search/detailRoom");
		
		Map<String,Object> map = roomService.selectRoomDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map")); //게시글 상세정보.
		mv.addObject("list", map.get("list")); // 첨부파일의 목록을 가지고 있는 리스트.
		return mv;
	}
	
	@RequestMapping(value = "/room/write") //
	public ModelAndView deleteRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		roomService.deleteRoom(commandMap.getMap());
		return mv;
	}
}
