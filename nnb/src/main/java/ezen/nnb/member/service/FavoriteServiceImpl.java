package ezen.nnb.member.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	public List<Map<String, Object>> selectRecentRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return favoriteDAO.selectRecentRoomList(map);
	}
	
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
		List<Map<String,Object>> room=favoriteDAO.selectFavRoom(map); // 맵 객체에다가 내가 찜한 방의 방번호를 저장해준다.
		List<Map<String,Object>> FavRoom = new ArrayList<Map<String,Object>>();
		if(room.size()==0) return FavRoom;
		map.put("ROOM_NUM",room);
		return favoriteDAO.selectFavRoomList(map); //반복된 작업을 거친 favRoom 리스트 객체를 리턴.
	}
	@Override
	public int countFavRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub // 내가 찜한 방 보기
		return favoriteDAO.countFavRoomList(map); //반복된 작업을 거친 favRoom 리스트 객체를 리턴.
	}
	@Override
	public List<Map<String, Object>> selectFavMateList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub // 내가 찜한 방 보기
		List<Map<String,Object>> mate=favoriteDAO.selectFavRoommate(map); // 맵 객체에다가 내가 찜한 방의 방번호를 저장해준다.
		List<Map<String,Object>> FavMate = new ArrayList<Map<String,Object>>();
		if(mate.size()==0) return FavMate;
		map.put("MATE_ID",mate);
		return favoriteDAO.selectFavMateList(map); //반복된 작업을 거친 favRoom 리스트 객체를 리턴.
	}
	@Override
	public int countFavMateList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub // 내가 찜한 방 보기
		return favoriteDAO.countFavMateList(map); //반복된 작업을 거친 favRoom 리스트 객체를 리턴.
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
		favoriteDAO.updateFavCountInc(map);
	}
	@Override
	public void addFavRoommate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.addFavRoommate(map);
	}
	@Override
	public void cancelFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		favoriteDAO.cancelFavRoom(map);
	}
	@Override
	public Map<String, Object> selectFavRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String,Object>> room=favoriteDAO.selectFavRoom(map);
		Map<String,Object> temp_map = new HashMap<String,Object>();
		for(int i=0 ; i < room.size() ; i++) {
			String rn = String.valueOf(room.get(i).get("ROOM_NUM"));
			temp_map.put(rn,"ROOM_NUM");
		}
		return temp_map;
	}
	@Override
	public Map<String, Object> selectFavRoommate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String,Object>> roommate=favoriteDAO.selectFavRoommate(map);
		Map<String,Object> temp_map = new HashMap<String,Object>();
		for(int i=0 ; i < roommate.size() ; i++) {
			String rn = String.valueOf(roommate.get(i).get("RI_MEM_ID"));
			temp_map.put(rn,"RI_MEM_ID");
		}
		return temp_map;
	}
}
