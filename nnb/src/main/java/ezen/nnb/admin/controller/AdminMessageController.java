package ezen.nnb.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.paging.Paging;
import ezen.nnb.admin.service.AdminMessageService;
import ezen.nnb.common.CommandMap;

public class AdminMessageController {
	
	int currentPage = 0;
	int totalCount; 
	int blockCount = 10;
	int blockPage = 5;
	private String pagingHtml;  
	private Paging page;
	private int searchNum;
	private String isSearch;
	
@Resource(name="AdminMessageService")
private AdminMessageService AdminMessageService;
	
public ModelAndView adMessageList(CommandMap commandMap,HttpServletRequest request)throws Exception {
		
if(request.getParameter("currentPage")==null || request.getParameter("currentPage").trim().isEmpty()
				  || request.getParameter("currentPage").equals("0")) {
			  currentPage=1;
		  }else {
			  currentPage=Integer.parseInt(request.getParameter("currentPage"));
			  
		  }
		ModelAndView mv=new ModelAndView();
		List<Map<String,Object>>adminMessageList=AdminMessageService.adminMessageList(commandMap.getMap());
		
		Map<String,Object>isSearchMap=new HashMap<String,Object>();
		
		isSearch=request.getParameter("isSearch");
		  
		if(isSearch !=null) {
		  searchNum=Integer.parseInt(request.getParameter("searchNum"));
		  isSearchMap.put("isSearch", isSearch);
			  
		  if(searchNum==1) {
			  adminMessageList=AdminMessageService.adminMessageSearchContent(isSearchMap);
			  }if(searchNum==2) {
				  adminMessageList=AdminMessageService.adminMessageSearchTitle(isSearchMap);
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
			  mv.setViewName("/admin/message/messageList");
				  
			 return mv;
		  }
	}


	}
