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
	public List<Map<String, Object>> selectFavRoomList(Object rn) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("favorite.selectRoomList",rn);
	}

	public void deleteFavRoommate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		delete("favorite.deleteFavRoommate",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFavRoom(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String,Object>)selectOne("favorite.selectFavRoom",map);
	}


}
