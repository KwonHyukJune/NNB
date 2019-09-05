package ezen.nnb.member.controller;

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

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.FavoriteService;
import ezen.nnb.member.service.IgnoreService;
import ezen.nnb.member.service.MessageService;
import ezen.nnb.member.service.RoommateService;

@Controller
public class RoommateController {
	
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name = "roommateService")
	private RoommateService roommateService;
	@Resource(name = "ignoreService")
	private IgnoreService ignoreService;
	@Resource(name="favoriteService")
	private FavoriteService favoriteService;
	@Resource(name="messageService")
	private MessageService messageService;

	@RequestMapping(value = "/searchRoommate")
	public ModelAndView openRoommateList(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("/member/roommate/roommateList");
		List<Map<String, Object>> searchRoommate = roommateService.searchRoommate(commandMap.getMap());
		mv.addObject("list",searchRoommate);
		return mv;
	}
	 
	@RequestMapping(value = "/searchRoommateList")
	@ResponseBody
	public ModelAndView searchRoommateList(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		List<Map<String, Object>> searchRoommate = roommateService.searchRoommate(commandMap.getMap());
		int Count = roommateService.countRoommate(commandMap.getMap());
		
		Map<String,Object> favMateNum=favoriteService.selectFavRoommate(commandMap.getMap());
		mv.addObject("favMateNum",favMateNum);
		
		mv.addObject("list",searchRoommate);
		mv.addObject("total",Count);
		return mv;
	}

	@RequestMapping(value = "/roommate/list/addFavRoommate", method = RequestMethod.POST)
	public ModelAndView listAddFavRoommate(HttpServletRequest request, HttpServletResponse response,
			CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));
		String check = request.getParameter("check");
		System.out.println("22:"+check);
		if (check.equals("0")) {
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
		if (check == "1") {
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
		if (check == "0") {
			commandMap.put("RI_MEM_ID", session.getAttribute("MEM_ID"));
			roommateService.detailAddFavRoommate(commandMap.getMap());
			mv.setViewName("member/roommate/roommateDetail");
		} 
		return mv;
	}

	@RequestMapping(value = "/roommate/detail/deleteFavRoommate")
	public ModelAndView datailDeleteFavRoommate(CommandMap commandMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		String check = request.getParameter("check");
		if (check == "1") {
			roommateService.detailAddFavRoommate(commandMap.getMap());
			mv.setViewName("member/roommate/roommateDetail");
		}
		return mv;

	}

	@RequestMapping(value = "/roommate/detail/messageWriteForm")
	public ModelAndView messageWriteForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/roommate/messageWriteForm");
		return mv;
	}

	@RequestMapping(value = "/roommate/detail/messageWrite", method = RequestMethod.POST)
	public ModelAndView messageWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		 commandMap.put("SENDER", session.getAttribute("MEM_ID")); 
		messageService.insertMessage(commandMap.getMap());
			mv.setViewName("member/roommate/messageWrite");
	return mv;
	}
  
	@RequestMapping(value = "/roommate/ignore")
	public ModelAndView ignoreUser(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/roommate/roommateDetail");
		HttpSession session = request.getSession();
		commandMap.put("IGNORE_MEM", session.getAttribute("MEM_ID"));
		int check = ignoreService.checkIgnore(commandMap.getMap());
		if (check == 0) {
			ignoreService.insertIgnore(commandMap.getMap());
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
	
	@RequestMapping(value = "/roommate/addFavRoommate", method = RequestMethod.POST)
	public ModelAndView addFavRoom(CommandMap commandMap) throws Exception{
		String url = (String) commandMap.get("url");
		ModelAndView mv = new ModelAndView(url);
		
		if(commandMap.get("check").equals("0")) {
			favoriteService.addFavRoommate(commandMap.getMap());
		}
		else if(commandMap.get("check").equals("1")){
			favoriteService.deleteFavRoommate(commandMap.getMap());
		}
		
		return mv;
	}
}