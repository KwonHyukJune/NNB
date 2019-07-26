package ezen.nnb.admin.controller;

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

		@Resource(name="AdminMemberService")
		private AdminMemberService AdminMemberService;
		
		@RequestMapping(value="/admin/memberList")
		public ModelAndView memberList(CommandMap commandMap,HttpServletRequest request)throws Exception{
			
			  if(request.getParameter("currentPage")==null || request.getParameter("currentPage").trim().isEmpty()
					  || request.getParameter("currentPage").equals("0")) {
				  currentPage=1;
			  }else {
				  currentPage=Integer.parseInt(request.getParameter("currentPage"));
				  
			  }
			  ModelAndView mv=new ModelAndView();
			  List<Map<String,Object>>adminMemberList=AdminMemberService.adminMemberList(commandMap.getMap());
			  
			  Map<String,Object> isSearchMap=new HashMap<String, Object>();
			  
			  isSearch=request.getParameter("isSearch");
			  
			  if(isSearch !=null) {
				  searchNum=Integer.parseInt(request.getParameter("searchNum"));
				  isSearchMap.put("isSearch", isSearch);
				  
				  if(searchNum==0) {
					  adminMemberList=AdminMemberService.adminMemberSearch(isSearchMap);
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
				  mv.setViewName("memberList");
				  
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
				  mv.setViewName("memberList");
				  
				  return mv;
			  }
		}	  
				@RequestMapping(value="/admin/memberDetail")
			    public ModelAndView memberDetail(CommandMap commandMap) throws Exception{
					ModelAndView mv = new ModelAndView();
					Map<String,Object>memberDetailm = AdminMemberService.adminMemberDetail(commandMap.getMap());
					mv.addObject("memberDetailm",memberDetailm);
					mv.setViewName("memberDetail");			
					return mv;		 
		}
				@RequestMapping(value="/admin/memberDetail")
				public ModelAndView memberBan(CommandMap commandMap)throws Exception{
					ModelAndView mv = new ModelAndView();
					AdminMemberService.adminMemberBan(commandMap.getMap());
					mv.setViewName("memberDetail");
					return mv;
					
				}
			}
				

