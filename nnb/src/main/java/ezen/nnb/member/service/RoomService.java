package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface RoomService {

	public void insertRoom(Map<String, Object> map, HttpServletRequest request) throws Exception;

	public Map<String, Object> selectRoomDetail(Map<String, Object> map) throws Exception;

	public void deleteRoom(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectAdminRoomList(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectAdminRoomCount(Map<String, Object> map) throws Exception;

	public void updateReAdRoom(Map<String, Object> map) throws Exception;

	public void updateSoldRoom(Map<String, Object> map) throws Exception;



}
