package ezen.nnb.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.RoommateDAO;

@Service("roommateService")
public class RoommateServiceImpl implements RoommateService {

	@Resource(name="roommateDAO")
	private RoommateDAO roommateDAO;
	
	@Override
	public Map<String, Object> openRoommateDetail(Map<String,Object>map) throws Exception {
		return roommateDAO.myProfile(map);
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

}
