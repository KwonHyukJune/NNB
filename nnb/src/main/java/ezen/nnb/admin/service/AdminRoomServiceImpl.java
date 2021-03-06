package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminRoomDAO;

@Service("adminRoomService")
public class AdminRoomServiceImpl implements AdminRoomService{
	@Resource(name="adminRoomDAO")
	private AdminRoomDAO AdminRoomDAO;
	@Override
	public List<Map<String,Object>> selectAdminRoomList (Map<String,Object>map)throws Exception{
		return AdminRoomDAO.selectAdminRoomList(map);
	}
	@Override
	public Map<String, Object>selectAdminRoomDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return AdminRoomDAO.selectAdminRoomDetail(map);
	}
	@Override
	public Map<String,Object>detailRoom(Map<String,Object>map)throws Exception{
		return (Map<String, Object>)AdminRoomDAO.detailRoom(map);
	}
	@Override
	public void updateAdminRoomStatus(Map<String, Object> map) throws Exception {
		AdminRoomDAO.updateAdminRoomStatus(map);
		
	}
	@Override
	public List<Map<String, Object>> selectAdminRoomA(Map<String, Object> map) throws Exception {
		return AdminRoomDAO.selectAdminRoomA(map);
	}
		
	@Override
	public void deleteRoom(Map<String, Object> map) throws Exception {
		AdminRoomDAO.deleteRoom(map);
	}

	
}   