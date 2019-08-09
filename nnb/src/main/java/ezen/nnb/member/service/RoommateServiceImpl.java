package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.RoommateDAO;

@Service("roommateService")
public class RoommateServiceImpl implements RoommateService {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="roommateDAO")
	private RoommateDAO roommateDAO;
	
	@Override
	public Map<String, Object> openRoommateDetail(Map<String,Object>map) throws Exception {
		return roommateDAO.openRoommatesDetail(map);
	}

	@Override
	public void registProfile(Map<String, Object> map) throws Exception {
		roommateDAO.registMyProfile(map);
	}

	@Override
	public void myProfileModify(Map<String, Object> map) throws Exception {
		roommateDAO.myProfileModify(map);

	}

	@Override
	public void myProfileDelete(Map<String, Object> map) throws Exception {
		roommateDAO.myProfileDelete(map);
	}

	@Override
	public List<Map<String, Object>> searchRoommate(Map<String, Object> map) throws Exception {
		return roommateDAO.searchRoommate(map);
	}

	@Override
	public int countRoommate(Map<String, Object> map) throws Exception {
		return roommateDAO.countRoommate(map);
	}

	@Override
	public void listAddFavRoommate(Map<String, Object> map) throws Exception {
		roommateDAO.listAddFavRoommate(map);
	}

	@Override
	public void listDeleteFavRoommate(Map<String, Object> map) throws Exception {
		roommateDAO.listDeleteFavRoommate(map);
		
	}

	@Override
	public void detailAddFavRoommate(Map<String, Object> map) throws Exception {
		roommateDAO.detailAddFavRoommate(map);
	}

	@Override
	public void detailDeleteFavRoommate(Map<String, Object> map) throws Exception {
		roommateDAO.detailDeleteFavRoommate(map);
	}

	@Override
	public void messageWrite(Map<String, Object> map) throws Exception {
		roommateDAO.messageWrite(map);
		
	}

}
