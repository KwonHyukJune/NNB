package ezen.nnb.admin.dao;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;

@Repository("RoomRoomDAO")
public class AdminRoomDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoomList(Map<String, Object> map)throws Exception{
	return (List<Map<String,Object>>)selectList("room.selectRoomList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRoomDetail(Map<String, Object> map) throws Exception{
	return (Map<String,Object>)selectOne("room.detailRoom",map);
	}
		
	public void updateRoomModify(Map<String, Object> map) throws Exception{
	update("room.updateRoom",map);
	}
	
	public void deleteRoom(Map<String, Object> map) throws Exception {
	delete("room.deleteRoom",map);
	}
} 

