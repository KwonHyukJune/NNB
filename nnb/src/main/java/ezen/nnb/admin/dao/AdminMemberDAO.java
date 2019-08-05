package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMemberList(Map<String,Object>map) throws Exception{
		return (List<Map<String,Object>>)selectList("member.adminMemberList",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception{
		
		return (Map<String,Object>) selectOne("member.adminMemberDetail",map);
	}

	public void adminMemberBan(Map<String, Object> map) throws Exception {
		update("member.adminMemberBan", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminMemberSearchID(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.adminMemberSearchID", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminMemberSearchName(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.adminMemberSearchName", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminMemberSearchNICK(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("member.adminMemberSearchNICK", map);
	}
	

}
