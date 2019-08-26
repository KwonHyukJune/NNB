<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>새 약관 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">
$(document).ready(function(){
		
		$("#write").on("click", function(e){ //작성하기 버튼
			insertBoard();
		});
		$()
			
		function insertBoard(){
//			return fn_validation($('#TERMS_TITLE option:selected'),'공지유형을 선택하세요.');
//			return fn_validation($('TERMS_CONTENT'),'내용을 입력하세요.');
			var comSubmit = new ComSubmit("frm");
			comSubmit.validation($('#TERMS_TITLE option:selected'),'공지유형을 선택하세요.');
			comSubmit.validation($('TERMS_CONTENT'),'내용을 입력하세요.');
			comSubmit.setUrl("<c:url value='/admin/terms/write' />");
			comSubmit.submit();
		}
});
		
</script>

</head>
<body>

<div>
<h2>새 약관 등록</h2>
<hr>
<br/>
</div>
   
   <form id="frm" name="frm">
     
	
	<div>
       		분류
			<select name="TERMS_TITLE" id="TERMS_TITLE">
				<option value=''>-----</option>
				<option value='이용약관'>이용약관</option>
				<option value='개인정보처리방침'>개인정보처리방침</option>
				<option value='매물관리규정'>매물관리규정</option>
			</select>
  	</div>
  		<br/>
	<div>    
	       	 내용
		<textarea rows="20" cols="50" title="내용" id="TERMS_CONTENT" name="TERMS_CONTENT"></textarea>
	</div> 
    <div>
    <br/><br/>
  		<a href="#" id="write">작성하기</a>
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
