package ezen.nnb.member.controller;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminBankService;
import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.InfoService;
@Controller
public class InfoController {
	@Resource(name="infoService") 
	private InfoService infoService;
	
///InfoDetail
@RequestMapping(value="/info/agree")
public ModelAndView openAgree(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/info/agree");
	List<Map<String, Object>> map = infoService.selectAgree(commandMap.getMap());	
	return mv;
}

@RequestMapping(value="/info/PersonalData")
public ModelAndView openPersnalData(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/info/PersonalData");
	List<Map<String, Object>> map = infoService.selectPersonalData(commandMap.getMap());	
	return mv;
}

@RequestMapping(value="/info/ArticleRule")
public ModelAndView openArticleRule(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/info/ArticleRule");
	List<Map<String, Object>> map = infoService.selectArticleRule(commandMap.getMap());	
	return mv;
}


}