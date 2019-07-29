<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 공지 등록</title>
<head>
<%@include file = "/include/adminHeader.jspf" %>

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

<h1><div>공지 게시판</div></h1>



<div>
<h2>새 공지 등록</h2>
<hr>
<br/>
</div>
 <form action="noticeList.jsp" method="get" name="contents">  
	<div>
       	 제목
        <input type="text" id="TITLE" name="TITLE"/>
  	</div>
  		<br/>
	<div>    
	       	 내용
		<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
	</div>
    <div>
    	<br/><br/>
    	<a href="javascript:submit()">등록</a>
    	<a href="javascript:frameclose()">닫기</a>
    </div>
 </form>    
<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/include/footer.jspf" %>
</div>
</body>
</html>
