package ezen.nnb.member.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.RoommateService;

@Controller
public class RoommateInfoController {
	@Resource(name="roommateService")
	private RoommateService roommateService;
	@RequestMapping(value="/myPage/myProfile")
	public ModelAndView myProfile(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("/member/myPage/myProfile");
		HttpSession session= request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		
		Map<String,Object>map=roommateService.myProfile(commandMap.getMap());
		mv.addObject("map",map);
		return mv;
	}


	@RequestMapping(value="/myPage/registMyProfileForm")
	public ModelAndView registProfileForm()throws Exception{
		ModelAndView mv=new ModelAndView("/member/myPage/registMyProfileForm");
		return mv;
	}
	@RequestMapping(value="/myPage/registMyProfile")
	public ModelAndView registProfile(CommandMap commandMap,HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("redirect:/myPage/myProfile");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		roommateService.registProfile(commandMap.getMap());
		return mv;
	}
	@RequestMapping(value="/myPage/myProfileModifyForm")
	public ModelAndView myProfileModifyForm(HttpServletRequest request, CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("/member/myPage/myProfileModifyForm");
		HttpSession session= request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		Map<String,Object>map=roommateService.myProfile(commandMap.getMap());
		mv.addObject("map",map);
		return mv;
	}
	@RequestMapping(value="/myPage/myProfileModify")
	public ModelAndView myProfileModify(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv= new ModelAndView("/member/myPage/myProfileModify");
		HttpSession session= request.getSession();
		commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
		roommateService.myProfileModify(commandMap.getMap());
		mv.addObject("RI_NUM",commandMap.get("RI_NUM"));
		return mv;
	}
	@RequestMapping(value="/myPage/myProfileDelete")
	public ModelAndView myProfileDelete(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView("redirect:/myPage/myProfile");
		roommateService.myProfileDelete(commandMap.getMap());
		return mv;
	}
}
