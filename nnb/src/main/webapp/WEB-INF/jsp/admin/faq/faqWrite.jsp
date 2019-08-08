<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 새 질문 등록</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#write").on("click", function(e){ //작성하기 버튼
		insertBoard();
	});
		
	function insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/admin/faq/write'/>");
		comSubmit.submit();
	}
});
	
</script>
</head>
<body>

<div><h1>FAQ 관리</h1></div>



<div>
<h2>새 질문 등록</h2>
<hr>
<br/>
</div>
 <form method="post" id="frm" name="frm">
	<div>
      	  카테고리
      	<select id="FAQ_CATEGORY" name="FAQ_CATEGORY">
        	<option value="회원정보">회원정보</option>
        	<option value="신고관련">신고관련</option>
        </select>
   </div>
   <br/>
   
  
		<div>
       		 제목
        	<input type="text" id="FAQ_TITLE" name="FAQ_TITLE"/>
  		</div>
  		<br/>
		<div>    
	       	 내용
		<textarea rows="20" cols="50" title="내용" id="FAQ_CONTENT" name="FAQ_CONTENT"></textarea>
	    </div>

    <div>
    	<br/><br/>
    	<a href="#" id="write">작성하기</a>
    	 <a href="javascript:back()">취소</a>
    </div>
 </form> 


<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
