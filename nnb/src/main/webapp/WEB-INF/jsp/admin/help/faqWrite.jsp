<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 새 질문 등록</title>
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

<div><h1>FAQ 관리</h1></div>



<div>
<h2>새 질문 등록</h2>
<hr>
<br/>
</div>
 <form action="faqList.jsp" method="get" name="contents">
	<div>
        카테고리&nbsp;&nbsp; 
        <select name="selectBox" id="selectBox" style="width:80px;" class="select_02">

      <c:forEach var="testList" items="${NT_TYPE}" varStatus="i">

         <option value="${FAQ_CATEGORY}">${FAQ_CATEGORY}</option>

      </c:forEach>

   </select>
   </div>
   <br/>
   
  
		<div>
       		 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="text" id="TITLE" name="TITLE"/>
  		</div>
  		<br/>
		<div>    
	       	 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
