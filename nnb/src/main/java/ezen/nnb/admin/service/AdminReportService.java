package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminReportService {
	List<Map<String, Object>> selectReportRoomList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectReportMemberList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception;
	

}
