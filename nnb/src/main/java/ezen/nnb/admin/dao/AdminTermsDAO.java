package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminTermsDAO")
public class AdminTermsDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTermsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("terms.selectTermsList", map);

	}
	public void writeTerms(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("terms.insertTerms", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTermsDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("terms.selectTermsDetail", map);
	}
	public void updateTermsModify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("terms.updateTermsModify", map);
	}
	public void deleteTerms(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("terms.deleteTerms", map);
	}
}