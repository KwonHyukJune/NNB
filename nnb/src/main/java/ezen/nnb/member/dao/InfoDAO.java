package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

	@Repository("infoDAO")
	public class InfoDAO extends AbstractDAO{


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTermsDetail(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("info.selectTermsDetail",map);
	}
}
	