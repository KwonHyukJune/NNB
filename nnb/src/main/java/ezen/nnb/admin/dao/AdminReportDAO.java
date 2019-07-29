package ezen.nnb.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ezen.nnb.common.AbstractDAO;

@Repository("adminReportDAO")
public class AdminReportDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportRoomList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("report.selectReportRoomList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportMemberList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("report.selectReportMemberList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("report.selectReportDetail", map);
	}

}
