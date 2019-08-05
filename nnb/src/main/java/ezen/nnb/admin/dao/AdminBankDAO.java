package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminBankDAO")
public class AdminBankDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")//검증되지 않은 연산자 관련 경고 억제
	public List<Map<String, Object>> selectBankList(Map<String, Object> map)throws Exception{
		return (List<Map<String,Object>>)selectList("bank.selectBankList", map);
	}
	public void insertBankWrite(Map<String, Object> map) throws Exception{
		insert("bank.insertBankWrite",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBankDetail(Map<String, Object> map) throws Exception{
		return (Map<String,Object>)selectOne("bank.selectBankDetail",map);
	}
	public void updateBankModify(Map<String, Object> map) throws Exception{
		update("bank.updateBank",map);
	}
	public void deleteBank(Map<String, Object> map) throws Exception {
		delete("bank.deleteBank",map);
	}
	
	public void insertBankFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("bank.insertBankFile", map);
	}
	public void deleteBankFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("bank.deleteBankFile",map);
	}
}
