package ezen.nnb.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.ReportDAO;

@Service("reportService")
public class ReportServiceImpl implements ReportService {

	@Resource(name="reportDAO")
	private ReportDAO reportDAO;
	
	@Override
	public void report(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reportDAO.report(map);
	}

}

