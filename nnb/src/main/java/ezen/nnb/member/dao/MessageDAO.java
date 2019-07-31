package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("messageDAO")
public class MessageDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMessageList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("message.selectMessageList",map);
	}
	public void insertMessage(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		insert("message.insertMessage", map);		
	}
}
