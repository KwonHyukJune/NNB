package ezen.nnb.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectId(map);
	}

	@Override
	public Map<String, Object> findIdWithPhone(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findIdWithPhone(map);
	}

	@Override
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findIdWithEmail(map);
	}

}
