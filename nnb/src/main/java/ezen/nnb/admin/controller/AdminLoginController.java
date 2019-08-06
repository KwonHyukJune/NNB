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
	
	
	@RequestMapping(value="/admin/login")
    public ModelAndView adminloginform(CommandMap commandMap,HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();	
		System.out.println("adminLogin"+commandMap.getMap());

		mv.setViewName("/admin/login/adminLogin");

		return mv;
		
	}
	@RequestMapping(value="/admin/main")
	public ModelAndView AdminLogin(CommandMap commandMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv=new ModelAndView();
		System.out.println("adminLoginForm"+commandMap.getMap());

		HttpSession session=request.getSession();
		Map<String,Object>map=adminLoginService.AdminLogin(commandMap.getMap());
		if(map!=null) {
			if(session.getAttribute("ADMIN_ID")==null){
			mv.addObject("admin",map);
			mv.setViewName("redirect:/admin/main/adminMain");
			}}else {
				mv.setViewName("/admin/login/adminLogin");
			}
		return mv;
		}
	
	@RequestMapping(value="/admin/logout")
	public ModelAndView logout(HttpServletRequest request,CommandMap commandMap) {
		HttpSession session=request.getSession(false);
		session.invalidate();
		ModelAndView mv=new ModelAndView("redirect:/main");
		return mv;
	}
}




