package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import ezen.nnb.member.dao.FavoriteDAO;

public class FavoriteServiceImpl implements FavoriteService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="favoriteDAO")
	private FavoriteDAO favoriteDAO;
	
	@Override
	public void deleteFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.deleteFavRoom(map);
	}
	@Override
	public void updateFavCountDec(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.updateFavCountDec(map);
	}
	@Override
	public List<Map<String, Object>> selectRoommateList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return favoriteDAO.selectRoommateList(map);
	}
	@Override
	public List<Map<String, Object>> selectFavRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return favoriteDAO.selectFavRoomList(map);
	}
	@Override
	public void deleteFavRoommate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.deleteFavRoommate(map);
	}

}
