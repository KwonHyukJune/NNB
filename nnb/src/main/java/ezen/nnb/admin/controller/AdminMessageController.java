package ezen.nnb.admin.controller;

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
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.paging.Paging;
import ezen.nnb.admin.service.AdminLoginService;
import ezen.nnb.admin.service.AdminMessageService;
import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.MessageService;

@Controller
public class AdminMessageController {
	
@Resource(name="adminMessageService")
private AdminMessageService adminMessageService;

@Resource(name="adminLoginService")
private AdminLoginService adminLoginService;	

@Resource(name="messageService") //messageService에 접근
private MessageService messageService;

	@RequestMapping(value="/admin/messageList")
	public ModelAndView openMessageList(CommandMap commandMap,HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("admin/message/messageList");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/selectMessageList")
	public ModelAndView adMessageList(CommandMap commandMap,HttpServletRequest request)throws Exception {
		ModelAndView mv=new ModelAndView("jsonView");
		HttpSession session = request.getSession();
		commandMap.put("ADMIN_ID", session.getAttribute("ADMIN_ID"));
		List<Map<String,Object>>adminMessageList=adminMessageService.adminMessageList(commandMap.getMap());
    	mv.addObject("list",adminMessageList);
		if(adminMessageList.size()>0) {
			mv.addObject("total",adminMessageList.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("total",0);
		}
    	mv.addObject("count",adminMessageList.size());
		return mv;
    }

	@RequestMapping(value="/admin/messageDetail")
	public ModelAndView adminMessageDetail(CommandMap commandMap) throws Exception {
	   ModelAndView mv=new ModelAndView();
	   Map<String,Object>map=adminMessageService.adminMessageDetail(commandMap.getMap());
	   mv.addObject("map",map);
	   mv.setViewName("admin/message/messageDetail");
	   return mv;
	}

	@RequestMapping(value="/admin/messageWriteForm")
	public ModelAndView adWriteForm()throws Exception{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("admin/message/messageWriteForm");
		return mv;
	}
	@RequestMapping(value="/admin/messageWrite",method=RequestMethod.POST)
	public ModelAndView adWrite(CommandMap commandMap,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mv=new ModelAndView("admin/message/messageWrite");
		HttpSession session=request.getSession();	
		commandMap.put("SENDER", session.getAttribute("ADMIN_ID"));
		System.out.println(commandMap.get("forAll"));
		adminMessageService.adminMessageWrite(commandMap.getMap());
	
		return mv;
	}
		
	@RequestMapping(value="/admin/messageDelete")
	public ModelAndView adMessageDelete(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView();
		adminMessageService.adminMessageDelete(commandMap.getMap());
		mv.setViewName("redirect:/admin/message/messageList");
		return mv;
		
	}

	}


