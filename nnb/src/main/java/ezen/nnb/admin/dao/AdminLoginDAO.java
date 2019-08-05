package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;

@Repository("adminLoginDAO")
public class AdminLoginDAO extends AbstractDAO{
	/*
	 * @SuppressWarnings("unchecked") public Map<String,
	 * Object>LoginStatus(Map<String, Object> map) throws Exception{ return
	 * (Map<String, Object>)selectOne("adminlogin.adminlogin", map); }
	 */

	@SuppressWarnings("unchecked")
	public Map<String, Object> AdminLogin(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)selectOne("login.selectAdminLogin", map);
	}

}
