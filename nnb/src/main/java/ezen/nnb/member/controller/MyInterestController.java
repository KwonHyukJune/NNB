package ezen.nnb.member.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.common.CookieBox;
import ezen.nnb.member.service.FavoriteService;
import ezen.nnb.member.service.RoommateService;
import ezen.nnb.member.service.SearchRoomService;

@Controller
public class MyInterestController {
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name="searchRoomService")
	private SearchRoomService searchRoomService;
	@Resource(name="favoriteService")
	private FavoriteService favoriteService;
	@Resource(name="roommateService")
	private RoommateService roommateService;
	
	@RequestMapping("/myInterest/recentRoom") 
	public ModelAndView recentRoomList(CommandMap commandMap,HttpServletRequest request)throws Exception{ 
		ModelAndView mv=new ModelAndView("member/myInterest/recentRoomList");
		
		return mv; 
	}
	
	@RequestMapping("/myInterest/recentRoomList")
	@ResponseBody
	public ModelAndView selectRecentRoomList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		CookieBox cookieBox = new CookieBox(request);
		List<String> ROOM_NUM = new ArrayList<String>();
		if(cookieBox.exists("recentRoom")) {
			String recentRoom = cookieBox.getValue("recentRoom");
			String[] array = recentRoom.split(",");
			for(int i=0; i<array.length; i++) {
				ROOM_NUM.add(array[i]);
			}
			commandMap.put("ROOM_NUM", ROOM_NUM);
			List<Map<String,Object>> list = favoriteService.selectRecentRoomList(commandMap.getMap());
			mv.addObject("list",list);
			mv.addObject("total",list.size());
		}else {
			mv.addObject("total",0);
		}
		Map<String,Object> favRoom=favoriteService.selectFavRoom(commandMap.getMap());
		mv.addObject("favRoom",favRoom);
		
		return mv;
	}
	
	@RequestMapping(value="/myInterest/favRoomList")
	public ModelAndView favRoomList(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("member/myInterest/favRoomList");
		return mv;
	}
	
	@RequestMapping(value="/myInterest/openFavRoomList")
	public ModelAndView openFavRoomList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		List<Map<String,Object>> list=favoriteService.selectFavRoomList(commandMap.getMap());
		int count = favoriteService.countFavRoomList(commandMap.getMap());
		mv.addObject("list",list);
		mv.addObject("total",count);
		return mv;
	}

	@RequestMapping("/myInterest/favRoommateList")
	public ModelAndView favRoommateList(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("member/myInterest/myRoommateList");
		return mv;
	}
	@RequestMapping("/myInterest/openFavRoommateList")
	@ResponseBody
	public ModelAndView openFavRoommateList(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));
		List<Map<String,Object>> list=favoriteService.selectFavMateList(commandMap.getMap());
		int count = favoriteService.countFavMateList(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("total",count);
		
		return mv;
	}
	@RequestMapping("/myInterest/favRoommateCancel")
	public ModelAndView favRoommateCancel(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("redirect:member/myInterest/myRoommateList");
		favoriteService.deleteFavRoommate(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping("/myInterest/changeFavRoom")
	public ModelAndView addFavRoom(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("common/back");
		String FavRoom = (String)commandMap.get("FavRoom"); 
		//방이 찜이 되있는지 안되있는지를 확인하는 거...
		//1 이면 찜이 아직 안된 상태 ---> 지금 컨트롤러가 작동하면서~ 찜!
		//2 이면 찜이 이미 된 상태 ----> 지금 컨트롤러가 작동하면서 찜 취소
		if(FavRoom.equals("1")) {
			favoriteService.addFavRoom(commandMap.getMap());
		}
		else {
			favoriteService.deleteFavRoom(commandMap.getMap());
			favoriteService.updateFavCountDec(commandMap.getMap());
		}
		return mv;	
	}
	
	
	

}
