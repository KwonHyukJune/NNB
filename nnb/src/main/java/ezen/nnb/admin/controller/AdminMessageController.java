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
	
	int currentPage = 0;
	int totalCount; 
	int blockCount = 10;
	int blockPage = 5;
	private String pagingHtml;  
	private Paging page;
	private int searchNum;
	private String isSearch;
	
@Resource(name="adminMessageService")
private AdminMessageService adminMessageService;

@Resource(name="adminLoginService")
private AdminLoginService adminLoginService;	

public ModelAndView adMessageList(CommandMap commandMap,HttpServletRequest request)throws Exception {
		
if(request.getParameter("currentPage")==null || request.getParameter("currentPage").trim().isEmpty()
				  || request.getParameter("currentPage").equals("0")) {
			  currentPage=1;
		  }else {
			  currentPage=Integer.parseInt(request.getParameter("currentPage"));
			  
		  }
		ModelAndView mv=new ModelAndView();
		List<Map<String,Object>>adminMessageList=adminMessageService.adminMessageList(commandMap.getMap());
		

		
		isSearch=request.getParameter("isSearch");
		  
		if(isSearch !=null) {
		  searchNum=Integer.parseInt(request.getParameter("searchNum"));
		  isSearch=request.getParameter("isSearch");
			  
		  if(searchNum==1) {
			  adminMessageList=adminMessageService.adminMessageSearchContent(isSearch);
			  }if(searchNum==2) {
				  adminMessageList=adminMessageService.adminMessageSearchTitle(isSearch);
			  }  totalCount=adminMessageList.size();
			  page=new Paging(currentPage,totalCount,blockCount,blockPage,"adminMessageList");
			  pagingHtml=page.getPagingHtml().toString();
				  
			  int lastCount=totalCount;
			  
			  if(page.getEndCount()<totalCount)
				  lastCount=page.getEndCount()+1;
			  adminMessageList=adminMessageList.subList(page.getStartCount(),lastCount);
			  
			  mv.addObject("isSearch",isSearch);
			  mv.addObject("searchNum",searchNum);
			  mv.addObject("totalCount",totalCount);
			  mv.addObject("pagingHtml",pagingHtml);
			  mv.addObject("currentPage",currentPage);
			  mv.addObject("adminMessageList",adminMessageList);
			  mv.setViewName("admin/message/messageList");
			  
			  return mv;
			 }else {
			  totalCount=adminMessageList.size();
			  page=new Paging(currentPage,totalCount,blockCount,blockPage,"adminMessageList");
			  pagingHtml=page.getPagingHtml().toString();
				  
			  int lastCount=totalCount;
				  
			  if(page.getEndCount()<totalCount)
				  lastCount=page.getEndCount()+1;
			  adminMessageList=adminMessageList.subList(page.getStartCount(),lastCount);
			  
			  mv.addObject("isSearch",isSearch);
			  mv.addObject("searchNum",searchNum);
			  mv.addObject("totalCount",totalCount);
			  mv.addObject("pagingHtml",pagingHtml);
			  mv.addObject("currentPage",currentPage);
			  mv.addObject("adminMessageList",adminMessageList);
			  mv.setViewName("admin/message/messageList");
				  
			 return mv;
		  }
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
		if (commandMap.getMap().get("SENDER")!=null){
			commandMap.put("SENDER", session.getAttribute("ADMIN_ID"));
			commandMap.put("MESSAGE_NUM", commandMap.get("MESSAGE_NUM"));			
			mv.setViewName("redirect:/admin/message/messageList");
		}else {
			mv.setViewName("admin/message/messageWriteForm");
			}
	
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


