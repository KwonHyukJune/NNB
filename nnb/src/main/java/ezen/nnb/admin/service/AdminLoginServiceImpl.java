package ezen.nnb.admin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminLoginDAO;

@Service("adminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService{

	@Resource(name="AdminLoginDAO")
	private AdminLoginDAO AdminLoginDao;
	
	@Override
	public Map<String,Object> AdminLogin(Map<String,Object>map) throws Exception{
		return (Map<String, Object>) AdminLoginDao.AdminLogin(map);
	}

	
}
