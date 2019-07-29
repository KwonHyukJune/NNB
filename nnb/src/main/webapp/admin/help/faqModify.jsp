<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 질문 수정</title>
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
   Map<String,Object> faq1 = new HashMap<String,Object>();
 	faq1.put("FAQ_NUM","1");
    faq1.put("FAQ_CATEGORY","회원문의");
    faq1.put("FAQ_TITLE","회원가입 방법");
    faq1.put("FAQ_CONTENT","그거 모르면 그냥 돌아가세요.");
   
   
   List<Map<String,Object>> faq = new ArrayList<Map<String,Object>>();
   faq.add(faq1);
  
 
   request.setAttribute("faq",faq1);
%>
<!-- 테스트용 세팅 끝 -->


<h1><div>FAQ 관리</div></h1>

<br/>
<div>
<h2>질문 수정</h2>
<hr>
<br/>
</div>
 <form>
	<div>
        카테고리&nbsp;&nbsp; 
        <select name="selectBox" id="selectBox" style="width:80px;" class="select_02">

         <option value="${FAQ_CATEGORY}">${FAQ_CATEGORY}</option>

  

   </select>
   </div>
   <br/>
   
  
		<div>
       		 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="text" id="TITLE" name="TITLE" value= "${faq.FAQ_TITLE }"/>
  		</div>
  		<br/>
		<div>    
	       	 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="CONTENTS">${faq.FAQ_CONTENT}</textarea>
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
<%@include file = "/include/footer.jspf" %>
</div>
</body>
</html>
