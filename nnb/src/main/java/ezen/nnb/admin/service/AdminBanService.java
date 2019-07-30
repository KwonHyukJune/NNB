package ezen.nnb.admin.service;

import java.util.Map;

public interface AdminBanService {

	void insertBan(Map<String, Object> map) throws Exception;

	Map<String, Object> banDateCheck(Map<String, Object> map) throws Exception;

}
