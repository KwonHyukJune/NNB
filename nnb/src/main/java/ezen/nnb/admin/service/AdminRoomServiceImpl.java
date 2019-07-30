package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;
 
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminRoomDAO;

@Service("AdminRoomService")
public class AdminRoomServiceImpl implements AdminRoomService{
	@Resource(name="AdminRoomDAO")
	private AdminRoomDAO AdminRoomDAO;
	@Override
	public List<Map<String,Object>> selectAdminRoomList (Map<String,Object>map)throws Exception{
		return AdminRoomDAO.selectAdminRoomList(map);
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
	public List<Map<String, Object>> selectAdminRoomTitle(Map<String, Object> map) throws Exception {
		return AdminRoomDAO.selectAdminRoomTitle(map);
	}
	@Override
	public List<Map<String, Object>> selectAdminRoomContent(Map<String, Object> map) throws Exception {
		return AdminRoomDAO.selectAdminRoomContent(map);
	}
	@Override
	public List<Map<String, Object>> selectAdminRoomWriter(Map<String, Object> map) throws Exception {
		return AdminRoomDAO.selectAdminRoomWriter(map);
	}
	
} 