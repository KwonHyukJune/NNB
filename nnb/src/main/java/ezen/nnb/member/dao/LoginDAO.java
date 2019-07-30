package ezen.nnb.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.selectId", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findIdWithPhone(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findIdWithPhone", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findIdWithEmail", map);
	}


}
