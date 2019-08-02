package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.FavoriteDAO;
import ezen.nnb.member.dao.SearchRoomDAO;

@Service("searchRoomService")
public class SearchRoomServiceImpl implements SearchRoomService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="searchRoomDAO")
	private SearchRoomDAO searchRoomDAO;
	@Resource(name="FavoriteDAO")
	private FavoriteDAO favoriteDAO;
	
	@Override
	public List<Map<String, Object>> selectRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return searchRoomDAO.selectRoomList(map);
	}
	
	@Override
	public int countRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return searchRoomDAO.countRoomList(map);
	}
}
