package ezen.nnb.member.dao;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;

@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO {

	//보기
	public Map<String, Object> selectMyInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selctmyinfo",map);
	}
	//수정폼
	public Map<String, Object> selectMyInfoDetail1(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.insertmyinfo",map);
	}
	//수정
	public void updateMyInfoModify(Map<String, Object> map) throws Exception {
		update("myInfo.insertmyinfo",map);
	}
	//회원 탈퇴
	public void deleteMyInfo(Map<String, Object> map) throws Exception {
		update("myInfo.deleteMember",map);
	}
	//인증
	public void verifyMember(Map<String, Object> map) throws Exception{
		update("myInfo.updateVerify",map);
	}
	
	
	
	

} 
 