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
	
	//list & detail
	@RequestMapping(value = "/service/faq")
	public ModelAndView faqList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/service/faq");
		List<Map<String, Object>> list = serviceService.openFAQList(commandMap);
		mv.addObject("list", list);
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
	public ModelAndView noticeList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/service/notice");
		List<Map<String, Object>> list = serviceService.openNoticeList(commandMap);
		mv.addObject("list", list);
		return mv;
	}	

}
 
