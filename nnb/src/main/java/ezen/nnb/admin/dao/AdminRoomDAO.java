
package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("AdminRoomDAO")
public class AdminRoomDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>selectAdminRoomList(Map<String,Object>map) throws Exception{
		return (List<Map<String,Object>>)selectList("adminRoom.selectAdminRoomList",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> detailRoom(Map<String, Object> map) throws Exception{
		return (Map<String,Object>) selectOne("room.detailRoom",map);
	}

	public void updateAdminRoomStatus(Map<String, Object> map) throws Exception {
		update("adminRoom.updateAdminRoomStatus", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminRoomTitle(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminRoom.selectAdminRoomTitle", map);
	}  
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminRoomContent(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminRoom.selectAdminRoomContent", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminRoomWriter(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminRoom.selectAdminRoomWriter", map);
	}
	@SuppressWarnings("unchecked")
	public void deleteRoom(Map<String, Object> map) throws Exception {
		delete("adminRoom.delectAdminRoom",map);
	}
	

}