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
		return (List<Map<String, Object>>)selectList("faq.selectFaqList", map);

	}

}
