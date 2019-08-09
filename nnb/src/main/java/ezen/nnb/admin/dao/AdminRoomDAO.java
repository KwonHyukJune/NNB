
package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminRoomDAO")
public class AdminRoomDAO extends AbstractDAO{

	//관리자 방 목록
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>selectAdminRoomList(Map<String,Object>map) throws Exception{
		return (List<Map<String,Object>>)selectList("adminRoom.selectAdminRoomList",map);
	}
	//관리자 방 상세
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdminRoomDetail(Map<String, Object> map) {
		return (Map<String,Object>) selectOne("adminRoom.selectAdminRoomDetail",map);
	}
	//회원이 보는 방으로 연결
	@SuppressWarnings("unchecked")
	public Map<String, Object> detailRoom(Map<String, Object> map) throws Exception{
		return (Map<String,Object>) selectOne("room.detailRoom",map);
	}
	
	public void updateAdminRoomStatus(Map<String, Object> map) throws Exception {
		update("adminRoom.updateAdminRoomStatus", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminRoomA(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminRoom.selectAdminRoomA", map);
	}  
	
	@SuppressWarnings("unchecked")
	public void deleteRoom(Map<String, Object> map) throws Exception {
		delete("adminRoom.delectAdminRoom",map);
	}
	
	

	

}