package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminMemberDAO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	@Resource(name="AdminMemberDAO")
	private AdminMemberDAO AdminMemberDAO;
	@Override
	public List<Map<String,Object>>adminMemberList(Map<String,Object>map)throws Exception{
		return AdminMemberDAO.adminMemberList(map);
	}
	@Override
	public Map<String,Object>adminMemberDetail(Map<String,Object>map)throws Exception{
		return (Map<String, Object>)AdminMemberDAO.adminMemberDetail(map);
	}
	@Override
	public void adminMemberBan(Map<String, Object> map) throws Exception {
		AdminMemberDAO.adminMemberBan(map);
		
	}
	@Override
	public List<Map<String, Object>> adminMemberSearchID(Map<String, Object> map) throws Exception {
		return AdminMemberDAO.adminMemberSearchID(map);
	}
	@Override
	public List<Map<String, Object>> adminMemberSearchName(Map<String, Object> map) throws Exception {
		return AdminMemberDAO.adminMemberSearchName(map);
	}
	@Override
	public List<Map<String, Object>> adminMemberSearchNICK(Map<String, Object> map) throws Exception {
		return AdminMemberDAO.adminMemberSearchNICK(map);
	}
	
}
