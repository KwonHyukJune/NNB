package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("ServiceService")
public class ServiceServiceImpl implements ServiceService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="serviceDAO") 
	private ServiceDAO serviceDAO; 

	
	@Override
	public List<Map<String, Object>> openFAQList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return serviceDAO.openFAQList(map);
	}

}
