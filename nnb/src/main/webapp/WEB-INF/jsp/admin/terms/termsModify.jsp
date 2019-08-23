<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">

$(document).ready(function(){
	$("#update").on("click", function(e){ //저장하기 버튼
		updateTerms();
	});

	function updateTerms(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/terms/termsModify' />");
		comSubmit.submit();
	}
	
	
	function frameclose() { 
		parent.close() 
		window.close() 
		self.close() 
		} 
});
</script>
</head>
<body>

<div><h1>약관 관리</h1></div>
<br/>
<div>
<h2>약관 수정</h2>
<hr>
<br/>
</div>
 <form action="updateTermsModify" method="post" id="frm"  name="updateTermsModify">
 
 
	<div>
		<input type="hidden" id="TERMS_NUM" name="num" value="${terms.TERMS_NUM}">
	</div>
	<div>
        제목
       	<input type="text" id="TERMS_TITLE" name="TERMS_TITLE" value="${terms.TERMS_TITLE}"/>
	</div>
 		<br/>
	<div>    
	내용
		<textarea rows="20" cols="50" id="TEMRS_CONTENT" name="TERMS_CONTENT">${terms.TERMS_CONTENT}</textarea>
    </div>
 
    <div>
    	<br/><br/>
		<a href="#" id="update">저장하기</a>
		<button type="button" onclick="fn_back();">취소</button>
    </div>
</form>


<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
