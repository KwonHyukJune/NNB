package ezen.nnb.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
	@RequestMapping(value="/admin/roomList")
	public ModelAndView roomList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("admin/room/roomList");
		return mv;
	}
	
	//목록 임시
	@RequestMapping(value=/*MapperURL*/"/admin/selectRoomList")
	@ResponseBody
	public ModelAndView selectRoomList(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView(/*jsp*/"jsonView");
		
		List<Map<String,Object>> list=adminRoomService.selectAdminRoomList(commandMap.getMap());
		mv.addObject("list",list);	
		if(list.size() > 0){
    		mv.addObject("total", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("total", 0);
    	}
		return mv;
	}
	
	//관리자 룸 상세
	@RequestMapping(value="/admin/roomDetail")
    public ModelAndView adminRoomDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String,Object>map = adminRoomService.selectAdminRoomDetail(commandMap.getMap());
		mv.addObject("roomDetail",map);
		mv.setViewName("/admin/room/roomDetail");			
		return mv;	
	}
	//관리자가 회원이 보는 방 상세로 연결
	@RequestMapping(value="/admin/detailRoom")
    public ModelAndView detailRoom(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String,Object>map = adminRoomService.detailRoom(commandMap.getMap());
		mv.addObject("roomDetail",map);
		mv.setViewName("/admin/roomDetail");			
		return mv;		 	
	}
	@RequestMapping(value="admin/roomStatus")
	public ModelAndView adminRoomStatus(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView();
	adminRoomService.updateAdminRoomStatus(commandMap.getMap());
	mv.addObject("room_status", commandMap.get("room_status"));
	mv.setViewName("redirect:/admin/roomList");
	return mv;	
	}

	@RequestMapping(value="admin/roomDelete")
	public ModelAndView deleteRoom(CommandMap commandMap)throws Exception{
		ModelAndView mv=new ModelAndView();
		adminRoomService.deleteRoom(commandMap.getMap());
		mv.setViewName("redirect:/admin/roomList");
		return mv;
	}
}    ////
