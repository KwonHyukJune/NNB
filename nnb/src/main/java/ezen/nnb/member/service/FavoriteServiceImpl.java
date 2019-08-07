package ezen.nnb.member.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.FavoriteDAO;

@Service("favoriteService")
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
		// TODO Auto-generated method stub // 내가 찜한 방 보기
		List<Map<String,Object>> FavRoom = null ; //FavRoom 리스트 객체 선언.
		List<Map<String,Object>> room=favoriteDAO.selectFavRoom(map); // 맵 객체에다가 내가 찜한 방의 방번호를 저장해준다.
		for(int i=0 ; i < room.size() ; i++) {
			String rn = (String)room.get(i).get("ROOM_NUM");		
			FavRoom = favoriteDAO.selectFavRoomList(rn); 
		}
		return FavRoom; //반복된 작업을 거친 favRoom 리스트 객체를 리턴.
	}
	@Override
	public void deleteFavRoommate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.deleteFavRoommate(map);
	}
	@Override
	public void addFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.addFavRoom(map);
	}
	@Override
	public void cancelFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.cancelFavRoom(map);
	}
	@Override
	public List<Map<String, Object>> selectFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return favoriteDAO.selectFavRoom(map);
	}

}
