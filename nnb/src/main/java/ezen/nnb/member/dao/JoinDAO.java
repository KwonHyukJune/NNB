package ezen.nnb.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;


@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public int selectIdCheck(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (int)selectOne("join.selectIdCheck",map);
	}
	public void insertMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("join.insertMember",map);
	}
	public void verifyMember(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("join.updateVerify",map);
	}
}
