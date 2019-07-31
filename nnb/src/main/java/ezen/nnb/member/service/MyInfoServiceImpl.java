package ezen.nnb.member.service;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminTermsDAO;
import ezen.nnb.member.dao.MyInfoDAO;

@Service("infoService")
public class MyInfoServiceImpl implements MyInfoService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="infoDAO")
	private MyInfoDAO myPageDAO;
	
	@Override
	public Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception {
	return myPageDAO.selectMyInfoDetail(map);
	}	
	@Override
	public void updateMyInfoModify(Map<String, Object> map) throws Exception {
		myPageDAO.updateMyInfoModify(map);
	}
	@Override
	public void deleteMyInfo(Map<String, Object> map) throws Exception {
		myPageDAO.deleteMyInfo(map);
	}
		
}  