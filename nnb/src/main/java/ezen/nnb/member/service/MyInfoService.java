package ezen.nnb.member.service;


import java.util.List;
import java.util.Map;

public interface MyInfoService {

	Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception;
	void updateMyInfoModify(Map<String, Object> map) throws Exception;
	void deleteMyInfo(Map<String, Object> map) throws Exception;

	
}

 