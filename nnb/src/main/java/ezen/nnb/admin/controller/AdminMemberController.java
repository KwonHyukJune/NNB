package ezen.nnb.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.paging.Paging;
import ezen.nnb.admin.service.AdminMemberService;
import ezen.nnb.common.CommandMap;
@Controller
public class AdminMemberController{
		
	int currentPage = 0;
	int totalCount; 
	int blockCount = 10;
	int blockPage = 5;
	private String pagingHtml;  
	private Paging page;
	private int searchNum;
	private String isSearch;

	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
		
	@RequestMapping(value="/admin/memberList")
	public ModelAndView adMemberList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			
		  if(request.getParameter("currentPage")==null || request.getParameter("currentPage").trim().isEmpty()
				  || request.getParameter("currentPage").equals("0")) {
			  currentPage=1;
		  }else {
			  currentPage=Integer.parseInt(request.getParameter("currentPage"));
				  
		 }
		ModelAndView mv=new ModelAndView();
		List<Map<String,Object>>adminMemberList=adminMemberService.adminMemberList(commandMap.getMap());
			  
		Map<String,Object> isSearchMap=new HashMap<String, Object>();
			  
			isSearch=request.getParameter("isSearch");
			  
			if(isSearch !=null) {
			  searchNum=Integer.parseInt(request.getParameter("searchNum"));
			  isSearchMap.put("isSearch", isSearch);
				  
			  if(searchNum==1) {
				  adminMemberList=adminMemberService.adminMemberSearchID(isSearchMap);
			  }if(searchNum==2) {
				  adminMemberList=adminMemberService.adminMemberSearchName(isSearchMap);
			  }if(searchNum==3) {
				  adminMemberList=adminMemberService.adminMemberSearchNICK(isSearchMap);
			  }
			  totalCount=adminMemberList.size();
			  page=new Paging(currentPage,totalCount,blockCount,blockPage,"adminMemberList");
			  pagingHtml=page.getPagingHtml().toString();
				  
			  int lastCount=totalCount;
			  
			  if(page.getEndCount()<totalCount)
				  lastCount=page.getEndCount()+1;
			  adminMemberList=adminMemberList.subList(page.getStartCount(),lastCount);
			  
			  mv.addObject("isSearch",isSearch);
			  mv.addObject("searchNum",searchNum);
			  mv.addObject("totalCount",totalCount);
			  mv.addObject("pagingHtml",pagingHtml);
			  mv.addObject("currentPage",currentPage);
			  mv.addObject("adminMemberList",adminMemberList);
			  mv.setViewName("admin/member/memberList");
			  
			  return mv;
			 }else {
			  totalCount=adminMemberList.size();
			  page=new Paging(currentPage,totalCount,blockCount,blockPage,"adminMemberList");
			  pagingHtml=page.getPagingHtml().toString();
				  
			  int lastCount=totalCount;
				  
			  if(page.getEndCount()<totalCount)
				  lastCount=page.getEndCount()+1;
			  adminMemberList=adminMemberList.subList(page.getStartCount(),lastCount);
			  
			  mv.addObject("isSearch",isSearch);
			  mv.addObject("searchNum",searchNum);
			  mv.addObject("totalCount",totalCount);
			  mv.addObject("pagingHtml",pagingHtml);
			  mv.addObject("currentPage",currentPage);
			  mv.addObject("adminMemberList",adminMemberList);
			  mv.setViewName("admin/member/memberList");
				  
			 return mv;
		  }
	}	  
			@RequestMapping(value="/admin/memberDetail")
		    public ModelAndView adMemberDetail(CommandMap commandMap) throws Exception{
				ModelAndView mv = new ModelAndView();
				Map<String,Object>map = adminMemberService.adminMemberDetail(commandMap.getMap());
				mv.addObject("memberDetail",map);
				mv.setViewName("admin/member/memberDetail");			
				return mv;		 
	}
			
		@RequestMapping(value="/admin/memberDelete")
		public ModelAndView adMemberBan(CommandMap commandMap,HttpServletRequest request)throws Exception{
			ModelAndView mv=new ModelAndView();
			adminMemberService.adminMemberBan(commandMap.getMap());
			SimpleDateFormat s=new SimpleDateFormat("yyyy/MM/dd");
			Calendar cal=Calendar.getInstance();
			s.format(cal.getTime());
			if(!(commandMap.getMap().get("ADMIN_ID").equals(""))) {
				String id=(String)commandMap.getMap().put("MEM_ID", (String) request.getSession().getAttribute("MEM_ID"));
				if(id!=null) {
					String ban="";//차단기간
					//Date ban_date=(Date)commandMap.getMap().get("BAN_DATE");//제재시작
					String totalBan="";
					String period=(String)commandMap.getMap().get("period");
					if(period=="1") {//=>jsp
						ban="1";
					}else if(period=="2") {
						ban="3";
					}else if(period=="3") {
						ban="7";
					}else if(period=="4") {
						ban="30";
					}
					//totalBan=ban+ban_date;//차단해제날짜
					totalBan=(String)commandMap.getMap().get("BAN_REMOVAL_DATE");//차단해체
					Calendar banDate=(Calendar) commandMap.getMap().get(totalBan);
					int result=cal.compareTo(banDate);//오늘날짜와 비교
					if(result<0) {						
						mv.addObject("MEM_ID",request.getParameter("MEM_ID"));
						mv.setViewName("redirect:/member/main/loginForm");
					}
				}
			}
			mv.addObject("MEM_ID",request.getParameter("MEM_ID"));
			mv.setViewName("redirect:/member/main/main");
			return mv;
		}
	}
				
