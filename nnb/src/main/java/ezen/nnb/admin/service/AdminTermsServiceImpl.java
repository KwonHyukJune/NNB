package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminTermsDAO;

@Service("adminTermsService")
public class AdminTermsServiceImpl implements AdminTermsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="adminTermsDAO")
	private AdminTermsDAO adminTermsDAO;
	@Override
	public List<Map<String, Object>> selectTermsList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminTermsDAO.selectTermsList(map);
	}

	@Override
	public void writeTerms(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminTermsDAO.writeTerms(map);
	}

	@Override
	public Map<String, Object> selectTermsDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminTermsDAO.selectTermsDetail(map);
	}

	@Override
	public void updateTermsModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminTermsDAO.updateTermsModify(map);
		
	}

	@Override
	public void deleteTerms(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminTermsDAO.deleteTerms(map);
	}

}