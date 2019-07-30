package ezen.nnb.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.paging.Paging;
import ezen.nnb.admin.service.AdminRoomService;
import ezen.nnb.common.CommandMap;
@Controller
public class AdminRoomController{
		
	int currentPage = 0;
	int totalCount; 
	int blockCount = 10;
	int blockPage = 5;
	private String pagingHtml;  
	private Paging page;
	private int searchNum;
	private String isSearch;

	@Resource(name="adminRoomService")
	private AdminRoomService adminRoomService;
		
			@RequestMapping(value/*##MU*/="admin/roomList")
			public ModelAndView adminRoomList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			
			if(request.getParameter("currentPage")==null || request.getParameter("currentPage").trim().isEmpty()
				  || request.getParameter("currentPage").equals("0")) {
			  currentPage=1;
		  	}else {
			  currentPage=Integer.parseInt(request.getParameter("currentPage"));	  
		  	}
		  	ModelAndView mv=new ModelAndView();
		  	List<Map<String,Object>>adminRoomList=adminRoomService.selectAdminRoomList(commandMap.getMap());
				  
			Map<String,Object> isSearchMap=new HashMap<String, Object>();
			  
			isSearch=request.getParameter("isSearch");
			  
			if(isSearch !=null) {
			  searchNum=Integer.parseInt(request.getParameter("searchNum"));
			  isSearchMap.put("isSearch", isSearch);
				  
			  if(searchNum==1) {
				  adminRoomList=adminRoomService.selectAdminRoomTitle(isSearchMap);
			  }if(searchNum==2) {
				  adminRoomList=adminRoomService.selectAdminRoomContent(isSearchMap);
			  }if(searchNum==3) {
				  adminRoomList=adminRoomService.selectAdminRoomWriter(isSearchMap);
			  }
			  totalCount=adminRoomList.size();
			  page=new Paging(currentPage,totalCount,blockCount,blockPage,"adminRoomList");
			  pagingHtml=page.getPagingHtml().toString();
				  
			  int lastCount=totalCount;
			  
			  if(page.getEndCount()<totalCount)
				  lastCount=page.getEndCount()+1;
			  adminRoomList=adminRoomList.subList(page.getStartCount(),lastCount);
			  
			  mv.addObject("isSearch",isSearch);
			  mv.addObject("searchNum",searchNum);
			  mv.addObject("totalCount",totalCount);
			  mv.addObject("pagingHtml",pagingHtml);
			  mv.addObject("currentPage",currentPage);
			  mv.addObject("adminRoomList",adminRoomList);
			  mv.setViewName/*##��*/("admin/roomList");
			  
			  return mv;
			 }else {
			  totalCount=adminRoomList.size();
			  page=new Paging(currentPage,totalCount,blockCount,blockPage,"adminRoomList");
			  pagingHtml=page.getPagingHtml().toString();
				  
			  int lastCount=totalCount;
				  
			  if(page.getEndCount()<totalCount)
				  lastCount=page.getEndCount()+1;
			  adminRoomList=adminRoomList.subList(page.getStartCount(),lastCount);
			  
			  mv.addObject("isSearch",isSearch);
			  mv.addObject("searchNum",searchNum);
			  mv.addObject("totalCount",totalCount);
			  mv.addObject("pagingHtml",pagingHtml);
			  mv.addObject("currentPage",currentPage);
			  mv.addObject("adminRoomList",adminRoomList);
			  mv.setViewName/*##��*/("admin/roomList");
				  
			 return mv;
			 	}
			}	  

			@RequestMapping(value/*##MU*/="/admin/roomDetail")
		    public ModelAndView adminRoomDetail(CommandMap commandMap) throws Exception{
				ModelAndView mv = new ModelAndView();
				Map<String,Object>map = adminRoomService.detailRoom(commandMap.getMap());
				mv.addObject("roomDetail",map);
				mv.setViewName/*##��*/("searchDetail/room");			
				return mv;		 
			}
			@RequestMapping(value/*##MU*/="admin/roomStatus")
			public ModelAndView adminRoomStatus(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView();
			adminRoomService.updateAdminRoomStatus(commandMap.getMap());
			mv.addObject("room_status", commandMap.get("room_status"));
			mv.setViewName("redirect:/searchDetail/room");
			return mv;	
			}

			@RequestMapping(value/*##MU*/="admin/roomDelete")
			public ModelAndView adminMemberBan(CommandMap commandMap)throws Exception{
				ModelAndView mv=new ModelAndView();
				mv.setViewName/*##��*/("redirect:/admin/roomList");
				return mv;
			}
		}    ////
