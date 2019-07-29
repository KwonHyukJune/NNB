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
	@Resource(name="AdminLoginService")
	private AdminLoginService AdminLoginService;
	
	
	@RequestMapping(value="/admin/login")
    public ModelAndView adminloginform(CommandMap commandMap,HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("/admin/login/adminLogin");

		return mv;
		
	}
	public ModelAndView AdminLogin(CommandMap commandMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession();
		Map<String,Object>map=AdminLoginService.AdminLogin(commandMap.getMap());
		if(map!=null) {
			session.setAttribute("adminId","y");//?
			mv.addObject("adminJoin",map);
			mv.setViewName("/admin/main");
			}else {
				mv.setViewName("/admin/login");
				mv.addObject("message","해당아이디가 존재하지 않습니다");
			}
		return mv;
		}
	
	
	}


