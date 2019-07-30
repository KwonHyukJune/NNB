package ezen.nnb.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.common.MailHandler;
import ezen.nnb.member.service.JoinService;

@Controller
public class JoinController {
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name="mailSender")
	private JavaMailSender mailSender;	
	
	@Resource(name="joinService") //service 영역에 접근
	private JoinService joinService;
	
	/*
	 * @RequestMapping(value="/join") //회원가입 버튼 누르면 동작 public ModelAndView
	 * join(CommandMap commandMap) throws Exception{ ModelAndView mv=new
	 * ModelAndView("redirect:memeber/main/main");
	 * joinService.insertMember(commandMap.getMap());
	 * 
	 * return mv;
	 */
	@RequestMapping(value="/joinForm") //회원가입 폼 
	public ModelAndView joinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("member/main/joinForm");
		return mv;
	}
	@RequestMapping(value="/join/idCheck") /////////////////////////////////////////////////수정이 요구됨
	public ModelAndView idCheck(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView();
		int idCheck = joinService.selectIdCheck(commandMap.getMap());
		
		return mv;
	}/////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/join/emailAuth")
	//회원가입 할 경우 해당 이메일 인증을 요구하는 링크를 첨부한 이메일을 발송
	public ModelAndView emailAuth(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("member/main/joinConfirm");
		//mybatis로 inserMeber() 기능 처리 및 해당 이메일로 이메일 발송
		joinService.insertMember(commandMap.getMap());
		
		MailHandler sendMail=new MailHandler(mailSender);
		
		sendMail.setSubject("이메일 인증 확인 메일입니다.");
		sendMail.setText(new StringBuffer()
				.append("<h1>메일인증<h1>")
				.append("<a href='http://localhost:8080/nnb/memberVerify?mem_email"
						+ commandMap.getMap().get("mem_email")/* .toString() */)
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("rrnjs1245@naver.com","테스트");
		sendMail.setTo(commandMap.getMap().get("mem_email").toString());
		sendMail.send();
		
		return mv;
	}
	@RequestMapping(value="/memberVerify", method=RequestMethod.GET)
	//member table에 verfiy컬럼의 값을 바꿔준다.
	public ModelAndView signSuccess(CommandMap commandMap) throws Exception{
		//이메일 인증기능 처리
		ModelAndView mv=new ModelAndView("member/main/joinConfirm");
		commandMap.getMap().get("mem_email").toString();
		joinService.verifyMember(commandMap.getMap());
		
		return mv;
	}
}

