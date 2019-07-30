package ezen.nnb.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public Map<String, Object> selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectIdCheck(map);
	}

	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertMember(map);
	}

	@Override
	public void verifyMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.verifyMember(map);
	}

}
