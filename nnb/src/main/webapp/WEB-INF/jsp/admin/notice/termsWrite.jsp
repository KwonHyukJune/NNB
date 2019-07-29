<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>새 약관 작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지게시판 새글 등록</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@include file = "/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">
	function frameclose() { 
		parent.close() 
		window.close() 
		self.close() 
		} 
	
	function submit(){
	    var f=document.contents;   //폼 name
		    f.submit();	 
			 
		}
</script>

</head>
<body>

<div>
<h2>새 약관 등록</h2>
<hr>
<br/>
</div>
   
   <form action="admin/terms/write" method="get" name="contents">
	<div>
       		 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="text" id="TITLE" name="TITLE" class="wdp_90"/>
  	</div>
  		<br/>
	<div>    
	       	 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
	</div> 
    <div>
    <br/><br/>
  		<a href="javascript:submit()">확인</a> 
    	<a href="javascript:frameclose()">취소</a>
    </div>
</form>


<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
