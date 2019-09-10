package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminFaqDAO;
import ezen.nnb.admin.dao.AdminReportDAO;

@Service("adminReportService")
public class AdminReportServiceImpl implements AdminReportService{
	

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminReportDAO")
	private AdminReportDAO adminReportDAO;
	@Override
	public void updateRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminReportDAO.updateRoom(map);
	}
	@Override
	public List<Map<String, Object>> selectReportRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportRoomList(map);
	}

	@Override
	public List<Map<String, Object>> selectReportMateList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportMateList(map);
	}

	@Override
	public void deleteRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminReportDAO.deleteRoom(map);
	}
	@Override
	public Map<String, Object> selectReportRoomDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportRoomDetail(map);
	}
	
	@Override
	public Map<String, Object> selectReportMateDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportMateDetail(map);
	}

	


}