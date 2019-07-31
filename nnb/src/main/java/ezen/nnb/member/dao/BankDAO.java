package ezen.nnb.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("bankDAO")
public class BankDAO extends AbstractDAO{
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> bankList(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectList("bank.selectBankBoardList",map);
	}
	
	public void updateHitCnt(Map<String,Object>map)throws Exception{
		update("bank.updateHitCount",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> bankView (Map<String,Object>map)throws Exception{
		return (Map<String,Object>)selectOne("bank.selectBankDetail",map);
	}
}
