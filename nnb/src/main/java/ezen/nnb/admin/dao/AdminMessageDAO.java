package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;

@Repository("adminMessageDAO")
public class AdminMessageDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMessageList(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectPagingList("message.adminMessageList",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object>adminMessageDetail(Map<String,Object>map)throws Exception{
		return(Map<String,Object>)selectOne("message.adminMessageDetail",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>selectMemberByType(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectList("message.selectMemberByType",map);
	}
	public void adminMessageWrite(Map<String,Object>map)throws Exception{
		if(map.get("forAll").equals("all")) {
			insert("message.adminAllMessageWrite",map);
		}else {
			insert("message.adminMessageWrite",map);
		}
	}
	public void adminMessageDelete(Map<String,Object>map)throws Exception{
		delete("message.adminMessageDelete",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMessageSearchContent(String isSearch)throws Exception{
		return(List<Map<String,Object>>)selectList("message.adminMessageSearchContent",isSearch);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMessageSearchTitle(String isSearch)throws Exception{
		return(List<Map<String,Object>>)selectList("message.adminMessageSearchTitle",isSearch);
	}
	
}
