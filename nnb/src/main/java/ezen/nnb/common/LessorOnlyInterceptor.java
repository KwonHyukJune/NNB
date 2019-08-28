package ezen.nnb.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LessorOnlyInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			//일반 회원이면 접근 불가!!!
			if(request.getSession().getAttribute("MEM_KIND").equals("normal")) {
				response.sendRedirect(request.getContextPath()+"/lessorOnly");
				return false;
			}else {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return super.preHandle(request, response, handler);
	}
//
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
		}
}