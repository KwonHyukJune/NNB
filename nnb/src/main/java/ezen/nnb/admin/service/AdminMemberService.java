package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	public List<Map<String, Object>>adminMemberList(Map<String,Object>map)throws Exception;
	
	public Map<String,Object>adminMemberDetail(Map<String,Object>map)throws Exception;
	
	public void adminMemberBan(Map<String,Object>map)throws Exception;
	
	public List<Map<String,Object>>adminMemberSearchID(Map<String, Object>map)throws Exception;
	public List<Map<String,Object>>adminMemberSearchName(Map<String, Object>map)throws Exception;
	public List<Map<String,Object>>adminMemberSearchNICK(Map<String, Object>map)throws Exception;
	

}
