package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminBankService {

	List<Map<String, Object>> selectBankList(Map<String, Object> map) throws Exception;

	void insertBankWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> selectBankDetail(Map<String, Object> map)throws Exception;

	void updateBankModify(Map<String, Object> map) throws Exception;

	void deleteBank(Map<String, Object> map) throws Exception;
}
