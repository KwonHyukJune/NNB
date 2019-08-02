
package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

public interface ServiceService {

	List<Map<String, Object>> openFAQList(Map<String, Object> commandMap) throws Exception;

	void sendQNA(Map<String, Object> map);
	
	List<Map<String, Object>> openNoticeList(Map<String, Object> commandMap) throws Exception;


	

}
  