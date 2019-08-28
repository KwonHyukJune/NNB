
package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import ezen.nnb.common.CommandMap;

public interface ServiceService {

	List<Map<String, Object>> openFAQList(Map<String, Object> commandMap) throws Exception;
	
	List<Map<String, Object>> openNoticeList(Map<String, Object> commandMap) throws Exception;

	void sendQNA(Map<String, Object> map) throws Exception;

	


	

}
  