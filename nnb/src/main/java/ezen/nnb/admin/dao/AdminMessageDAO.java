package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;

@Repository("adminMessageDAO")
public class AdminMessageDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMessageList(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectList("adminMessage.adminMessageList",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object>adminMessageDetail(Map<String,Object>map)throws Exception{
		return(Map<String,Object>)selectOne("adminMessage.adminMessageDetail",map);
	}
	public void adminMessageWrite(Map<String,Object>map)throws Exception{
		insert("adminMessage.adminMessageWrite",map);
	}
	public void adminMessageDelete(Map<String,Object>map)throws Exception{
		delete("adminMessage.adminMessageDelete",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMessageSearchContent(Map<String,Object>map)throws Exception{
		return(List<Map<String,Object>>)selectList("adminMessage.adminMessageSearchContent",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>adminMessageSearchTitle(Map<String,Object>map)throws Exception{
		return(List<Map<String,Object>>)selectList("adminMessage.adminMessageSearchTitle",map);
	}
	
}
