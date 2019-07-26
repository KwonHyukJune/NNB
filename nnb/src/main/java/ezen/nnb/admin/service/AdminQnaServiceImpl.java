package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminQnaDAO;

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="adminQnaDAO")
	private AdminQnaDAO adminQnaDAO;
	
	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminQnaDAO.selectQnaList(map);
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminQnaDAO.selectQnaDetail(map);
	}

}
