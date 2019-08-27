<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>약관 수정</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/terms.css'/>"/>
<script type="text/javascript">

$(document).ready(function(){
	$("#update").on("click", function(e){ //저장하기 버튼
		updateTerms();
	});
	$("#TERMS_TITLE").val("${terms.TERMS_TITLE}");

	function updateTerms(){
		//return fn_validation($('#TERMS_TITLE option:selected'),'약관유형을 선택하세요.');
		//return fn_validation($('#TERMS_CONTENT'),'내용을 입력하세요.');
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/terms/termsModify'/>");
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
         var value = "${terms.TERMS_TITLE}";
         var key = $("select[name='TERMS_TITLE']>option");
         for(var i=0;i<key.length;i++){
            if(key[i].value==value){
               key[i].selected = true;
            }
         };
      })();   
      (function(){
         var value = "${terms.TERMS_TITLE}";
         var key = $("input[name='TERMS_TITLE']");
         for(var i=0;i<key.length;i++){
            key[i].value = value;
         };
      })();   
      (function(){
         var value = "${terms.TERMS_CONTENT}";
         var key = $("textarea[name='TERMS_CONTENT']");
         for(var i=0;i<key.length;i++){
            key[i].value = value;
         };
      })();
});
</script>
</head>
<body>
<br/>
<br/>
<div>
	<h1 class="cYaAqA">약 관 수 정</h1>
</div>
 <form name="frm" id="frm">
 	<input type="hidden" name="num" id="num" value="${terms.TERMS_NUM}">
<div class="eugBve">
		<ul class="hIJwlj ">
			<li>
				<p class="efvxco">번호</p>
				<p class="efvxco ilgADB">${terms.TERMS_NUM}</p>
			</li>
			<li>
				<p class="efvxco">작성날짜</p>
				<p class="efvxco ilgADB">${terms.REGDATE}</p>
			</li>
			<li>
				<p class="efvxco">약관 종류</p>
				<select class="freEbZ hRFrgm" name="TERMS_TITLE">
					<option>약관 종류 선택</option>
					<option value='이용약관'>이용약관</option>
					<option value='개인정보처리방침'>개인정보처리방침</option>
					<option value='매물관리규정'>매물관리규정</option>
				</select>
			</li>
			<li>
				<p class="efvxco">내용</p>
				<textarea class="styled__InquiryArea-sc-1v9ngdo-7 bqTGEL Textarea-sc-6jro6l-0 hunnDM" name="TERMS_CONTENT" placeholder="내용을 입력하세요."></textarea>
			</li>
		</ul>
	<div align="center">
			<button class="kcMULl" onclick="location.href='/admin/terms/list'">취소</button>
			<button class="iEZQG" id="update">등록</button>
			</div>
</div>	
<br/><br/><br/>
</form>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
