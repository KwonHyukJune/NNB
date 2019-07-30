package ezen.nnb.member.dao;

import java.util.Map;

import ezen.nnb.common.AbstractDAO;

public class RoomDAO extends AbstractDAO{

	public void insertRoomInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("room.insertRoomInfo1", map);
		insert("room.insertRoomInfo2", map);
		insert("room.insertRoomBoard", map);
	}


}
