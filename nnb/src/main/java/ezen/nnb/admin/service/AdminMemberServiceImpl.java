package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminMemberDAO;

@Service("AdminMemberService")
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
	public List<Map<String, Object>> adminMemberSearch(Map<String, Object> map) throws Exception {
		return AdminMemberDAO.adminMemberSearch(map);
	}
	
}
