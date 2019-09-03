<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 공지 등록</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminNotice.css'/>"/>	
<script type="text/javascript">
$(document).ready(function(){
	
	$("#write").on("click", function(e){ //작성하기 버튼
		insertBoard();
	});
		
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.validation($('#type option:selected'),'공지유형을 선택하세요.');
		comSubmit.validation($('#NT_TITLE'),'제목을 입력하세요.');
		comSubmit.validation($('#NT_CONTENT'),'내용을 입력하세요.');
		comSubmit.setUrl("<c:url value='/admin/noticeWrite' />");
		comSubmit.submit();
	}
});
</script>
</head>
<body>
<div class="selectNoticeList">
<div class="cYaAqA">
	<h1 class="kuldyr">새 공지 등록</h1>
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
 			<p class="efvxco">제목</p>
 			<input type="text" class="ilgADB kTQnUD" id="NT_TITLE" name="NT_TITLE">
 		</li>
 		<li>
 			<p class="efvxco">내용</p>
 			<textarea class="bqTGEL hunnDM" name="NT_CONTENT" id="NT_CONTENT"></textarea>
 		</li>
 	</ul>
 	</form>
 	<div align="center">
    	<button class='kcMULl' id="write" type="button">작성</button>
		<button class='iEZQG' type="button" onclick="location.href='/nnb/admin/openNoticeList'">취소</button>
	</div>
 	</div>
</div>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>


