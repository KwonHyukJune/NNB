package ezen.nnb.member.controller;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.InfoService;

@Controller
public class InfoController {
	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="infoService") 
	private InfoService InfoService;
	
///InfoDetail
@RequestMapping(value="/info/agree")
public ModelAndView openAgree(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("member/info/agree");
	commandMap.put("terms","이용약관");
	List<Map<String, Object>> list = InfoService.selectTermsDetail(commandMap.getMap());
	mv.addObject("terms",list);
	return mv;
}

@RequestMapping(value="/info/personalData")
public ModelAndView openPersnalData(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("member/info/agree");
	commandMap.put("terms","개인정보처리방침");
	List<Map<String, Object>> list = InfoService.selectTermsDetail(commandMap.getMap());	
	mv.addObject("terms",list);
	return mv;
}

@RequestMapping(value="/info/articleRule")
public ModelAndView openArticleRule(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("member/info/agree");
	commandMap.put("terms","매물관리규정");
	List<Map<String, Object>> list = InfoService.selectTermsDetail(commandMap.getMap());	
	mv.addObject("terms",list);
	return mv;
}


}