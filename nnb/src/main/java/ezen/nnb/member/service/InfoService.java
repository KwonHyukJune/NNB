package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

public interface InfoService  {

	List<Map<String, Object>> selectAgree(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectPersonalData(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectArticleRule(Map<String, Object> map) throws Exception;


	
}
