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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/joinForm") //회원가입 폼 
	public ModelAndView joinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("member/main/joinForm");
		return mv;
	}
	@RequestMapping(value="/join/idCheck")
	public @ResponseBody String idCheck(CommandMap commandMap) throws Exception{
		
		System.out.println(commandMap.getMap());
		String idCheck = String.valueOf(joinService.selectIdCheck(commandMap.getMap()));
		System.out.println(idCheck);

		
		return idCheck;
	}
	
	@RequestMapping(value="/join/nickCheck")
	public @ResponseBody String nickCheck(CommandMap commandMap) throws Exception{

		System.out.println(commandMap.get("mem_nick"));
		String nickCheck = String.valueOf(joinService.selectNickCheck(commandMap.getMap()));
		
		return nickCheck;
	}
	
	@RequestMapping(value="/join/emailAuth", method=RequestMethod.POST)
	//회원가입 할 경우 해당 이메일 인증을 요구하는 링크를 첨부한 이메일을 발송
	public ModelAndView emailAuth(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("member/main/joinConfirm");
		//새 회원 등록 및 해당 이메일로 이메일 발송
		joinService.insertMember(commandMap.getMap());
		MailHandler sendMail=new MailHandler(mailSender);
		sendMail.setSubject("이메일 인증 확인 메일입니다.");
		sendMail.setText(new StringBuffer()
				.append("<h1>메일인증<h1>")
				.append("<a href='http://localhost:8080/nnb/memberVerify?mem_email="
						+ commandMap.getMap().get("mem_email")) 
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("rrnjs1245@naver.com","테스트");
		sendMail.setTo(commandMap.getMap().get("mem_email").toString());
		sendMail.send();
		// 이메일 링크를 누르면 signSucess 메서드를 불러 회원 테이블을 update한다. 
		return mv;
	}
	@RequestMapping(value="/memberVerify", method=RequestMethod.GET)
	//회원 테이블의 verify 컬럼의 값을 바꿔준다.
	public ModelAndView signSuccess(CommandMap commandMap) throws Exception{
		ModelAndView mv=new ModelAndView("member/main/main");
		commandMap.getMap().get("mem_email").toString();
		joinService.verifyMember(commandMap.getMap());
		
		return mv;
	}
	
	
	
}

