package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;  
import org.springframework.stereotype.Service;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.dao.ServiceDAO;;

	@Service("serviceService")
	public class ServiceServiceImpl implements ServiceService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "serviceDAO")
	private ServiceDAO serviceDAO;

	@Override
	public List<Map<String, Object>> openNoticeList(Map<String, Object> commandMap) throws Exception {
		return (List<Map<String, Object>>) serviceDAO.selectNoticeList(commandMap);
	}
	@Override
	public void sendQNA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		serviceDAO.sendQNA(map);
	}
	@Override
	public List<Map<String, Object>> openFAQList(Map<String, Object> commandMap) throws Exception {
		return (List<Map<String, Object>>) serviceDAO.selectFaqList(commandMap);
	}


}


      