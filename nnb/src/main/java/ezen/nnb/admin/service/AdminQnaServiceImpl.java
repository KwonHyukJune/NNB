package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import ezen.nnb.admin.dao.AdminQnaDAO;

public class AdminQnaServiceImpl implements AdminQnaService{

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminQnaDAO.selectQnaList(map);
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminQnaDAO.selectQnaDetail(map);
	}

}
