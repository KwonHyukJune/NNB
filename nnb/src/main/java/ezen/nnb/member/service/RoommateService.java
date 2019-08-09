package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

public interface RoommateService {
	public Map<String,Object>myProfile(Map<String, Object> map)throws Exception;
	
	public Map<String,Object>openRoommateDetail(Map<String, Object> map)throws Exception;
	
	public void registProfile(Map<String,Object>map)throws Exception;

	public void myProfileModify(Map<String,Object>map)throws Exception;
	
	public void myProfileDelete(Map<String,Object>map)throws Exception;	
	 
	public List<Map<String,Object>>searchRoommate(Map<String,Object>map)throws Exception;
	
	public int countRoommate(Map<String, Object> map)throws Exception;
	
	public void listAddFavRoommate(Map<String,Object>map)throws Exception;
	
	public void listDeleteFavRoommate(Map<String,Object>map)throws Exception;
	
	public void detailAddFavRoommate(Map<String,Object>map)throws Exception;// 상세보기에서 찜
	
	public void detailDeleteFavRoommate(Map<String,Object>map)throws Exception;
	
	public void messageWrite(Map<String,Object>map)throws Exception;
	

	}