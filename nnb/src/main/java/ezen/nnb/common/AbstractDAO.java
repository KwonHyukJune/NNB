package ezen.nnb.common;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}

	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}

	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}

	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}

	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}

	@SuppressWarnings("unchecked")
	public Object selectPagingList(String queryId, Object params) {
		printQueryId(queryId);
		
		Map<String, Object> map = (Map<String, Object>) params;
		
		String strPageIndex = (String) map.get("PAGE_INDEX");
		String strPageRow = (String) map.get("PAGE_ROW");
		
		int nPageIndex = 0;
		int nPageRow = 20;
		
		if (StringUtils.isEmpty(strPageIndex) == false) { // 받아온 페이지 번호가 없는게 false 면 = 받아온 페이지가 있으면
			nPageIndex = Integer.parseInt(strPageIndex) - 1; // 받아온 페이지를 인트로 바꾸고 -1 한다. 
		}
		if (StringUtils.isEmpty(strPageRow) == false) { //받아온 페이지 줄 개수가 없는게 false 면 = 받아온 페이지 줄이 있으면
			nPageRow = Integer.parseInt(strPageRow); // 인트로 바꾸기 
		}
		map.put("START", (nPageIndex * nPageRow) + 1); //맵에 첫 페이지를 넣어준다.
		map.put("END", (nPageIndex * nPageRow) + nPageRow); // 맵에 마지막 페이지를 넣는다. 
		return sqlSession.selectList(queryId, map); // 리스트
	}

}
