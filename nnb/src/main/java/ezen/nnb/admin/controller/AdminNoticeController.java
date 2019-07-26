package ezen.nnb.admin.controller;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ezen.nnb.admin.service.AdminNoticeService;

import ezen.nnb.common.CommandMap;

@Controller 
public class /*컨트롤러*/AdminNoticeController {
	Logger log=Logger.getLogger(this.getClass());
	@Resource(name="adminNoticeService") 
	private AdminNoticeService adminNoticeService;
	
	//목록
	@RequestMapping(value=/*MapperURL*/"/admin/noticeList")
	public ModelAndView adminNoticeList(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView(/*jsp*/"/admin/notice/list");
		List<Map<String,Object>> list=adminNoticeService.selectNoticeList(commandMap.getMap());
		mv.addObject("list",list);	
		return mv;
	}

	//상세
	@RequestMapping(value=/*MapperURL*/"/admin/noticeDetail")
	public ModelAndView /*메소드*/adminNoticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"/admin/notice/detail");
		Map<String,Object> map = adminNoticeService./*Mybatis ID*/selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}//등록폼	
	@RequestMapping(value=/*MapperURL*/"/admin/noticeWriteForm")
	public ModelAndView /*메소드*/adminNoticeWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"/admin/notice/writeForm");
		return mv;
	}//등록
	@RequestMapping(value=/*MapperURL*/"/admin/noticeWrite")
	public ModelAndView /*메소드*/adminNoticeWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/noticeList");
		adminNoticeService./*Mybatis ID*/insertNoticeWrite(commandMap.getMap());
		return mv;
	}//수정폼
	@RequestMapping(value=/*MapperURL*/"/admin/noticeModifyForm")
	public ModelAndView /*메소드*/adminNoticeModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"/admin/notice/modifyForm");
		Map<String,Object> map = adminNoticeService./*Mybatis ID*/selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}//수정
	@RequestMapping(value=/*MapperURL*/"/admin/noticeModify")
	public ModelAndView /*메소드*/adminNoticeModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/noticeDetail");
		adminNoticeService./*Mybatis ID*/updateNoticeModify(commandMap.getMap());
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	//삭제
	@RequestMapping(value=/*MapperURL*/"/admin/noticeDelete")
	public ModelAndView /*메소드*/adminNoticeDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/noticeList");
		adminNoticeService./*Mybatis ID*/deleteNotice(commandMap.getMap());
		return mv;
	}
}

