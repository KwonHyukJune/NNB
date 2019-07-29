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
	public List<Map<String, Object>> selectReportRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportRoomList(map);
	}

	@Override
	public List<Map<String, Object>> selectReportMemberList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportMemberList(map);
	}

	@Override
	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminReportDAO.selectReportDetail(map);
	}
}