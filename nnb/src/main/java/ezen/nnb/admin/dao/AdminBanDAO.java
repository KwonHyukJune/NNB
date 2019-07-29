package ezen.nnb.admin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminBanDAO")
public class AdminBanDAO extends AbstractDAO{

	public void insertBan(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("ban.insertBan", map);
	}

}
