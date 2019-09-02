package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("favoriteDAO")
public class FavoriteDAO extends AbstractDAO {

	public void deleteFavRoom(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		delete("favorite.deleteFavRoom",map);
	}

	public void updateFavCountDec(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("favorite.updateFavCountDec",map);
	}
	public void updateFavCountInc(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("favorite.updateFavCountInc",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoommateList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("favorite.selectFavRoommateList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFavRoomList(Object rn) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectPagingList("favorite.selectFavRoomList",rn);
	}
	public int countFavRoomList(Map<String, Object> map) throws Exception{
		return (int) selectOne("favorite.countFavRoomList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFavMateList(Object rn) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectPagingList("favorite.selectFavRoommateList",rn);
	}
	public int countFavMateList(Map<String, Object> map) throws Exception{
		return (int) selectOne("favorite.countFavRoommateList", map);
	}

	public void deleteFavRoommate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		delete("favorite.deleteFavRoommate",map);
	}
	@SuppressWarnings("unchecked")	
	public List<Map<String, Object>> selectFavRoom(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("favorite.selectFavRoom",map);
	}
	@SuppressWarnings("unchecked")	
	public List<Map<String, Object>> selectFavRoommate(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("favorite.selectFavRoommate",map);
	}

	public void addFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("favorite.addFavRoom", map);
	}

	public void cancelFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		delete("favorite.deleteFavRoommate", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecentRoomList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectPagingList("favorite.selectRecentRoom",map);
	}

	public void addFavRoommate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("favorite.addFavRoommate", map);
	}
	
}
