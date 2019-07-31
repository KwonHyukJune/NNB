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
	/*
	 @RequestMapping("/myInterest/recentRoom") 
	 public ModelAndView recentRoomList(CommandMap commandMap)throws Exception{ 
	 * ModelAndView mv=new ModelAndView("member/myInterest/recentRoomList");
	 * 
	 * List<Map<String,Object>> list=searchRoomService.selectRoomList(commandMap.getMap());
	 * mv.addObject("list", list);
	 * 
	 * return mv; }
	 */
	@RequestMapping(value="/myInterest/favRoomList")
	public ModelAndView favRoomList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("member/myInterest/favRoomList");
		List<Map<String,Object>> list=favoriteService.selectFavRoomList(commandMap.getMap());
		mv.addObject("list",list);
		return mv;
	}
	@RequestMapping("/myInterest/favRoomCancel")
	public ModelAndView favRoomCancel(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("redirect:member/myInterest/favRoomList");
		
		favoriteService.deleteFavRoom(commandMap.getMap());
		favoriteService.updateFavCountDec(commandMap.getMap());
		
		return mv;
	}
	@RequestMapping("/myInterest/favRoommateList")
	public ModelAndView favRoommateList(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("member/myInterest/myRoommateList");
		List<Map<String,Object>> list=favoriteService.selectRoommateList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	@RequestMapping("/myInterest/favRoommateCancel")
	public ModelAndView favRoommateCancel(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("redirect:member/myInterest/myRoommateList");
		favoriteService.deleteFavRoommate(commandMap.getMap());
		
		return mv;
	}
	
	

}
