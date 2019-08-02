package ezen.nnb.member.dao;
import java.util.Map;
import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;

	@Repository("reportDAO") 
	public class ReportDAO extends AbstractDAO{
		public void report(Map<String, Object> map) throws Exception {
		insert("report.insertReport", map);
	}
}  

