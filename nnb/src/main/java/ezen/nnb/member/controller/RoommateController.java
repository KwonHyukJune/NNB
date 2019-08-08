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

	private String RI_BIRTH;
	private String MEM_NICK;
	private String RI_GENDER;
	private String RI_REGION;
	private String RI_LOAN_BIG;
	private String RI_LOAN_SMALL;
	private String RI_DATE_START;
	private String RI_DATE_END;

	@RequestMapping(value = "/main/searchRoommate")
	public ModelAndView searchRoommate(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("/member/roommate/roommateList");
		HttpSession session = request.getSession();
		List<Map<String, Object>> searchRoommate = roommateService.searchRoommate(commandMap.getMap());
		int Count = roommateService.countRoommate(commandMap.getMap());
		
		// int count =roommateService.countRoommate();
//리스트?
		if (session.getAttribute("MEM_ID") != null) {// 룸메이트 아이디가 존재하면
			if (session.getAttribute("RI_EXPOSE") == "1") {// 검색 여부 허락하면
				if (session.getAttribute("id") == null) {// 신고당한 회원은 제외한 나머지
														//이게 필요한가
					mv.addObject("searchRoommate",searchRoommate);
					mv.addObject("Count",Count);
				}
			}
		}		
		
		/*
		 * Map<String,Object>mateList=new HashMap<String,Object>();
		 * mateList.put("RI_AGE", RI_AGE); mateList.put("RI_GENDER", RI_GENDER);
		 * mateList.put("RI_LOAN_BIG",RI_LOAN_BIG); mateList.put("RI_NICK", RI_NICK);
		 * mateList.put("RI_REGION", RI_REGION); mateList.put("count", count);
		 * mv.addObject("mateList",mateList);
		 */
		//검색?
		RI_REGION = request.getParameter("RI_REGION");
		if (RI_REGION != null) {
			mv.addObject("RI_REGION", RI_REGION);
		} else {
			mv.addObject("searchRoommate", searchRoommate);
		}

		MEM_NICK = request.getParameter("MEM_NICK");// 닉네임검색
		if (MEM_NICK != null) {
			mv.addObject("MEM_NICK", MEM_NICK);
		} else {
			mv.addObject("searchRoommate", searchRoommate);
		}
		String []mateList1=request.getParameterValues("RI_BIRTH");
		for(int i=0;i<mateList1.length;i++) {
			RI_BIRTH=RI_BIRTH+mateList1[i];
			commandMap.put("minyear", mateList1[0]);
			commandMap.put("maxyear", mateList1[1]);
		}
		RI_GENDER = request.getParameter("RI_GENDER");
		if (RI_GENDER != null) {
			mv.addObject("RI_GENDER", RI_GENDER);
		} else {
			mv.addObject("searchRoommate", searchRoommate);
		}
		RI_DATE_START=request.getParameter("RI_DATE_START");
		if(RI_DATE_START!=null) {
			mv.addObject("RI_DATE_START",RI_DATE_START);
		}else {
			mv.addObject("searchRoommate",searchRoommate);
		}
		RI_DATE_END=request.getParameter("RI_DATE_END");
		if(RI_DATE_END!=null) {
			mv.addObject("RI_DATE_END",RI_DATE_END);
		}else {
			mv.addObject("searchRoommate",searchRoommate);
		}
		String[]mateList3=request.getParameterValues("RI_LOAN_BIG");
		for(int i=0;i<mateList3.length;i++) {
			RI_LOAN_BIG=RI_LOAN_BIG+mateList3[i];
			commandMap.put("maxdeposit", mateList3[0]);
			commandMap.put("maxrent",mateList3[1]);
		}
		String[]mateList4=request.getParameterValues("RI_LOAN_SMALL");
		for(int i=0;i<mateList4.length;i++) {
			RI_LOAN_SMALL=RI_LOAN_SMALL+mateList4[i];
			commandMap.put("mindeposit",mateList4[0]);
			commandMap.put("minrent", mateList4[1]);
		}
		
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
			roommateService.listAddFavRoommate(commandMap.getMap());
			commandMap.put("IGNORE_MEM", session.getAttribute("MEM_ID"));
			commandMap.put("IGNORE_NUM", commandMap.get("IGNORE_NUM"));
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
			commandMap.put("IGNORE_MEM", session.getAttribute("MEM_ID"));
			commandMap.put("IGNORE_NUM", commandMap.get("IGNORE_NUM"));
			mv.setViewName("redirect:/roommate/search");
		}
		return mv;

	}

	@RequestMapping(value = "/roommate/detail")
	public ModelAndView openRoommateDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/roommate/roommateDetail");
		Map<String, Object> map = roommateService.openRoommateDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		return mv;
	}

	@RequestMapping(value = "/roommate/detail/addFavRoommate", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView detailAddFavRoommate(HttpServletRequest request, HttpServletResponse response,
			CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("MEM_ID") != null) {
			commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));
			commandMap.put("FAV_MATE_NUM", commandMap.get("FAV_MATE_NUM"));
			roommateService.listAddFavRoommate(commandMap.getMap());
		} else {
			mv.setViewName("redirect:/member/main/loginForm");
		}
		return mv;
	}

	@RequestMapping(value = "/roommate/detail/deleteFavRoommate")
	public ModelAndView datailDeleteFavRoommate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		roommateService.detailDeleteFavRoommate(commandMap.getMap());
		mv.setViewName("redirect:/roommate/detail");
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
		int check = ignoreService.checkIgnore(commandMap.getMap());
		if (check == 0) {
			ignoreService.insertIgnore(commandMap.getMap());
			commandMap.put("IGNORE_MEM", session.getAttribute("MEM_ID"));
			commandMap.put("IGNORE_NUM", commandMap.get("IGNORE_NUM"));
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