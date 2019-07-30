package ezen.nnb.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminBanService;
import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.LoginService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "adminBanService")
	private AdminBanService adminBanService;

	// Login Form
	@RequestMapping(value = "/loginForm")
	public ModelAndView loginForm() throws Exception {
		ModelAndView mv = new ModelAndView("/member/main/loginForm");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
		Map<String, Object> banChk = adminBanService.banDateCheck(commandMap.getMap());
		if (chk == null) { // 아이디가 있는지 없는지를 확인
			mv.setViewName("/member/main/loginForm");
			mv.addObject("message", "해당 아이디가 존재하지 않습니다.");
			return mv;

		} else { 
			if (chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) {
				if (chk.get("MEM_VERIFY").equals("Y")) { //이메일 인증을 했을ㄸ ㅐ
					if (banChk == null || (int) banChk.get("EXP_DATE") <= 0) {// 모든 조건을 충족시키면 로그인!
						session.setAttribute("MEM_ID", commandMap.get("MEM_ID")); // ���ǿ� ���̵� �־��
						mv.addObject("MEMBER", chk); //
						mv.setViewName("redirect:/main");
						return mv;
					} else { //제재기한이 아직 남았을 때
						mv.setViewName("/main");
						mv.addObject("message", "회원님은" + banChk.get("BAN_REMOVAL_DATE") + "까지 이용이 제재되었습니다.");
						return mv;
					}
				} else { // 이메일 인증을 완료하지 않았을 떄
					mv.setViewName("/main");
					mv.addObject("message", "이메일 인증을 완료해주세요.");
					return mv;
				}

			} else { //비밀번호가 일치하지 않을 때
				mv.setViewName("loginForm");
				mv.addObject("message", "비밀번호가 맞지 않습니다.");
				return mv;
			}
		}
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
	
	@RequestMapping(value="/findId") //아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/main/findId"); 
		return mv;
	}	
	
	@RequestMapping(value="/findIdResult", method=RequestMethod.POST) //입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/main/findIdResult");
		if(commandMap.get("type").equals("phone")) {
			Map<String, Object> map = loginService.findIdWithPhone(commandMap.getMap());
			mv.addObject("map", map);
			return mv;
		}else {
			Map<String, Object> map = loginService.findIdWithEmail(commandMap.getMap());
			mv.addObject("map", map);
			return mv;
		}
	}
	
	@RequestMapping(value="/findPw") //아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/main/findPwConfirm"); 
		return mv;
	}	
	
	
}
