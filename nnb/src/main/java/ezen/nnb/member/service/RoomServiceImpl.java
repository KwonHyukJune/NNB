package ezen.nnb.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.RoomDAO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Resource(name="roomDAO")
	private RoomDAO roomDAO;
	
	@Override
	public void insertRoomInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		roomDAO.insertRoomInfo(map);
	}

}
