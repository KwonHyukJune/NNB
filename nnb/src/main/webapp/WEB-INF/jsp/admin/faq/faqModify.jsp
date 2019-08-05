<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 질문 수정</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">

$(document).ready(function(){
	$("#update").on("click", function(e){ //저장하기 버튼
		updateFAQ();
	});

	function updateFAQ(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/faq/modify' />");
		comSubmit.submit();
	}
	
});

</script>
</head>
<body>

<div><h1>FAQ 게시판</h1></div>

<br/>
<div>
<h2>질문 수정</h2>
<hr>
<br/>
</div>
 <form action="updateFaq" method="post" id="frm" name="updateNoticeModify" >
 	

 	<div>
       	 카테고리
        <select id="FAQ_CATEGORY" name="FAQ_CATEGORY">
        	<option value="회원정보">회원정보</option>
        	<option value="신고관련">신고관련</option>
        </select>	
  	</div>
 
 
	<div>
		<input type="hidden" id="FAQ_NUM" name="num" value="${map.FAQ_NUM}">
	</div> 
	<div>
        제목
       	<input type="text" id="FAQ_TITLE" name="FAQ_TITLE" value= "${map.FAQ_TITLE }"/>
	</div>
 		<br/>
	<div>    
	내용
		<textarea rows="20" cols="50" id="FAQ_CONTENT" name="FAQ_CONTENT">${map.FAQ_CONTENT}</textarea>
    </div>
</form> 
    <div>
    	<br/><br/>
    	<a href="#" id="update">저장하기</a>
		<a href="javascript:back()">취소</a>
    </div>

	
<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
