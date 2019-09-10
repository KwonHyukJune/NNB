package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminReportDAO")
public class AdminReportDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportRoomList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectPagingList("report.selectReportRoomList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportMateList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("report.selectReportMateList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportRoomDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("report.selectReportRoomDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportMateDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("report.selectReportMateDetail", map);
	}
	public void updateRoom(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("report.updateRoom",map);
	}

	public void deleteRoom(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		delete("report.deleteRoom",map);
	}

}
