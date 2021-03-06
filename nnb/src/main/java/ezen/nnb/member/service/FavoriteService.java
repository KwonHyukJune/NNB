package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

public interface FavoriteService {

	void deleteFavRoom(Map<String, Object> map) throws Exception;

	void updateFavCountDec(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectRoommateList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectFavRoomList(Map<String, Object> map) throws Exception;

	void deleteFavRoommate(Map<String, Object> map) throws Exception;

	void addFavRoom(Map<String, Object> map) throws Exception;

	void cancelFavRoom(Map<String, Object> map) throws Exception;

	Map<String, Object> selectFavRoom(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectRecentRoomList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectFavRoommate(Map<String, Object> map) throws Exception;

	void addFavRoommate(Map<String, Object> map) throws Exception;

	int countFavRoomList(Map<String, Object> map) throws Exception;

	int countFavMateList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectFavMateList(Map<String, Object> map) throws Exception;

}
