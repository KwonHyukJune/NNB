package ezen.nnb.admin.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.paging.Paging;
import ezen.nnb.admin.service.AdminRoomService;

import ezen.nnb.common.CommandMap;

@Controller
public class /*컨트롤러*/AdminRoomController {
	Logger log=Logger.getLogger(this.getClass());
	@Resource(name="adminRoomService") 
	private AdminRoomService adminRoomService;
	 
	//목록
	@RequestMapping(value=/*MapperURL*/"/admin/roomList")
	public ModelAndView adminRoomList(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView(/*jsp*/"/admin/room/list");
		List<Map<String,Object>> list=adminRoomService.selectRoomList(commandMap.getMap());
		mv.addObject("list",list);	
		return mv;
	}
	// 겅색 추가
	
	//상세
	@RequestMapping(value=/*MapperURL*/"/admin/roomDetail")
	public ModelAndView /*메소드*/adminRoomDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"searchDetail/room");
	/*	Map<String,Object> map = adminRoomService.		##detailRoom		(commandMap.getMap());
		mv.addObject("map", map); */
		return mv;
	}
	
	//상태 수정
	@RequestMapping(value=/*MapperURL*/"/admin/roomModify")
	public ModelAndView /*메소드*/adminRoomModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/roomDetail");
		adminRoomService./*Mybatis ID*/updateRoomModify(commandMap.getMap());
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	//삭제
	@RequestMapping(value=/*MapperURL*/"/admin/roomDelete")
	public ModelAndView /*메소드*/adminRoomDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/roomList");
		adminRoomService./*Mybatis ID*/deleteRoom(commandMap.getMap());
		return mv;
	}
}

