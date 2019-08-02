package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

public interface SearchRoomService {

	List<Map<String, Object>> selectRoomList(Map<String, Object> map) throws Exception;

	int countRoomList(Map<String, Object> map) throws Exception;	
}
