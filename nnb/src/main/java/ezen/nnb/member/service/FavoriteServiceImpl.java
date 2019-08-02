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
		// TODO Auto-generated method stub
		List<Map<String,Object>> FavRoom = null ; //FavRoom 리스트 객체 선언.
		Map<String,Object> room=favoriteDAO.selectFavRoom(map); // 맵 객체에다가 내가 찜한 방의 방번호를 저장해준다.
		Iterator iter=room.keySet().iterator(); // 이터레이터를 사용해서 키 이름만 꺼내와서 그걸 iter 에 저장해준다.
		while(iter.hasNext()) {//키가 더 이상 없을 때까지 반복
			String s=(String)iter.next(); //꺼내온 키에 대한 값을 s 에 저장. 그러므로 s 는 방번호를 가지고 있다.
			int rn = (int)room.get(s);
			FavRoom = favoriteDAO.selectFavRoomList(rn); //s에 들어있는 방 번호를 이용해서 특정 방에 대한 간략정보를 가져와서 favRoom 에 저장.
			System.out.println(FavRoom);
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

}
