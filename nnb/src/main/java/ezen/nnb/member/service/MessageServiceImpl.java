package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.MessageDAO;

@Service("messageService")
public class MessageServiceImpl implements MessageService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="messageDAO")
	private MessageDAO messageDAO;
	
	@Override
	public List<Map<String, Object>> selectMessageList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return messageDAO.selectMessageList(map);
	}
	@Override
	public void insertMessage(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		messageDAO.insertMessage(map);
	}
}
