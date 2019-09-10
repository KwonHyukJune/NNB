package ezen.nnb.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminReportService {
	List<Map<String, Object>> selectReportRoomList (Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectReportMateList (Map<String, Object> map) throws Exception;

		 Map<String, Object>  selectReportRoomDetail(Map<String, Object> map) throws Exception;

		 Map<String, Object>  selectReportMateDetail(Map<String, Object> map) throws Exception;

		void updateRoom(Map<String, Object> map) throws Exception;

		void deleteRoom(Map<String, Object> map) throws Exception;


}
