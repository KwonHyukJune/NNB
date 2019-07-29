package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminMessageDAO;

@Service("adminMessageService")
public class AdminMessageServiceImpl implements AdminMessageService{

	@Resource(name="adminMessageDAO")
	private AdminMessageDAO adminMessageDAO;

	@Override
	public List<Map<String, Object>> adminMessageList(Map<String, Object> map) throws Exception {
		
		return adminMessageDAO.adminMessageList(map);
	}    

	@Override
	public Map<String, Object> adminMessageDetail(Map<String, Object> map) throws Exception {
		
		return adminMessageDAO.adminMessageDetail(map);
	}

	@Override
	public void adminMessageWrite(Map<String, Object> map) throws Exception {
		adminMessageDAO.adminMessageWrite(map);
	}

	@Override
	public void adminMessageDelete(Map<String, Object> map) throws Exception {
		adminMessageDAO.adminMessageDelete(map);
	}

	@Override
	public List<Map<String, Object>> adminMessageSearchContent(Map<String, Object> map) throws Exception {

		return adminMessageDAO.adminMessageSearchContent(map);
	}

	@Override
	public List<Map<String, Object>> adminMessageSearchTitle(Map<String, Object> map) throws Exception {
		return adminMessageDAO.adminMessageSearchTitle(map);
	}
	
}
