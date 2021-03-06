package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.BankDAO;
import ezen.nnb.member.service.BankService;

@Service("bankService")
public class BankServiceImpl implements BankService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bankDAO")
	private BankDAO bankDAO;
	
	@Override
	public List<Map<String,Object>>bankList(Map<String,Object>map)throws Exception{
		return bankDAO.bankList(map);
	}

	@Override
	public Map<String, Object> bankView(Map<String, Object> map) throws Exception {
		bankDAO.updateHitCnt(map);
		Map<String,Object>resultMap=bankDAO.bankView(map);
		return resultMap;
	}
	
}