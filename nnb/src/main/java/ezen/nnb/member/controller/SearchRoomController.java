package ezen.nnb.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.FavoriteService;
import ezen.nnb.member.service.RoomService;
import ezen.nnb.member.service.SearchRoomService;

@Controller
public class SearchRoomController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="searchRoomService")
	private SearchRoomService searchRoomService;
	@Resource(name="roomService")
	private RoomService roomService;
	@Resource(name="favoriteService")
	private FavoriteService favoriteService;
	
	@RequestMapping(value="/search/openSearchRoomList") 
	public ModelAndView openSearchRoomList(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		ModelAndView mv = new ModelAndView("member/search/roomList"); 
		
		HttpSession session= request.getSession();
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID",MEM_ID);
		
		int count=searchRoomService.countRoomList(commandMap.getMap());
		mv.addObject("count", count);
		List<Map<String,Object>> favRoom=favoriteService.selectFavRoom(commandMap.getMap());
		mv.addObject("favRoom",favRoom);
		List<Map<String,Object>> list=searchRoomService.selectRoomList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv; 
	} 
	
	@RequestMapping(value="/search/roomList")
	@ResponseBody
	public ModelAndView roomList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");
		
		HttpSession session= request.getSession();
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID",MEM_ID);
		
		List<Map<String,Object>> favRoom=favoriteService.selectFavRoom(commandMap.getMap());
		mv.addObject("favRoom",favRoom);
		List<Map<String,Object>> list=searchRoomService.selectRoomList(commandMap.getMap());
		mv.addObject("list", list);
		
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		
		int count=searchRoomService.countRoomList(commandMap.getMap());
		mv.addObject("count", count);

		return mv;
	}
	
	@RequestMapping(value = "/search/roomDetail") // 방 상세 정보를 찾아서 리턴해준다. + 첨부파일
	public ModelAndView detailRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/search/roomDetail");
		
		Map<String,Object> map = roomService.selectRoomDetail(commandMap.getMap());
		mv.addObject("map", map.get("map")); //게시글 상세정보.
		mv.addObject("list", map.get("list")); // 첨부파일의 목록을 가지고 있는 리스트.
		return mv;
	}
}






