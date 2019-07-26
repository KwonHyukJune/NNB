package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminMessageDAO;

@Service("adminMessageService")
public class AdminMessageServiceImpl implements AdminMessageService{

	@Resource(name="AdminMessageDAO")
	private AdminMessageDAO AdminMessageDAO;

	@Override
	public List<Map<String, Object>> adminMessageList(Map<String, Object> map) throws Exception {
		
		return AdminMessageDAO.adminMessageList(map);
	}

	@Override
	public Map<String, Object> adminMessageDetail(Map<String, Object> map) throws Exception {
		
		return AdminMessageDAO.adminMessageDetail(map);
	}

	@Override
	public void adminMessageWrite(Map<String, Object> map) throws Exception {
		AdminMessageDAO.adminMessageWrite(map);
	}

	@Override
	public void adminMessageDelete(Map<String, Object> map) throws Exception {
		AdminMessageDAO.adminMessageDelete(map);
	}

	@Override
	public List<Map<String, Object>> adminMessageSearchContent(Map<String, Object> map) throws Exception {

		return AdminMessageDAO.adminMessageSearchContent(map);
	}

	@Override
	public List<Map<String, Object>> adminMessageSearchTitle(Map<String, Object> map) throws Exception {
		return AdminMessageDAO.adminMessageSearchTitle(map);
	}
	
}
