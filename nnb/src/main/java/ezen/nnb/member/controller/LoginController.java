package ezen.nnb.member.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminBanService;
import ezen.nnb.common.CommandMap;
import ezen.nnb.common.MailHandler;
import ezen.nnb.member.service.LoginService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "adminBanService")
	private AdminBanService adminBanService;

	@Resource(name = "mailSender")
	private JavaMailSender mailSender;

	// Login Form
	@RequestMapping(value = "/loginForm")
	public ModelAndView loginForm() throws Exception {
		ModelAndView mv = new ModelAndView("/member/main/loginForm");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/main/login");
		String message = "";
		String url = "";

		HttpSession session = request.getSession();

		System.out.println("MEM_ID:"+commandMap.get("MEM_ID"));
		Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
		Map<String, Object> banChk = adminBanService.banDateCheck(commandMap.getMap());
		if (chk==null) { // 아이디가 있는지 없는지를 확인
			message = "해당 아이디가 존재하지 않습니다.";

		} else {
			if (chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) {
				if (chk.get("MEM_VERIFY").equals("Y")) { // 이메일 인증을 했을ㄸ ㅐ
					if (banChk==null || ((BigDecimal)banChk.get("EXP_DATE")).intValue() <= 0) {// 모든 조건을 충족시키면 로그인!
						session.setAttribute("MEM_ID", commandMap.get("MEM_ID")); // ���ǿ� ���̵� �־��
					} else { // 제재기한이 아직 남았을 때
						java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
						message = "회원님은 " + sdf.format(banChk.get("BAN_REMOVAL_DATE")) + "까지 이용이 제재되었습니다.";
						url = "/main";
					}
				} else { // 이메일 인증을 완료하지 않았을 떄
					message = "이메일 인증을 완료해주세요.";
					url = "/main";
				}

			} else { // 비밀번호가 일치하지 않을 때
				message = "비밀번호가 맞지 않습니다.";
			}
		}
		mv.addObject("message",message);
		mv.addObject("url",url);
		return mv;
	}

	@RequestMapping(value = "/logout") // �α׾ƿ�
	public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
		return mv;
	}

	@RequestMapping(value = "/findId") // 아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/main/findId");
		return mv;
	}

	@RequestMapping(value = "/findIdResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/main/findIdResult");
		if (commandMap.get("type").equals("phone")) {
			Map<String, Object> map = loginService.findIdWithPhone(commandMap.getMap());
			mv.addObject("map", map);
			return mv;
		} else {
			Map<String, Object> map = loginService.findIdWithEmail(commandMap.getMap());
			mv.addObject("map", map);
			return mv;
		}
	}

	@RequestMapping(value = "/findPw") // 비밀번호 찾기 폼을 보여주는 메소드
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/main/findPw");
		return mv;
	}

	@RequestMapping(value = "/join/findPwConfirm")
	// 회원가입 할 경우 해당 이메일 인증을 요구하는 링크를 첨부한 이메일을 발송
	public ModelAndView sendNewPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/main/findPwConfirm");
		// mybatis로 inserMeber() 기능 처리 및 해당 이메일로 이메일 발송
		int eCheck = loginService.selectEmailCheck(commandMap.getMap());

		String tempPw = UUID.randomUUID().toString().replaceAll("-", ""); 
		tempPw = tempPw.substring(0, 10);

		if (eCheck > 0) {
			MailHandler sendMail = new MailHandler(mailSender);

			sendMail.setSubject("니내방 임시비밀번호입니다.");
			sendMail.setText(new StringBuffer().append("<h1>임시비밀번호<h1>")
					.append("회원님의 임시비밀번호는 {"
							+ tempPw/* .toString() */)
					.append("} 입니다. 로그인 후 새로운 비밀번호를 저장해주세요.").toString());
			sendMail.setFrom("ezenyoon@gmail.com", "니내방");
			sendMail.setTo(commandMap.getMap().get("mem_email").toString());
			sendMail.send();
		
			loginService.updateTempPw(tempPw);
		}

		mv.addObject("eCheck", eCheck);
		return mv;
	}
}
