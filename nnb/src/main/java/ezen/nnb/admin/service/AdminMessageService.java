package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminMessageService {
	public List<Map<String,Object>>adminMessageList(Map<String,Object>map)throws Exception;
	
	public Map<String,Object>adminMessageDetail(Map<String,Object>map)throws Exception;
	
	public void adminMessageWrite(Map<String,Object>map)throws Exception;
	
	public void adminMessageDelete(Map<String,Object>map)throws Exception;
	
	public List<Map<String,Object>> adminMessageSearchContent(String isSearch)throws Exception;
	
	public List<Map<String,Object>> adminMessageSearchTitle(String isSearch)throws Exception;
}
