package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminQnaService {

	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception;

}