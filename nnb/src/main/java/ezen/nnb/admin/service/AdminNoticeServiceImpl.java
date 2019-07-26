package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;  
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminNoticeDAO;

	@Service("adminNoticeService")
	public class AdminNoticeServiceImpl implements AdminNoticeService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminNoticeDAO")
	private AdminNoticeDAO adminNoticeDAO;
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
	return adminNoticeDAO.selectNoticeList(map);
	}
	@Override
	public void insertNoticeWrite(Map<String, Object> map) throws Exception {
	adminNoticeDAO.insertNoticeWrite(map);
	}
	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
	Map<String, Object> resultMap = adminNoticeDAO.selectNoticeDetail(map);
	return resultMap;
	}
	@Override
	public void updateNoticeModify(Map<String, Object> map) throws Exception {
	adminNoticeDAO.updateNoticeModify(map);
	}
	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
	adminNoticeDAO.deleteNotice(map);
	}
}


    