package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import ezen.nnb.common.AbstractDAO;

public class FavoriteDAO extends AbstractDAO {

	public void deleteFavRoom(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		delete("favorite.deleteFavRoom",map);
	}

	public void updateFavCountDec(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("favorite.updateFavCountDec",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoommateList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("favorite.selectRoommateList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFavRoomList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("favorite.selectRoomList",map);
	}

	public void deleteFavRoommate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		delete("favorite.deleteFavRoommate",map);
	}


}
