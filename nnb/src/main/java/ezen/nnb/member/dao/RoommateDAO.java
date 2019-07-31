package ezen.nnb.member.dao;

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

}
