package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.IgnoreDAO;

@Service("ignoreService")
public class IgnoreServiceImpl implements IgnoreService{

	Logger log = Logger.getLogger(this.getClass());
	@Resource(name="ignoreDAO")
	private IgnoreDAO ignoreDAO;
	
	@Override
	public int countIgnoreUserList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return ignoreDAO.countIgnoreUserList(map);
	}
	@Override
	public List<Map<String, Object>> selectIgnoreUserList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return ignoreDAO.selectIgnoreUserList(map);
	}
	@Override
	public void insertIgnore(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		ignoreDAO.insertIgnore(map);
	}
	@Override
	public void deleteIgnore(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		ignoreDAO.deleteIgnore(map);
	}
}
