package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminBankDAO")
public class AdminBankDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")//검증되지 않은 연산자 관련 경고 억제
	public List<Map<String, Object>> selectBankList(Map<String, Object> map)throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String,Object>>)selectList("bank.selectBankList", map);
	}
	
}
