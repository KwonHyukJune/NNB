package ezen.nnb.member.service;

import java.util.Map;

public interface RoommateService {

	public Map<String,Object>openRoommateDetail(Map<String, Object> map)throws Exception;
	
	public void registProfile(Map<String,Object>map)throws Exception;

	public void myProfileModify(Map<String,Object>map)throws Exception;
	
	public void myProfileDelete(Map<String,Object>map)throws Exception;	
}
