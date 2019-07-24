package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminBankService {

	List<Map<String, Object>> selectBankList(Map<String, Object> map) throws Exception;

}
