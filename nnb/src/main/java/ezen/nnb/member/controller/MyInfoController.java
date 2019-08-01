/* MyInfoService MyInfoController MyInfoDAO
http://localhost:8080/ninaebang/myPage/MyInfoDetail		내 정보 보기	/myInfo/MyInfoDetail		MyInfoDetail()		selectInfoDetail	MyInfoDetail.jsp
http://localhost:8080/ninaebang/myPage/MyInfoModifyForm	정보 수정 폼	/myInfo/MyInfoModifyForm	MyInfoModify()		selectInfoDetail	MyInfoModifyForm.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoModify		내 정보 수정	/myInfo/MyInfoModify		MyInfoModify()-post	updateInfoModify	MyInfoModify.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDeleteComfirm회원탈퇴-비밀번호확인						MyInfoDelete.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDelete		회원탈퇴	/myInfo/MyInfoDelete		MyInfoDelete()		deleteInfo			redirect: main	*/
package ezen.nnb.member.controller;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezen.nnb.admin.service.AdminBankService;
import ezen.nnb.common.CommandMap;
import ezen.nnb.member.service.MyInfoService;
@Controller
public class MyInfoController {
	@Resource(name="myInfoService") 
	private MyInfoService myInfoService;
	
///MyInfoDetail
@RequestMapping(value="/mypage/MyInfodetail")
public ModelAndView MyInfoDetail(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/MyInfo/detail");
	Map<String,Object> map = myInfoService.selectMyInfoDetail(commandMap.getMap());	
	return mv;
}

///MyInfoModifyFrom
@RequestMapping(value="/mypage/MyInfo/modifyForm")
public ModelAndView MyInfoModifyForm(CommandMap commandMap) throws Exception{
	ModelAndView mv = new ModelAndView("mypage/MyInfo/modifyForm");
	Map<String,Object> map = myInfoService.selectMyInfoDetail(commandMap.getMap());	
	return mv;
}
///MyInfoModify
@RequestMapping(value="/mypage/MyInfo/modify")
public ModelAndView MyInfoModify(CommandMap commandMap)throws Exception{
	ModelAndView mv=new ModelAndView("redirect:/mypage/MyInfo/detail");	
	myInfoService.updateMyInfoModify(commandMap.getMap());	
	mv.addObject("MyInfo", commandMap.get("MyInfo"));
	return mv;
}

/*MyInfoDeleteComfirm
*/

///MyInfoDelete
	@RequestMapping(value="mypage/MyInfoDelete")
	public ModelAndView MyInfoDelete(CommandMap commandMap)throws Exception{
	ModelAndView mv=new ModelAndView("redirect: main");	
	myInfoService.deleteMyInfo(commandMap.getMap());
	
	return mv;
}


}   
  