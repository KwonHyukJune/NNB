package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("ignoreDAO")
public class IgnoreDAO extends AbstractDAO{
	public int countIgnoreUserList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (int)selectOne("ignore.countIgnoredUserList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIgnoreUserList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("ignore.selectIgnoredUserList", map);
	}
	public void insertIgnore(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		insert("ignore.insertIgnore",map);
	}
	public void deleteIgnore(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		delete("ignore.deleteIgnore",map);
	}
	public int checkIgnore(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (int)selectOne("ignore.checkIgnore",map);
	}
}
