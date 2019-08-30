<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 질문 수정</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminFaq.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#awrite').addClass('active');
});
</script>
<script type="text/javascript">

$(document).ready(function(){
	$("#update").on("click", function(e){ //저장하기 버튼
		updateFaq();
	});
	$("#FAQ_TITLE").val("${map.FAQ_TITLE}");

	function updateFaq(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/faq/modify'/>");
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
         var value = "${map.FAQ_CATEGORY}";
         var key = $("select[name='FAQ_CATEGORY']>option");
         for(var i=0;i<key.length;i++){
            if(key[i].value==value){
               key[i].selected = true;
            }
         };
      })();   
      (function(){
         var value = "${map.FAQ_CATEGORY}";
         var key = $("input[name='FAQ_CATEGORY']");
         for(var i=0;i<key.length;i++){
            key[i].value = value;
         };
      })();   
      (function(){
         var value = "${map.FAQ_CONTENT}";
         var key = $("textarea[name='FAQ_CONTENT']");
         for(var i=0;i<key.length;i++){
            key[i].value = value;
         };
      })();
});
</script>
</head>
<body>
<div class="jtRefx">
	<h1 class="kuldyr">자주묻는 질문</h1>
</div>
<div>
	<h2 class="cYaAqA">질문 수정</h2>
	<br/>
</div>
 	<div class="eugBve">
 	 <form id="frm" name="frm">	 
 		<ul class="hIJwlj">
 			<li>
 				<p class="efvxco">카테고리</p>
 				<select class="freEbZ hRFrgm" name="FAQ_CATEGORY">
					<option>카테고리 선택</option>
					<option value="회원정보">회원정보</option>
        			<option value="신고관련">신고관련</option>	
				</select>
 			</li>
 			<li>
 				<input type="hidden" name="FAQ_NUM" id="FAQ_NUM" value="${map.FAQ_NUM}">
 				<p class="efvxco">제목</p>
 				<input autocomplete="off" class="ilgADB kTQnUD" id="FAQ_TITLE" name="FAQ_TITLE">
 			</li>
 			<li>
 				<p class="efvxco">내용</p>
 				<p>
 				<textarea class="bqTGEL hunnDM" name="FAQ_CONTENT">
 				</textarea>
 				</p>
 			</li>
 		</ul>
 	 </form>
 	 <div align="center">
    	<button class='kcMULl' id="update">수정</button>
		<button class='iEZQG' type="button" onclick="location.href='/nnb/admin/openFaqList'">취소</button>
	</div>
</div>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
