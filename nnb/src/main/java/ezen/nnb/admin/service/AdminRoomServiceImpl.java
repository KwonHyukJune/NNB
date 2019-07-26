package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminRoomDAO;

	@Service("adminRoomService")
	public class AdminRoomServiceImpl implements AdminRoomService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminRoomDAO")
	private AdminRoomDAO adminRoomDAO;
	@Override
	public List<Map<String, Object>> selectRoomList(Map<String, Object> map) throws Exception {
	return adminRoomDAO.selectRoomList(map);
	}
@Override
	public void insertRoomWrite(Map<String, Object> map) throws Exception {
//	adminRoomDAO.detailRoom(map);
	}
	@Override
	public Map<String, Object> selectRoomDetail(Map<String, Object> map) throws Exception {
	Map<String, Object> resultMap = adminRoomDAO.selectRoomDetail(map);
	return resultMap;
	}
	@Override
	public void updateRoomModify(Map<String, Object> map) throws Exception {
	adminRoomDAO.updateRoomModify(map);
	}
	@Override
	public void deleteRoom(Map<String, Object> map) throws Exception {
	adminRoomDAO.deleteRoom(map);
	}

	
}


