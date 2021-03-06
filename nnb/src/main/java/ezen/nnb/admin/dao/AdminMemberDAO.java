package ezen.nnb.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMemberList(Map<String,Object>map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("member.adminMemberList",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception{
		Map<String,Object> res = new HashMap<String,Object>();
		res.putAll((Map<String,Object>)selectOne("member.adminMemberDetail",map));
		Map<String,Object> map2 = (Map<String,Object>)selectOne("member.adminMemberRoommateDetail",map);
		if(map2!=null) {
			res.putAll((Map<String,Object>)selectOne("member.adminMemberRoommateDetail",map));
		}
		return res;
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMemberBanDetail(Map<String,Object>map)throws Exception{
		return(List<Map<String,Object>>)selectList("member.adminMemberBanDetail",map);
	} 

	@SuppressWarnings("unchecked")
	public Map<String,Object> adminMemberBan(Map<String, Object> map) throws Exception {
		return (Map<String,Object>)selectOne("member.adminMemberBan", map);
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
