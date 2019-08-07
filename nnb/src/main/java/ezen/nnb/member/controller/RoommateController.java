package ezen.nnb.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	@Resource(name = "roommateService")
	private RoommateService roommateService;
	@Resource(name = "ignoreService")
	private IgnoreService ignoreService;

	int currentPage = 1;
	int totalCount;
	int blockCount = 16;
	int blockPage = 10;
	private String pagingHtml;
	private Paging page;
	private String RI_AGE;
	private String RI_NICK;
	private String RI_GENDER;
	private String RI_LOAN_BIG;
	private String RI_REGION;


	@RequestMapping(value = "/main/searchRoommate")
	public ModelAndView searchRoommate(HttpServletResponse response, HttpServletRequest request, CommandMap commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView("/member/roommate/roommateList");
		HttpSession session = request.getSession();
		List<Map<String, Object>> searchRoommate = roommateService.searchRoommate(commandMap.getMap());
		// int count =roommateService.countRoommate();

		if (session.getAttribute("MEM_ID") != null) {// 룸메이트 아이디가 존재하면
			if (session.getAttribute("RI_EXPOSE") == "1") {// 검색 여부 허락하면
				if (session.getAttribute("id") == null) {// 신고당한 회원은 제외한 나머지
														//이게 필요한가
					
					RI_REGION = request.getParameter("RI_REGION");
					if (RI_REGION != null) {
						mv.addObject("RI_REGION", RI_REGION);
					} else {
						mv.addObject("searchRoommate", searchRoommate);
					}

					RI_NICK = request.getParameter("RI_NICK");// 닉네임검색
					if (RI_NICK != null) {
						mv.addObject("RI_NICK", RI_NICK);
					} else {
						mv.addObject("searchRoommate", searchRoommate);
					}
					RI_AGE = request.getParameter("RI_AGE");// 나이
					if (RI_AGE != null) {
						mv.addObject("RI_AGE", RI_AGE);
						commandMap.put("minyear", "minyear");
						commandMap.put("maxyear", "maxyear");
					} else {
						mv.addObject("searchRoommate", searchRoommate);
						commandMap.put("minyear", 1);// ....??
					}
					RI_GENDER = request.getParameter("RI_GENDER");// 성별
					if (RI_GENDER != null) {
						mv.addObject("RI_GENDER", RI_GENDER);
					} else {
						mv.addObject("searchRoommate", searchRoommate);
					}
					RI_LOAN_BIG = request.getParameter("RI_LOAN_BIG");// 기간
					if (RI_LOAN_BIG != null) {
						mv.addObject("RI_LOAN_BIG", RI_LOAN_BIG);
						commandMap.put("mindeposit", "mindeposit");
						commandMap.put("maxdeposit", "maxdeposit");
					} else {
						mv.addObject("searchRoommate", searchRoommate);
					}
				}
			}
		} else if (session.getAttribute("MEM_ID") == null) {// 룸메이트 아이디 존재하지 않으면
			mv.addObject("message", "등록되지 않은 사용자입니다");
		}

		
		/*
		 * Map<String,Object>mateList=new HashMap<String,Object>();
		 * mateList.put("RI_AGE", RI_AGE); mateList.put("RI_GENDER", RI_GENDER);
		 * mateList.put("RI_LOAN_BIG",RI_LOAN_BIG); mateList.put("RI_NICK", RI_NICK);
		 * mateList.put("RI_REGION", RI_REGION); mateList.put("count", count);
		 * mv.addObject("mateList",mateList);
		 */
		
		  
		  totalCount = roommateService.countRoommate();
		  
		  page = new Paging(currentPage, totalCount, blockCount, blockPage,"searchRoommate"); 
		  pagingHtml = page.getPagingHtml().toString();
		 
		  int lastCount = totalCount;
		  
		  if(page.getEndCount() < totalCount) lastCount = page.getEndCount() + 1;
		 
		 searchRoommate = searchRoommate.subList(page.getStartCount(), lastCount);
		  mv.addObject("RI_REGION",RI_REGION); mv.addObject("RI_NICK",RI_NICK);
		  mv.addObject("RI_AGE",RI_AGE); mv.addObject("RI_GENDER",RI_GENDER);
		  mv.addObject("RI_LOAN_BIG",RI_LOAN_BIG);
		  mv.addObject("totalCount",totalCount); mv.addObject("pagingHtml",pagingHtml);
		  mv.addObject("currentPage",currentPage);
		  mv.addObject("searchRoommate",searchRoommate);
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