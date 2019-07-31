package ezen.nnb.member.service;

import java.util.List;
import java.util.Map;

public interface BankService {
	public List<Map<String,Object>>bankList(Map<String,Object>map)throws Exception;

	public Map<String,Object>bankView(Map<String,Object>map)throws Exception;
}
