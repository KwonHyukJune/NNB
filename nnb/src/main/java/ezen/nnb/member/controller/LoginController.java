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
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView("/member/main/loginForm");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
		Map<String, Object> banChk = adminBanService.banDateCheck(commandMap.getMap());
		if (chk == null) { // ���̵� ���� ������
			mv.setViewName("/member/main/loginForm");
			mv.addObject("message", "�ش� ���̵� �����ϴ�.");
			return mv;

		} else { // ���̵� ���� ������
					// ��� ��й�ȣ�� �Է��� ��й�ȣ ���� ������
			if (chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) {
				if (chk.get("MEM_VERIFY").equals("Y")) {
					if (banChk == null || (int) banChk.get("EXP_DATE") <= 0) {
						session.setAttribute("MEM_ID", commandMap.get("MEM_ID")); // ���ǿ� ���̵� �־��
						mv.addObject("MEMBER", chk); //
						mv.setViewName("redirect:/main");
						return mv;
					} else {
						mv.setViewName("/main");
						mv.addObject("message", "ȸ������ " + banChk.get("BAN_REMOVAL_DATE") + " ����  �̿��� ���ѵǾ����ϴ�.");
						return mv;
					}
				} else {
					mv.setViewName("/main");
					mv.addObject("message", "�̸��� ������ �Ϸ����ּ���.");
					return mv;
				}

			} else { // ��й�ȣ Ʋ������
				mv.setViewName("loginForm");
				mv.addObject("message", "��й�ȣ�� Ȯ���� �ּ���.");
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
	/*
	 * public ModelAndView findId(CommandMap commandMap) throws Exception {
	 * ModelAndView mv = new ModelAndView(); }
	 */

}
