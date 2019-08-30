/*
Service-CSID	
http://localhost:8080/ninaebang/service/faq		자주묻는질문	/faq	faqList()					serviceService.openFAQList		serviceDAO	selectFaqList		/service/faq.jsp
http://localhost:8080/ninaebang/service/qna		1:1질문	/qna		writeQNA()																				/service/qna.jsp
http://localhost:8080/ninaebang/service/send	질문제출	/send		sendQNA()				serviceService.sendQNA			serviceDAO	insertQNA			/service/send.jsp
http://localhost:8080/ninaebang/service/notice	공지사항	/notice		noticeList()			serviceService.openNoticeList	serviceDAO	selectNoticeList	/service/notice.jsp
*/
package ezen.nnb.member.controller;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.ServiceService;

@Controller(value = "/service")
public class ServiceController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "serviceService")
	private ServiceService serviceService;
	
	@RequestMapping(value="/faq") 
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView("/member/service/faq"); 
		return mv; 
	} 
	@RequestMapping(value = "/member/faq")
	public ModelAndView faqList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = serviceService.openFAQList(commandMap.getMap());
		
		mv.addObject("list", list);
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		return mv;
	}
	@RequestMapping(value="/qna")
	public ModelAndView qnaForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("/member/service/qna");
		return mv;
	}
	@RequestMapping(value="/service/qna")
	public ModelAndView sendQNA(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/member/service/send");
		serviceService.sendQNA(commandMap.getMap());
		return mv;
	}
	//list & detail
	@RequestMapping(value = "/notice")
	public ModelAndView openNoticeList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/service/notice");
		return mv;
	}	
	@RequestMapping(value = "/member/notice")
	public ModelAndView noticeList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = serviceService.openNoticeList(commandMap);
		mv.addObject("list", list);
		if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
		mv.addObject("list", list);
		return mv;
	}	

}
 
