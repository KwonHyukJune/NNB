package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminBankDAO;

@Service("adminBankService") //service 객체 임을 선언
public class AdminBankServiceImpl implements AdminBankService{
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name="adminBankDAO")
	private AdminBankDAO adminBankDAO;
	//인터페이스를 구현하면 인터페이스에 정의된 메서드를 무조건 작성해야한다.
		//interface에 정의된 메서드를 실제 구현할 수 있는 코드 작성

	@Override
	public List<Map<String, Object>> selectBankList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminBankDAO.selectBankList(map);
	}
	

}
