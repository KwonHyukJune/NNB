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
public class /*��Ʈ�ѷ�*/AdminNoticeController {
	Logger log=Logger.getLogger(this.getClass());
	@Resource(name="adminNoticeService") 
	private AdminNoticeService adminNoticeService;
	
	//���
	@RequestMapping(value=/*MapperURL*/"/admin/noticeList")
	public ModelAndView adminNoticeList(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView(/*jsp*/"/admin/notice/list");
		List<Map<String,Object>> list=adminNoticeService.selectNoticeList(commandMap.getMap());
		mv.addObject("list",list);	
		return mv;
	}

	//��
	@RequestMapping(value=/*MapperURL*/"/admin/noticeDetail")
	public ModelAndView /*�޼ҵ�*/adminNoticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"/admin/notice/detail");
		Map<String,Object> map = adminNoticeService./*Mybatis ID*/selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}//�����	
	@RequestMapping(value=/*MapperURL*/"/admin/noticeWriteForm")
	public ModelAndView /*�޼ҵ�*/adminNoticeWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"/admin/notice/writeForm");
		return mv;
	}//���
	@RequestMapping(value=/*MapperURL*/"/admin/noticeWrite")
	public ModelAndView /*�޼ҵ�*/adminNoticeWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/noticeList");
		adminNoticeService./*Mybatis ID*/insertNoticeWrite(commandMap.getMap());
		return mv;
	}//������
	@RequestMapping(value=/*MapperURL*/"/admin/noticeModifyForm")
	public ModelAndView /*�޼ҵ�*/adminNoticeModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"/admin/notice/modifyForm");
		Map<String,Object> map = adminNoticeService./*Mybatis ID*/selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}//����
	@RequestMapping(value=/*MapperURL*/"/admin/noticeModify")
	public ModelAndView /*�޼ҵ�*/adminNoticeModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/noticeDetail");
		adminNoticeService./*Mybatis ID*/updateNoticeModify(commandMap.getMap());
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	//����
	@RequestMapping(value=/*MapperURL*/"/admin/noticeDelete")
	public ModelAndView /*�޼ҵ�*/adminNoticeDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(/*jsp*/"redirect:/admin/noticeList");
		adminNoticeService./*Mybatis ID*/deleteNotice(commandMap.getMap());
		return mv;
	}
}

