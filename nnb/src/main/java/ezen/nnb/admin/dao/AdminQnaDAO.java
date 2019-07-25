package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import ezen.nnb.common.AbstractDAO;

public class AdminQnaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public static List<Map<String, Object>> selectQnaList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("qna.selectQnaList", map);
	}

	@SuppressWarnings("unchecked")
	public static Map<String, Object> selectQnaDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("qna.selectQnaDetail", map);
	}

}
