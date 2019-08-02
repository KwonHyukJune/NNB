package ezen.nnb.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.ReportDAO;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
Logger log = Logger.getLogger(this.getClass());
@Resource(name = "reportDAO")
private ReportDAO reportDAO;	
	@Override
	public void submitReport(Map<String, Object> map) throws Exception {
		reportDAO.insertReport(map);
	}  
}
	



