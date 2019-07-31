package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import ezen.nnb.common.AbstractDAO;

public class RoomDAO extends AbstractDAO{

	public void insertRoomInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("room.insertRoomInfo1", map);
		insert("room.insertRoomInfo2", map);
		insert("room.insertRoomBoard", map);
	}

	public void insertRoomFile(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		insert("room.insertRoomFile", map);
		
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("room.updateHitCount", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomFileList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("room.selectRoomFileList", map);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRoomInfoDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("room.selectRoomInfoDetail", map);
	}

	public void deleteRoom(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		delete("room.deleteRoom",map);
	}

	

}
