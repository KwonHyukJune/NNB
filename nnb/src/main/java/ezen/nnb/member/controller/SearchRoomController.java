package ezen.nnb.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		return mv; 
	} 
	
	@RequestMapping(value="/search/roomList")
	@ResponseBody
	public ModelAndView roomList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");
		
		HttpSession session= request.getSession();
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID",MEM_ID);
		
		System.out.println(";;:"+commandMap.get("MONTHLY_DEPOSIT_MIN"));
		if(commandMap.containsKey("ROOM_TYPE") && commandMap.get("ROOM_TYPE")!="") {
			List<String> ROOM_TYPE = new ArrayList<String>();
			String[] array = ((String) commandMap.get("ROOM_TYPE")).split(",");
			for(int i=0; i<array.length; i++) {
				ROOM_TYPE.add(array[i]);
			}
			commandMap.put("ROOM_TYPE", ROOM_TYPE);
		}
		
		if(commandMap.containsKey("TRADE_TYPE") && commandMap.get("TRADE_TYPE")!="") {
			List<String> TRADE_TYPE = new ArrayList<String>();
			String[] array = ((String) commandMap.get("TRADE_TYPE")).split(",");
			for(int i=0; i<array.length; i++) {
				TRADE_TYPE.add(array[i]);
			}
			commandMap.put("TRADE_TYPE", TRADE_TYPE);
		}
		if(commandMap.containsKey("ROOM_FLOOR") && commandMap.get("ROOM_FLOOR")!="") {
			List<String> ROOM_FLOOR = new ArrayList<String>();
			String[] array = ((String) commandMap.get("ROOM_FLOOR")).split(",");
			for(int i=0; i<array.length; i++) {
				if(array[i].equals("7")) {
					commandMap.put("ROOM_FLOOR7", array[i]);
				}
				ROOM_FLOOR.add(array[i]);
			}
			commandMap.put("ROOM_FLOOR", ROOM_FLOOR);
		}
		if(commandMap.containsKey("STRUCTURES") && commandMap.get("STRUCTURES")!="") {
			List<String> STRUCTURES = new ArrayList<String>();
			String[] array = ((String) commandMap.get("STRUCTURES")).split(",");
			for(int i=0; i<array.length; i++) {
				STRUCTURES.add(array[i]);
			}
			commandMap.put("STRUCTURES", STRUCTURES);
		}
		/*
		 * if(commandMap.containsKey("OPTIONS")) { List<String> ROOM_TYPE = new
		 * ArrayList<String>(); String[] array = ((String)
		 * commandMap.get("OPTIONS")).split(","); for(int i=0; i<array.length; i++) {
		 * ROOM_TYPE.add(array[i]); } commandMap.put("TRADE_TYPE", ROOM_TYPE); }
		 */
		
		Map<String,Object> favRoom=favoriteService.selectFavRoom(commandMap.getMap());
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
	
	@RequestMapping(value = "/search/detailRoom") // 방 상세 정보를 찾아서 리턴해준다. + 첨부파일
	public ModelAndView detailRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/search/detailRoom");
		
		Map<String,Object> map = roomService.selectRoomDetail(commandMap.getMap());
		mv.addObject("map", map.get("map")); //게시글 상세정보.
		mv.addObject("list", map.get("list")); // 첨부파일의 목록을 가지고 있는 리스트.

		Map<String,Object> favRoom=favoriteService.selectFavRoom(commandMap.getMap());
		if(favRoom.containsKey(commandMap.get("ROOM_NUM"))){
			System.out.println("1");
			mv.addObject("favRoom",1);
		}else {
			mv.addObject("favRoom",0);
			System.out.println("0");
		}
		return mv;
	}
	
	@RequestMapping(value = "/search/addFavRoom", method = RequestMethod.POST)
	public ModelAndView addFavRoom(CommandMap commandMap) throws Exception{
		String url = (String) commandMap.get("url");
		ModelAndView mv = new ModelAndView(url);
		
		if(commandMap.get("check").equals("0")) {
			favoriteService.addFavRoom(commandMap.getMap());
		}
		else if(commandMap.get("check").equals("1")){
			favoriteService.deleteFavRoom(commandMap.getMap());
			favoriteService.updateFavCountDec(commandMap.getMap());
		}
		
		return mv;
	}
}






