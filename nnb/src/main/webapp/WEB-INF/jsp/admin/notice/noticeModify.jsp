<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminNotice.css'/>"/>	
<script type="text/javascript">
$(document).ready(function(){
	$("#update").on("click", function(e){ //저장하기 버튼
		updateNotice();
	});

	function updateNotice(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/noticeDetail' />");
		comSubmit.submit();
	}
});
function frameclose() { 
	parent.close() 
	window.close() 
	self.close() 
	} 
$(document).ready(function(){
 (function(){
     var value = "${map.NT_TYPE}";
     var key = $("select[name='NT_TYPE']>option");
     for(var i=0;i<key.length;i++){
        if(key[i].value==value){
           key[i].selected = true;
        }
     };
  })();   
  (function(){
     var value = "${map.NT_TYPE}";
     var key = $("input[name='NT_TYPE']");
     for(var i=0;i<key.length;i++){
        key[i].value = value;
     };
  })();   
  (function(){
     var value = "${map.NT_TITLE}";
     var key = $("textarea[name='NT_TITLE']");
     for(var i=0;i<key.length;i++){
        key[i].value = value;
     };
  })();
  (function(){
	     var value = "${map.NT_CONTENT}";
	     var key = $("textarea[name='NT_CONTENT']");
	     for(var i=0;i<key.length;i++){
	        key[i].value = value;
	     };
	  })();
});
</script>
</head>
<body>
<div class="selectNoticeList">
<div class="jtRefx">
	<h1 class="kuldyr">공지 게시판</h1>
</div>
<div>
	<h2 class="cYaAqA">공지사항 수정</h2>
	<br/>
</div>
<div class="eugBve">
 	<form method="post" id="frm" name="frm">
 	<ul class="hIJwlj">
 		<li>
      	 <p class="efvxco">공지유형</p>
      		<select class="freEbZ hRFrgm" name="NT_TYPE" id="type">
					<option value=''>공지유형 선택</option>
					<option value="참고사항">참고사항</option>
        			<option value="필독사항">필독사항</option>	
			</select>
 		</li> 
 		<li>
 		 	<input type="hidden" name="num" id="num" value="${map.NT_NUM}">
 			<p class="efvxco">제목</p>
 			<input type="text" value="${map.NT_TITLE }"class="ilgADB kTQnUD" id="NT_TITLE" name="NT_TITLE">
 		</li>
 		<li>
 			<p class="efvxco">내용</p>
			<textarea class="bqTGEL hunnDM" name="NT_CONTENT" id="NT_CONTENT"></textarea> 		</li>
 	</ul>
 	</form>
 	<div align="center">
		<button class='kcMULl' id="update" type="button">수정</button>
		<button class='iEZQG' type="button" onclick="location.href='/nnb/admin/openNoticeList'">취소</button>	</div>
 	</div>
</div>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>