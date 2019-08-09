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

@Controller
public class AdminMessageController {
	
@Resource(name="adminMessageService")
private AdminMessageService adminMessageService;

@Resource(name="adminLoginService")

private AdminLoginService adminLoginService;	

	@RequestMapping(value="/admin/messageList")
	public ModelAndView adMessageList(CommandMap commandMap,HttpServletRequest request)throws Exception {
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession();
		List<Map<String,Object>>adminMessageList=adminMessageService.adminMessageList(commandMap.getMap());
		commandMap.put("ADMIN_ID", session.getAttribute("ADMIN_ID"));
    	mv.addObject("adminMessageList",adminMessageList);
		mv.setViewName("admin/message/messageList");
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
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession();	
			commandMap.put("SENDER", session.getAttribute("ADMIN_ID"));
			commandMap.put("MESSAGE_NUM", commandMap.get("MESSAGE_NUM"));			
			mv.setViewName("redirect:/admin/message/messageList");
	
	
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


