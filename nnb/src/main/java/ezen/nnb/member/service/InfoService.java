package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

public interface InfoService  {

	List<Map<String, Object>> selectTermsDetail(Map<String, Object> map) throws Exception;

}
