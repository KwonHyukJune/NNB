package ezen.nnb.admin.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminLoginService;
import ezen.nnb.common.CommandMap;

@Controller
public class AdminLoginController {
	@Resource(name="adminLoginService")
	private AdminLoginService adminLoginService;
	
	
	@RequestMapping(value="/admin/loginForm")
    public ModelAndView adminloginform(CommandMap commandMap,HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();	
		System.out.println("adminLogin"+commandMap.getMap());

		mv.setViewName("admin/login/adminLogin");

		return mv;
		
	}
	@RequestMapping(value="/adminLogin")
	public ModelAndView AdminLogin(CommandMap commandMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv=new ModelAndView();
		System.out.println("adminLoginForm"+commandMap.getMap());

		HttpSession session=request.getSession();
		Map<String,Object>map=adminLoginService.AdminLogin(commandMap.getMap());
		if(map!=null) {
			System.out.println("ff");
			session.setAttribute("ADMIN_ID", commandMap.get("ADMIN_ID"));
			mv.setViewName("/admin/main/adminMain");
		}else {
			mv.setViewName("/admin/login/adminLogin");
		}
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





