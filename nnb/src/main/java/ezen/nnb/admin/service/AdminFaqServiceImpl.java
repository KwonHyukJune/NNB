package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import ezen.nnb.admin.dao.AdminFaqDAO;

@Service("adminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminFaqDAO")
	private AdminFaqDAO adminFaqDAO;
	
	@Override
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminFaqDAO.selectFaqList(map);
	}

	@Override
	public void writeFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminFaqDAO.writeFaq(map);
	}

	@Override
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminFaqDAO.selectFaqDetail(map);
	}

	@Override
	public void updateFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminFaqDAO.updateFaq(map);
		
	}

	@Override
	public void deleteFaq(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminFaqDAO.deleteFaq(map);
	}

}
