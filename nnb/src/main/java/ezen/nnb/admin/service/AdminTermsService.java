package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminTermsService {

	List<Map<String, Object>> selectTermsList(Map<String, Object> map) throws Exception;

	void writeTerms(Map<String, Object> map) throws Exception;

	Map<String, Object> selectTermsDetail(Map<String, Object> map) throws Exception;

	void updateTermsModify(Map<String, Object> map) throws Exception;

	void deleteTerms(Map<String, Object> map) throws Exception;



}
