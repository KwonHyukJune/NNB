package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ezen.nnb.member.dao.IgnoreDAO;
import ezen.nnb.member.dao.InfoDAO;
import ezen.nnb.member.dao.JoinDAO;

@Service("infoService")
public class InfoServiceImpl implements InfoService{	
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="infoDAO")
	private InfoDAO infoDAO;
	
	@Override
	public List<Map<String, Object>> selectAgree(Map<String, Object> map) {
		return null;
	}
	@Override
	public List<Map<String, Object>> selectPersonalData (Map<String, Object> map) {
		return null;
	}
	@Override
	public List<Map<String, Object>> selectArticleRule (Map<String, Object> map) {
		return null;
	}
	
	

	
}
