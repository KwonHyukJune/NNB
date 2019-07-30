package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminRoomService {
	public List<Map<String, Object>>selectAdminRoomList(Map<String,Object>map)throws Exception;
	
	public Map<String,Object> detailRoom(Map<String,Object>map)throws Exception;
	
	public void updateAdminRoomStatus(Map<String,Object>map)throws Exception;
	
	public List<Map<String,Object>>selectAdminRoomTitle(Map<String, Object>map)throws Exception;
	public List<Map<String,Object>>selectAdminRoomContent(Map<String, Object>map)throws Exception;
	public List<Map<String,Object>>selectAdminRoomWriter(Map<String, Object>map)throws Exception;
	

}
    