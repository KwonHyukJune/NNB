<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>공지사항 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">

function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 

</script>

</head>

<br/><br/><br/>

<body>


<h1><div>공지사항</div></h1>
<br/>
<hr>
<br/><br/><br/>


<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> notice1 = new HashMap<String,Object>();
   notice1.put("NT_NUM","1");
   notice1.put("NT_TYPE","공지유형1");
   notice1.put("NT_DATE","2019-07-25");
   notice1.put("NT_TITLE","공지입니다");
   notice1.put("NT_CONTENT","공지라구요 아시겠어요?");
   
   
   List<Map<String,Object>> noticeList = new ArrayList<Map<String,Object>>();
   noticeList.add(notice1);
  // noticeList.add(noitce2);
   
   int count = noticeList.size();
   request.setAttribute("count", count);
   request.setAttribute("notice",notice1);
%>
<!-- 테스트용 세팅 끝 -->

<div class="selectNoticeList">


<div class="noticeList">
   
   <div class="notice">
      <ul>
      <li>번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; 
      	${notice.NT_NUM}
      </li>
      <li>공지유형  :&nbsp; 
		 ${notice.NT_TYPE}      
      </li>
      <li>날짜 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
         ${notice.NT_DATE}
      </li>
      <li>제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
         ${notice.NT_TITLE}
       </li> 
       <li>내용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;  
         ${notice.NT_CONTENT}
          
      </li>
    </ul>
    <br/><br/><br/> 
      <a href="javascript:frameclose()">닫기</a>


   </div>	
 
</div>

</div>
</body>
</html>