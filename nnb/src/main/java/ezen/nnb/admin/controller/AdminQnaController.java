package ezen.nnb.admin.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminQnaService;
import ezen.nnb.common.CommandMap;


@Controller
public class AdminQnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "adminQnaService")
	private AdminQnaService adminQnaService;

	@RequestMapping(value = "/admin/qna/list")
	public ModelAndView adminQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/qna/qnaList");
		List<Map<String, Object>> list = adminQnaService.selectQnaList(commandMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value="/admin/qna/detail")
	public ModelAndView adminQnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/qna/qnaAnswer");
		
		Map<String,Object> map = adminQnaService.selectQnaDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	/*
	 * @RequestMapping(value="/admin/qna/replyForm") public ModelAndView
	 * adminFaqModifyForm(CommandMap commandMap) throws Exception{ ModelAndView mv =
	 * new ModelAndView("/admin/faq/detail");
	 * 
	 * Map<String,Object> map =
	 * adminQnaService.selectQnaDetail(commandMap.getMap()); mv.addObject("map",
	 * map);
	 * 
	 * return mv; }
	 */
	
	@RequestMapping(value="/admin/qna/reply")
	public ModelAndView adminFaqModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/qna/qnaAnswerComplete");
		System.out.println("reply"+commandMap.getMap());

		adminQnaService.updateQna(commandMap.getMap());
		
		mv.addObject("FAQ_NUM", commandMap.get("FAQ_NUM"));
		return mv;
	}
	
	@RequestMapping(value="/admin/qna/delete")
	public ModelAndView adminFaqDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/qna/list");
		
		adminQnaService.deleteQna(commandMap.getMap());
		
		return mv;
	}
}










