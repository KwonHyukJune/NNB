package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminFaqDAO")
public class AdminFaqDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("faq.selectFaqList", map);

	}

	public void writeFaq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("faq.insertFaq", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("faq.selectFaqDetail", map);
	}

	public void updateFaq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("faq.updateFaq", map);
	}

	public void deleteFaq(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("faq.deleteFaq", map);
	}

}
