package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.admin.dao.AdminBankDAO;
import ezen.nnb.common.BankFile;

@Service("adminBankService") // service 객체 임을 선언
public class AdminBankServiceImpl implements AdminBankService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminBankDAO")
	private AdminBankDAO adminBankDAO;
	// 인터페이스를 구현하면 인터페이스에 정의된 메서드를 무조건 작성해야한다.
	// interface에 정의된 메서드를 실제 구현할 수 있는 코드 작성
	
	@Resource(name = "bankFile")
	private BankFile bankFile;
	
	@Override
	public List<Map<String, Object>> selectBankList(Map<String, Object> map) throws Exception {
		return adminBankDAO.selectBankList(map);
	}
	@Override
	public void insertBankWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminBankDAO.insertBankWrite(map);
		Map<String,Object> map2 = bankFile.parseInsertFileInfo(map, request); 
		if(map2.containsKey("ORIGINAL_FILE_NAME1") || map.containsKey("ORIGINAL_FILE_NAME2")) {
			adminBankDAO.insertBankFile(map2); 
		}

	}
	@Override
	public Map<String, Object> selectBankDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminBankDAO.selectBankDetail(map);
		return resultMap;
	}
	@Override
	public void updateBankModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		adminBankDAO.updateBankModify(map);
		Map<String,Object> map2 = bankFile.parseInsertFileInfo(map, request); 
		System.out.println("1:"+map2.containsKey("ORIGINAL_FILE_NAME1"));
		System.out.println("2:"+map2.containsKey("ORIGINAL_FILE_NAME2"));
		if(map.containsKey("delete1") || map.containsKey("delete2")) {
			System.out.println("d1=:"+map.get("delete1"));
			adminBankDAO.deleteBankFile(map);
		}
		if(map2.containsKey("ORIGINAL_FILE_NAME1") || map.containsKey("ORIGINAL_FILE_NAME2")) {
			adminBankDAO.insertBankFile(map2); 
		}
	}
	@Override
	public void deleteBank(Map<String, Object> map) throws Exception {
		adminBankDAO.deleteBank(map);
	}
}
