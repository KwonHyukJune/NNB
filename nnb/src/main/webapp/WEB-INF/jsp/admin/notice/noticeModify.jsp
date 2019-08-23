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
		updateNotice();
	});

	function updateNotice(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/noticeModify' />");
		comSubmit.submit();
	}
	
});


	
</script>
</head>
<body>

<div><h1>공지 게시판</h1></div>

<br/>
<div>
<h2>공지사항 수정</h2>
<hr>
<br/>
</div>
 <form action="updateNoticeModify" method="post" id="frm" name="updateNoticeModify" >
 	

 	<div>
       	 공지유형
        <select id="NT_TYPE" name="NT_TYPE" value="${map.NT_TYPE}" />
        	<option value="공지유형1">공지유형1</option>
        	<option value="공지유형2">공지유형2</option>
        </select>	
  	</div>
 
 
	<div>
		<input type="hidden" id="NT_NUM" name="num" value="${map.NT_NUM}">
	</div> 
	<div>
        제목
       	<input type="text" id="NT_TITLE" name="NT_TITLE" value= "${map.NT_TITLE }"/>
	</div>
 		<br/>
	<div>    
	내용
		<textarea rows="20" cols="50" id="NT_CONTENT" name="NT_CONTENT">${map.NT_CONTENT}</textarea>
    </div>
</form> 
    <div>
    	<br/><br/>
    	<a href="#" id="update">저장하기</a>
		<button type="button" onclick="fn_back();">취소</button>
    </div>



<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
