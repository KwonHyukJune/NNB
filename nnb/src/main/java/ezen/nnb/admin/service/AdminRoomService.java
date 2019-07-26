package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminRoomService {

	List<Map<String, Object>> selectRoomList(Map<String, Object> map) throws Exception;
	void insertRoomWrite(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectRoomDetail(Map<String, Object> map)throws Exception;
	void updateRoomModify(Map<String, Object> map) throws Exception;
	void deleteRoom(Map<String, Object> map) throws Exception;
}


