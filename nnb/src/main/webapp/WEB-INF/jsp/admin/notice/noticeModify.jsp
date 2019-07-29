<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">

	function frameclose() { 
		parent.close() 
		window.close() 
		self.close() 
		} 
</script>
</head>
<body>

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
   
   
   List<Map<String,Object>> notice = new ArrayList<Map<String,Object>>();
   notice.add(notice1);
  // noticeList.add(noitce2);
   
 
   request.setAttribute("notice",notice1);
%>
<!-- 테스트용 세팅 끝 -->

<h1><div>공지 게시판</div></h1>

<br/>
<div>
<h2>공지사항 수정</h2>
<hr>
<br/>
</div>
 <form action="admin/notice/modify" method="post">
	<div>
        제목
       	<input type="text" id="TITLE" name="TITLE" value= "${notice.NT_TITLE }"/>
	</div>
 		<br/>
	<div>    
	내용
		<textarea rows="20" cols="50" id="CONTENTS" name="CONTENTS">${notice.NT_CONTENT}</textarea>
    </div>
</form> 
    <div>
    	<br/><br/>
    	<a href="javascript:frameclose()">등록</a>

    	<a href="javascript:frameclose()">닫기</a>
    </div>



<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
