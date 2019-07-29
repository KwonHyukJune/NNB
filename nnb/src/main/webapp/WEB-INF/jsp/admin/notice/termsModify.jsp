<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<head>
<%@include file = "/include/adminHeader.jspf" %>

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
   Map<String,Object> terms1 = new HashMap<String,Object>();
	terms1.put("TERMS_NUM","1");
	terms1.put("TERMS_DATE","2019-07-25");
	terms1.put("TERMS_TITLE","약과 아니고 약관이요");
	terms1.put("TERMS_CONTENT","또또또또 못알아 듣네 또!");

   
   
   
   List<Map<String,Object>> terms = new ArrayList<Map<String,Object>>();
   terms.add(terms1 );
  // noticeList.add(noitce2);
   
   
   request.setAttribute("terms",terms1);
%>
<!-- 테스트용 세팅 끝 -->

<h1><div>약관 관리</div></h1>

<br/>
<div>
<h2>약관 수정</h2>
<hr>
<br/>
</div>
 <form action="admin/notice/modify" method="post">
	<div>
        제목
       	<input type="text" id="TITLE" name="TITLE" value= "${terms.TERMS_TITLE }"/>
	</div>
 		<br/>
	<div>    
	내용
		<textarea rows="20" cols="50" id="CONTENTS" name="CONTENTS">${terms.TERMS_CONTENT}</textarea>
    </div>
</form> 
    <div>
    	<br/><br/>
    	<a href="javascript:frameclose()">수정</a>

    	<a href="javascript:frameclose()">취소</a>
    </div>



<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/include/footer.jspf" %>
</div>
</body>
</html>
