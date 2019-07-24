package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminFaqService {

	List<Map<String, Object>> selectFaqList(Map<String, Object> commandMap) throws Exception;

}
