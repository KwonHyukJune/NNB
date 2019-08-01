package ezen.nnb.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView adminRoomList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		
		List<Map<String, Object>> list = roomService.selectAdminRoomList(commandMap.getMap());
		Map<String,Object> map = roomService.selectAdminRoomCount(commandMap.getMap());
		
		mv.addObject("map", map);
		mv.addObject("list", list);
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
		roomService.insertRoom(commandMap.getMap(), request);
		return mv;
	}

	@RequestMapping(value = "/room/detail") // 방 상세 정보를 찾아서 리턴해준다. + 첨부파일 해야함
	public ModelAndView detailRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("search/detailRoom");
		
		Map<String,Object> map = roomService.selectRoomDetail(commandMap.getMap());
		mv.addObject("map", map.get("map")); //게시글 상세정보.
		mv.addObject("list", map.get("list")); // 첨부파일의 목록을 가지고 있는 리스트.
		return mv;
	}
	
	@RequestMapping(value = "/room/updateForm")
	public ModelAndView updateRoomForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/room/adminRoom");
		return mv;
	}
	
	@RequestMapping(value="/room/update")
	public ModelAndView updateRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("search/detailRoom");
		return mv;
	}
	@RequestMapping(value = "/room/delete") // 방을 지운다.
	public ModelAndView deleteRoom(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect: member/room/adminRoom");
		roomService.deleteRoom(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value="/room/tradeStatus") //광고상태 변경 
	public ModelAndView updateTradeStatus(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:search/detailRoom");
		if(commandMap.get("Trade_Status").equals("1")) {// 광고 중/거래 완료를 받아주는 키값. 키에 대한 값이 1이면 광고 중으로 바꾸기.
														//2 이면 거래 완료.
			roomService.updateReAdRoom(commandMap.getMap());
		}else {
			roomService.updateSoldRoom(commandMap.getMap());
		}
		return mv;
	}
	
	//정보 수정 + 파일 수정 + 디테일에서 찜하기 찜해제하기 + 임대인 상세정보 + 방신고 폼 +방신고 + 방디테일에서 찜여부체크, 갯수 카운트
}
