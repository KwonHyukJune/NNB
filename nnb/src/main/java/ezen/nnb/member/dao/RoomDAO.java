package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("roomDAO")
public class RoomDAO extends AbstractDAO{


	@SuppressWarnings("unchecked") //내방 보기 리스트
	public List<Map<String, Object>> selectAdminRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("room.selectAdminRoomList", map);
	}

	// 내방 정보 등록하기 
	public void insertRoomInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("room.insertRoomInfo1", map);
		insert("room.insertRoomInfo2", map);
		insert("room.insertRoomBoard", map);
	}
	// 내방 이미지 등록하기
	public void insertRoomFile(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		insert("room.insertRoomFile", map);
		
	}
	//조회수 올리기
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("room.updateHitCount", map);
		
	}
	
	//방 이미지 불러오기.
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomFileList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("room.selectRoomFileList", map);

	}
	
	//방 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRoomInfoDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>)selectOne("room.selectRoomInfoDetail", map);
	}
	// 방 DEL_GB 업데이트하기
	public void deleteRoom(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("room.deleteRoom",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdminRoomCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("room.selectAdminRoomCount");
	}

	public void updateReAdRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("room.updateReAdRoom",map);
	}

	public void updateSoldRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("room.updateSoldRoom",map);
	}

}
