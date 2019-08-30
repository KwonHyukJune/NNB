<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 새 질문 등록</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminFaq.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#write").on("click", function(e){ //작성하기 버튼
		insertFaq();
	});
		
	function insertFaq(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.validation($('#category option:selected'),'카테고리를 선택하세요.');
		comSubmit.validation($('#FAQ_TITLE'),'제목을 입력하세요.');
		comSubmit.validation($('#FAQ_CONTENT'),'내용을 입력하세요.');
		comSubmit.setUrl("<c:url value='/admin/faq/write'/>");
		comSubmit.submit();
	}
});
</script>
</head>
<body>
<div class="jtRefx">
	<h1 class="kuldyr">자주묻는 질문</h1>
</div>
<div>
	<h2 class="cYaAqA">새 질문 등록</h2>
	<br/>
</div>
<div class="eugBve">
 	<form method="post" id="frm" name="frm">
	<ul class="hIJwlj">
      	 <li>
      	 <p class="efvxco">카테고리</p>
      		<select class="freEbZ hRFrgm" name="FAQ_CATEGORY" id="category">
					<option value=''>카테고리 선택</option>
					<option value="회원정보">회원정보</option>
        			<option value="신고관련">신고관련</option>	
			</select>
 		</li> 
  		<li>
 			<p class="efvxco">제목</p>
 			<input type="text" class="ilgADB kTQnUD" id="FAQ_TITLE" name="FAQ_TITLE">
 		</li>
		<li>
 				<p class="efvxco">내용</p>
 				<textarea class="bqTGEL hunnDM" name="FAQ_CONTENT" id="FAQ_CONTENT"></textarea>
 		</li>
 	</ul>
 	 </form> 
   	<div align="center">
    	<button class='kcMULl' id="write" type="button">작성</button>
		<button class='iEZQG' type="button" onclick="location.href='/nnb/admin/openFaqList'">취소</button>
	</div>
</div>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
