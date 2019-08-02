package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import ezen.nnb.common.CommandMap;

public interface IgnoreService {

	int countIgnoreUserList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectIgnoreUserList(Map<String, Object> map) throws Exception;

	void insertIgnore(Map<String, Object> map) throws Exception;

	void deleteIgnore(Map<String, Object> map) throws Exception;

	int checkIgnore(Map<String, Object> map) throws Exception;
}
