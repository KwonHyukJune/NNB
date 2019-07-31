package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import ezen.nnb.common.CommandMap;

public interface MessageService {

	List<Map<String, Object>> selectMessageList(Map<String, Object> map) throws Exception;

	void insertMessage(Map<String, Object> map) throws Exception;
}
