package ezen.nnb.admin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminBanDAO")
public class AdminBanDAO extends AbstractDAO{

	public void insertBan(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		insert("ban.insertBan", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> banDateCheck(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("ban.selectBanDate", map);
	}

}
