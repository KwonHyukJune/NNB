package ezen.nnb.admin.dao;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;
@Repository("NoticeNoticeDAO") 
public class AdminNoticeDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map)throws Exception{
	return (List<Map<String,Object>>)selectList("notice.selectNoticeList", map);
	}
	public void insertNoticeWrite(Map<String, Object> map) throws Exception{
	insert("notice.insertNoticeWrite",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception{
	return (Map<String,Object>)selectOne("notice.selectNoticeDetail",map);
	}
	public void updateNoticeModify(Map<String, Object> map) throws Exception{
	update("notice.updateNotice",map);
	}
	public void deleteNotice(Map<String, Object> map) throws Exception {
	delete("notice.deleteNotice",map);
	}
}

    