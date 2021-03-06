package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectPagingList("qna.selectQnaList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("qna.selectQnaDetail", map);
	}

	public void updateQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("qna.updateQna", map);
	}

	public void deleteQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		delete("qna.deleteQna", map);
	}
	
	

}

