package ezen.nnb.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.paging.Paging;
import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.IgnoreService;
import ezen.nnb.member.service.RoommateService;

@Controller
public class RoommateController {
	
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name = "roommateService")
	private RoommateService roommateService;
	@Resource(name = "ignoreService")
	private IgnoreService ignoreService;


	@RequestMapping(value = "/main/searchRoommate")
	public ModelAndView searchRoommate(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("/member/roommate/roommateList");
		HttpSession session = request.getSession();
		commandMap.put("id", session.getAttribute("MEM_ID"));
		List<Map<String, Object>> searchRoommate = roommateService.searchRoommate(commandMap.getMap());
		int Count = roommateService.countRoommate(commandMap.getMap());
		
		// int count =roommateService.countRoommate();
//리스트?
					mv.addObject("searchRoommate",searchRoommate);
					mv.addObject("Count",Count);
		
		  mv.setViewName("member/roommate/roommateList");
		  
		  
	
		return mv;
	}

	@RequestMapping(value = "/roommate/list/addFavRoommate", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView listAddFavRoommate(HttpServletRequest request, HttpServletResponse response,
			CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String check = request.getParameter("check");
		if (check == "1") {
			commandMap.put("RI_MEM_ID", session.getAttribute("MEM_ID"));
			commandMap.put("FAV_MATE_NUM", commandMap.get("FAV_MATE_NUM"));
			roommateService.listAddFavRoommate(commandMap.getMap());
			mv.setViewName("member/roommate/roommateList");
		}
		return mv;
	}

	@RequestMapping(value = "/roommate/list/deleteFavRoommate")
	public ModelAndView listDeleteFavRoommate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String check = request.getParameter("check");
		if (check == "0") {
			roommateService.listDeleteFavRoommate(commandMap.getMap());
			mv.setViewName("redirect:/roommate/search");
		}
		return mv;

	}

	@RequestMapping(value = "/roommate/detail")
	public ModelAndView openRoommateDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/roommate/roommateDetail");
		Map<String,Object>map=roommateService.openRoommateDetail(commandMap.getMap());
		mv.addObject("mate",map);
		return mv;
	}

	@RequestMapping(value = "/roommate/detail/addFavRoommate", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView detailAddFavRoommate(HttpServletRequest request, HttpServletResponse response,
			CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String check = request.getParameter("check");
		if (check == "1") {
			commandMap.put("RI_MEM_ID", session.getAttribute("MEM_ID"));
			commandMap.put("FAV_MATE_NUM", commandMap.get("FAV_MATE_NUM"));
			roommateService.detailAddFavRoommate(commandMap.getMap());
			mv.setViewName("member/roommate/roommateDetail");
		} 
		return mv;
	}

	@RequestMapping(value = "/roommate/detail/deleteFavRoommate")
	public ModelAndView datailDeleteFavRoommate(CommandMap commandMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		String check = request.getParameter("check");
		if (check == "0") {
			roommateService.detailAddFavRoommate(commandMap.getMap());
			mv.setViewName("member/roommate/roommateDetail");
		}
		return mv;

	}

	@RequestMapping(value = "/roommate/detail/messageWriteForm")
	public ModelAndView messageWriteForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/myPage/messageWriteForm");
		return mv;
	}

	@RequestMapping(value = "/roommate/detail/messageWrite", method = RequestMethod.POST)
	public ModelAndView messageWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		if (session.getAttribute("RECEIVER") != null) {
			commandMap.put("SENDER", session.getAttribute("MEM_ID"));
			commandMap.put("MESSAGE_NUM", commandMap.get("MESSAGE_NUM"));
			mv.setViewName("member/myPage/messageWrite");
		} else {
			mv.setViewName("redirect:/member/roommate/roommateDetail");
		}

		return mv;
	}

	@RequestMapping(value = "/roommate/ignore")
	public ModelAndView ignoreUser(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/roommate/roommateDetail");
		HttpSession session = request.getSession();
		Map<String,Object>map=roommateService.openRoommateDetail(commandMap.getMap());
		commandMap.put("IGNORE_MEM", session.getAttribute("MEM_ID"));
		int check = ignoreService.checkIgnore(commandMap.getMap());
		if (check == 0) {
			ignoreService.insertIgnore(commandMap.getMap());
			mv.addObject("mate",map);
		}
		
		return mv;
	}

	@RequestMapping(value = "/roommate/ignoreUser")
	public ModelAndView unIgnoreUser(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/roommate/roommateDetail");
		
		int check = ignoreService.checkIgnore(commandMap.getMap());
		if (check == 1) {
			ignoreService.insertIgnore(commandMap.getMap());
		}
		return mv;
	}
}