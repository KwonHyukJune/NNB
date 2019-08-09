package ezen.nnb.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.LoginService;
import ezen.nnb.member.service.RoomService;

@Controller
public class RoomController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "roomService")
	private RoomService roomService;

	@RequestMapping(value = "/room/adminRoom") //내가 올린 방리스트를 리턴해준다.  + 내가 올린 방 개수 카운트 
	public ModelAndView adminRoomList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		HttpSession session = request.getSession();
		
		String MEM_ID = (String) session.getAttribute("MEM_ID");
		commandMap.put("MEM_ID",MEM_ID);
		
		List<Map<String, Object>> list = roomService.selectAdminRoomList(commandMap.getMap());
		Map<String,Object> roomCount = roomService.selectAdminRoomCount(commandMap.getMap());
		
		mv.addObject("roomCount", roomCount); //내놓은 방 개수 확인
		mv.addObject("list", list); //내가 내 놓은 방 리스트
		return mv;
	}
	
	@RequestMapping(value = "/room/writeForm") //방내놓기 폼으로 이동 시켜준다
	public ModelAndView writeRoomForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/room/writeForm");
		return mv;
	}

	@RequestMapping(value = "/room/write") // 방 내놓기 폼에서 등록한 정보들을 db에 저장. 
	public ModelAndView writeRoom(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		if(request.getParameterValues("UTILITY_TYPE")!=null) {
			String[] arr = request.getParameterValues("UTILITY_TYPE");
			String UTILITY_TYPE = "";
			for(int i=0; i<arr.length; i++) {
				UTILITY_TYPE = UTILITY_TYPE+arr[i]+",";
			}
			commandMap.put("UTILITY_TYPE", UTILITY_TYPE);
		}else {
			commandMap.put("UTILITY_TYPE", "");
		}
		if(request.getParameterValues("OPTIONS")!=null) {
			String[] arr2 = request.getParameterValues("OPTIONS");
			String OPTIONS = "";
			for(int i=0; i<arr2.length; i++) {
				OPTIONS = OPTIONS+arr2[i]+",";
			}
			commandMap.put("OPTIONS", OPTIONS);
		}else {
			commandMap.put("OPTIONS", "");
		}
		if(request.getParameterValues("STRUCTURES")!=null) {
			String[] arr3 = request.getParameterValues("STRUCTURES");
			String STRUCTURES = "";
			for(int i=0; i<arr3.length; i++) {
				STRUCTURES = STRUCTURES+arr3[i]+",";
			}
			commandMap.put("STRUCTURES", STRUCTURES);
		}else {
			commandMap.put("STRUCTURES", "");
		}
		if(commandMap.get("UTILITY_PRICE")==null) {
			commandMap.put("UTILITY_PRICE", "");
		}
		if(commandMap.get("PARKING_BILL")==null) {
			commandMap.put("PARKING_BILL", "");
		}
		roomService.insertRoom(commandMap.getMap(), request);
		return mv;
	}
	
	@RequestMapping(value = "/room/roomDetail") // 방 상세 정보를 찾아서 리턴해준다. + 첨부파일
	public ModelAndView detailRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/search/detailRoom");
		
		Map<String,Object> map = roomService.selectRoomDetail(commandMap.getMap());
		mv.addObject("room", map.get("map")); //게시글 상세정보.
		mv.addObject("list", map.get("list")); // 첨부파일의 목록을 가지고 있는 리스트.
		return mv;
	}
	
	@RequestMapping(value = "/room/updateForm")
	public ModelAndView updateRoomForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/update");
		Map<String, Object> map = roomService.selectRoomDetail(commandMap.getMap());
		mv.addObject("room", map.get("map"));
		mv.addObject("list", map.get("list"));
		return mv;
	}
	
	@RequestMapping(value="/room/update")
	public ModelAndView updateRoom(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		if(request.getParameterValues("UTILITY_TYPE")!=null) {
			String[] arr = request.getParameterValues("UTILITY_TYPE");
			String UTILITY_TYPE = "";
			for(int i=0; i<arr.length; i++) {
				UTILITY_TYPE = UTILITY_TYPE+arr[i]+",";
			}
			commandMap.put("UTILITY_TYPE", UTILITY_TYPE);
		}else {
			commandMap.put("UTILITY_TYPE", "");
		}
		if(request.getParameterValues("OPTIONS")!=null) {
			String[] arr2 = request.getParameterValues("OPTIONS");
			String OPTIONS = "";
			for(int i=0; i<arr2.length; i++) {
				OPTIONS = OPTIONS+arr2[i]+",";
			}
			commandMap.put("OPTIONS", OPTIONS);
		}else {
			commandMap.put("OPTIONS", "");
		}
		if(request.getParameterValues("STRUCTURES")!=null) {
			String[] arr3 = request.getParameterValues("STRUCTURES");
			String STRUCTURES = "";
			for(int i=0; i<arr3.length; i++) {
				STRUCTURES = STRUCTURES+arr3[i]+",";
			}
			commandMap.put("STRUCTURES", STRUCTURES);
		}else {
			commandMap.put("STRUCTURES", "");
		}
		roomService.updateRoom(commandMap.getMap(), request);
		mv.addObject("ROOM_NUM", commandMap.get("ROOM_NUM"));
		return mv;
	}
	
	@RequestMapping(value = "/room/delete") // 방을 지운다.
	public ModelAndView deleteRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/room/adminRoom");
		System.out.println(commandMap.get("ROOM_NUM"));
		roomService.deleteRoom(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value="/room/tradeStatus") //광고상태 변경 
	public ModelAndView updateTradeStatus(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/room/adminRoom");
		if(commandMap.get("TRADE_STATUS").equals("1")) {// 광고 중/거래 완료를 받아주는 키값. 키에 대한 값이 1이면 광고 중으로 바꾸기.
														//2 이면 거래 완료.
			roomService.updateReAdRoom(commandMap.getMap());
		}else {
			roomService.updateSoldRoom(commandMap.getMap());
		}
		return mv;
	}
	
	@RequestMapping(value="/room/detail/lessorInfo")
	public ModelAndView lessorInfo(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/search/lessor");
		Map<String,Object> map = roomService.selectLessorInfo(commandMap.getMap());
		mv.addObject("lessor",map);
		return mv;
	}
}
