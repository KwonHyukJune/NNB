package ezen.nnb.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			//로그인 상태가 아니면
			if(request.getSession().getAttribute("MEM_ID")==null) {
				//프로젝트의 contextpath + /needLogin.do 로 리다이렉트
				//localhost:8080/first/needLogin.do
				response.sendRedirect(request.getContextPath()+"/needLogin");
				return false;
			}else {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
