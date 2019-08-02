package ezen.nnb.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.FavoriteService;
import ezen.nnb.member.service.SearchRoomService;

@Controller
public class SearchRoomController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="searchRoomService")
	private SearchRoomService searchRoomService;
	@Resource(name="favoriteService")
	private FavoriteService favoriteService;
	
	@RequestMapping(value="/search/roomList")
	public ModelAndView roomList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("member/search/roomList");
			
		List<Map<String,Object>> list=searchRoomService.selectRoomList(commandMap.getMap());
		mv.addObject("list", list);
		
		int count=searchRoomService.countRoomList(commandMap.getMap());
		mv.addObject("count", count);
		
		return mv;
	}	
}