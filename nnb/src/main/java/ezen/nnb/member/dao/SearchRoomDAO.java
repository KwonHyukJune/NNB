package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("searchRoomDAO")
public class SearchRoomDAO extends AbstractDAO {
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectPagingList("searchRoom.selectRoomList",map);
	}
	public int countRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (int)selectOne("searchRoom.countRoomList",map);
	}
}
