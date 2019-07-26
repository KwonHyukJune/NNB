package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import ezen.nnb.admin.dao.AdminFaqDAO;
import ezen.nnb.admin.dao.AdminReportDAO;

public class AdminReportServiceImpl implements AdminReportService{
	
	@Resource(name="adminReportDAO")
	private AdminReportDAO adminReportDAO;
	
	@Override
	public List<Map<String, Object>> selectReportRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportRoomList(map);
	}

	@Override
	public List<Map<String, Object>> selectReportMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportMemberList(map);
	}
}