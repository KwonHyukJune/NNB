/*
Service-CSID	
http://localhost:8080/ninaebang/service/faq		자주묻는질문	/faq		faqList()					serviceService.openFAQList		serviceDAO	selectFaqList		/service/faq.jsp
http://localhost:8080/ninaebang/service/qna		1:1질문	/qna		writeQNA()																				/service/qna.jsp
http://localhost:8080/ninaebang/service/send	질문제출	/send		sendQNA()				serviceService.sendQNA			serviceDAO	insertQNA			/service/send.jsp
http://localhost:8080/ninaebang/service/notice	공지사항	/notice		noticeList()			serviceService.open########List	serviceDAO	select########List	/service/notice.jsp
*/
package ezen.nnb.member.dao;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import ezen.nnb.common.AbstractDAO;
import ezen.nnb.common.CommandMap;

@Repository("serviceDAO") 
public class ServiceDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectFaqList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("service.selectFAQList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("service.selectNoticeList",map);
	}
	public void sendQNA(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		insert("service.sendQNA",map);				
	}
}

    