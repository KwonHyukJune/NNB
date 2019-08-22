/* MyInfoService MyInfoController MyInfoDAO
http://localhost:8080/ninaebang/myPage/MyInfoDetail		내 정보 보기	/myInfo/MyInfoDetail		MyInfoDetail()		selectInfoDetail	MyInfoDetail.jsp
http://localhost:8080/ninaebang/myPage/MyInfoModifyForm	정보 수정 폼	/myInfo/MyInfoModifyForm	MyInfoModify()		selectInfoDetail	MyInfoModifyForm.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoModify		내 정보 수정	/myInfo/MyInfoModify		MyInfoModify()-post	updateInfoModify	MyInfoModify.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDeleteComfirm회원탈퇴-비밀번호확인						MyInfoDelete.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDelete		회원탈퇴	/myInfo/MyInfoDelete		MyInfoDelete()		deleteInfo			redirect: main	*/
package ezen.nnb.member.controller;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.MyInfoService;
@Controller
public class MyInfoController {
	@Resource(name="myInfoService") 
	private MyInfoService myInfoService;
	
///MyInfoDetail
@RequestMapping(value="/myPage/MyInfodetail")
public ModelAndView MyInfoDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
	ModelAndView mv = new ModelAndView("member/myPage/myPageInfo");
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("MEM_ID");
	commandMap.put("MEM_ID",id);
	Map<String,Object> map = myInfoService.selectMyInfoDetail(commandMap.getMap());	
	mv.addObject("map",map);
	return mv;
}

///MyInfoModifyFrom
@RequestMapping(value="/myPage/modifyForm")
public ModelAndView MyInfoModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
	ModelAndView mv = new ModelAndView("member/myPage/myPageInfoForm");
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("MEM_ID");
	commandMap.put("MEM_ID",id);
	Map<String,Object> map = myInfoService.selectMyInfoDetail(commandMap.getMap());	
	mv.addObject("map",map);
	return mv;
}
///MyInfoModify
@RequestMapping(value="/myPage/modify")
public ModelAndView MyInfoModify(CommandMap commandMap, HttpServletRequest request)throws Exception{
	ModelAndView mv=new ModelAndView("member/myPage/myPageModify");	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("MEM_ID");
	commandMap.put("MEM_ID",id);
	myInfoService.updateMyInfoModify(commandMap.getMap());	
	mv.addObject("MyInfo", commandMap.get("MyInfo"));
	return mv;
}

/*MyInfoDeleteComfirm
*/
@RequestMapping(value="/myPage/myPageDeleteComfirm")
public ModelAndView MyInfoDeleteConfirm(CommandMap commandMap, HttpServletRequest request) throws Exception{
	ModelAndView mv = new ModelAndView("member/myPage/deleteForm");
	return mv;
}

///MyInfoDelete
	@RequestMapping(value="/myPage/MyInfoDelete")
	public ModelAndView MyInfoDelete(CommandMap commandMap, HttpServletRequest request)throws Exception{
	ModelAndView mv=new ModelAndView("member/myPage/delete");	
	HttpSession session = request.getSession();
	commandMap.put("MEM_ID",session.getAttribute("MEM_ID"));
	int res = myInfoService.deleteMyInfo(commandMap.getMap());	
	if(res==1) {
		session.invalidate();
	}
	mv.addObject("res",res);
	return mv;
}


}   
  