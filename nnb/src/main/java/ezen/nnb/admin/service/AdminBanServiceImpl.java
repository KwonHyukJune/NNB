package ezen.nnb.admin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminBanDAO;

@Service("adminBanService")
public class AdminBanServiceImpl implements AdminBanService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminBanDAO")
	private AdminBanDAO adminBanDAO;
	
	@Override
	public void insertBan(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminBanDAO.insertBan(map);
	}

	@Override
	public Map<String, Object> banDateCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBanDAO.banDateCheck(map);
	}

}
