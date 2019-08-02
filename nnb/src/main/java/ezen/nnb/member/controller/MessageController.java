package ezen.nnb.member.controller;

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
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.IgnoreService;
import ezen.nnb.member.service.MessageService;

@Controller 
// controller annotation을 통하여 controller객체임을 선언
// controller는 웹브라우저에서 들어온 요청을 해당 비즈니스 로직을 호출, 결과와 함께 응답을 해주는 dispatcher역할
public class MessageController {
	Logger log=Logger.getLogger(this.getClass());

	@Resource(name="messageService") //messageService에 접근
	private MessageService messageService;
	
	@Resource(name="ignoreService") //ignoreService에 접근
	private IgnoreService ignoreService;
	
	//메세지함 리스트
	@RequestMapping(value="/myPage/messageList") //요청 url
	public ModelAndView messageList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView("member/myPage/messageList");
		HttpSession session = request.getSession();
		commandMap.put("MEM_ID", session.getAttribute("MEM_ID"));
		
		if(commandMap.containsKey("check")) {
			mv.addObject("check",commandMap.get("check"));
		}
		List<Map<String,Object>> list=messageService.selectMessageList(commandMap.getMap());
		int count = list.size();
		mv.addObject("count",count);
		mv.addObject("list", list);
		
		return mv;
	}
	//메세지 작성 폼
	@RequestMapping(value="/myPage/messageWriteForm")
	public ModelAndView messageWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("member/myPage/messageWriteForm");
		if(commandMap.containsKey("receiver")) {
			mv.addObject("receiver",commandMap.get("receiver"));
		}
		return mv;
	}
	//메세지 보내기
	@RequestMapping(value="/myPage/messageWrite", method=RequestMethod.POST)
	public ModelAndView messageWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView("member/myPage/messageWrite");
		HttpSession session = request.getSession();
		commandMap.put("SENDER", session.getAttribute("MEM_ID"));
		messageService.insertMessage(commandMap.getMap());
				
		return mv;
	}
	//차단 목록+차단 목록 개수
	@RequestMapping(value="/myPage/ignoreUserList")
	public ModelAndView ignoreUserList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView("member/myPage/ignoreList");
		HttpSession session = request.getSession();
		commandMap.put("IGNORE_MEM", session.getAttribute("MEM_ID"));
		
		int count=ignoreService.countIgnoreUserList(commandMap.getMap());
		mv.addObject("count",count);
		
		List<Map<String,Object>> list=ignoreService.selectIgnoreUserList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	// 차단하기
	@RequestMapping(value="/myPage/ignoreUser")
	public ModelAndView ignoreUser(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView("redirect:/myPage/messageList");
		HttpSession session = request.getSession();
		commandMap.put("IGNORE_MEM", session.getAttribute("MEM_ID"));
		int check = ignoreService.checkIgnore(commandMap.getMap());
			if(check==0) {
				ignoreService.insertIgnore(commandMap.getMap());
			}else {
				Map<String,Object> map = new HashMap<String, Object>();
				mv.addObject("check",check);
			}
		return mv;
	}
	// 차단해제
	@RequestMapping(value="/myPage/ignoreCancel")
	public ModelAndView ignoreCancel(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("redirect:/myPage/ignoreUserList");
		ignoreService.deleteIgnore(commandMap.getMap());
		
		return mv;
	}
}
