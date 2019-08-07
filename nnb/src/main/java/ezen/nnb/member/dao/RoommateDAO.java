package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;
@Repository("roommateDAO")
public class RoommateDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public Map<String,Object>myProfile(Map<String,Object>map)throws Exception{
		return(Map<String,Object>)selectOne("roommate.selectRoommateDetail",map);		
	}
	public void registMyProfile(Map<String,Object>map)throws Exception{
		insert("roommate.insertMyRoommateProfile",map);
	}

	public void myProfileModify(Map<String,Object>map)throws Exception{
		update("roommate.updateMyProfile",map);
	}
	public void myProfileDelete(Map<String,Object>map)throws Exception{
		delete("roommate.deleteMyProfile",map);
	}//여기까지 내방관리 에서의 룸메이트 정보
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>searchRoommate(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectList("roommate.selectRoommateList",map);
	}
	public int countRoommate()throws Exception{
		return (int)selectOne("roommate.countRoommateList");
	}
	public void listAddFavRoommate(Map<String,Object>map)throws Exception{
		insert("roommate.insertFavRoommate",map);
	}
	public void listDeleteFavRoommate(Map<String,Object>map)throws Exception{
		delete("roommate.deleteFavRoommate",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> openRoommatesDetail(Map<String, Object> map) throws Exception{	
		return (Map<String,Object>) selectOne("roommate.selectRoommateDetail",map);
	}
	public void detailAddFavRoommate(Map<String,Object>map)throws Exception{//상세보기에서 찜
		insert("roommate.insertFavRoommate",map);
	}
	public void detailDeleteFavRoommate(Map<String,Object>map)throws Exception{
		delete("roommate.deleteFavRoommate",map);
	}
	public void messageWrite(Map<String,Object>map)throws Exception{
		insert("roommate.insertMessage",map);
	}
	public void ignoreUser(Map<String,Object>map)throws Exception{
		insert("roommate.insertIgnore",map);
	}
	
	public void unIgnoreUser(Map<String,Object>map)throws Exception{
		delete("roommate.deleteIgnore",map);
	}
	
}
