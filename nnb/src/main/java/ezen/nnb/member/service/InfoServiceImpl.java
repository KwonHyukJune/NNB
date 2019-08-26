package ezen.nnb.member.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.InfoDAO;

@Service("infoService")
public class InfoServiceImpl implements InfoService{	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="infoDAO")
	private InfoDAO infoDAO;
	
	@Override
	public List<Map<String, Object>> selectTermsDetail(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> list = infoDAO.selectTermsDetail(map);
		Iterator<Map<String, Object>> i = list.iterator();
		while(i.hasNext()) {
			Map<String, Object> resmap = i.next();
			String str = resmap.get("TERMS_CONTENT").toString().replace("\n", "<br>");
			resmap.replace("TERMS_CONTENT", str);
		}
		return list;
	}

	
}
