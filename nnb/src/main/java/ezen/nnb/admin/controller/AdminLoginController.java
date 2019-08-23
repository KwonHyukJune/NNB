package ezen.nnb.admin.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminLoginService;
import ezen.nnb.common.CommandMap;

@Controller
public class AdminLoginController {
	@Resource(name="adminLoginService")
	private AdminLoginService adminLoginService;
	
	@RequestMapping(value="/admin/main")
	public ModelAndView adminMain(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin/main/adminMain");
		return mv;
	}
	
	@RequestMapping(value="/admin/loginForm")
    public ModelAndView adminloginform(CommandMap commandMap,HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();	

		mv.setViewName("admin/login/adminLogin");

		return mv;
		
	}
	@RequestMapping(value="/adminLogin", method = RequestMethod.POST)
	public ModelAndView AdminLogin(CommandMap commandMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv=new ModelAndView("/admin/login/login");
		String message = "";
		String url = "";

		HttpSession session=request.getSession();
		Map<String,Object>map=adminLoginService.AdminLogin(commandMap.getMap());
		if(map!=null) {
			session.setAttribute("ADMIN_ID", commandMap.get("ADMIN_ID"));
			url = "/admin/main";
		}else {
			message = "아이디 또는 비밀번호가 틀렸습니다.";
		}
		mv.addObject("message",message);
		mv.addObject("url",url);

		return mv;
	}
	
	@RequestMapping(value="/admin/logout")
	public ModelAndView logout(HttpServletRequest request,CommandMap commandMap) {
		HttpSession session=request.getSession(false);
		session.invalidate();
		ModelAndView mv=new ModelAndView("redirect:/admin/loginForm");
		return mv;
	}
	
	@RequestMapping("/needAdminLogin")
	//로그인 인터셉터
	public ModelAndView needLogin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/login/login");
		String message = "관리자 로그인이 필요한 서비스입니다.";
		String url = "/admin/loginForm";
		mv.addObject("message",message);
		mv.addObject("url",url);
		return mv;
	}
	
}





