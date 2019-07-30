<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제휴 은행 등록 폼</title>
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
	    var f=document.bankWriteForm;   //폼 name
		    f.submit();	 
			
		}
	
	function fn_deleteFile(obj){ 
		obj.parent().remove(); 
		}


</script>
</head>
<body>

<!-- 테스트용 세팅 -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
   Map<String,Object> bank1 = new HashMap<String,Object>();
	bank1.put("BANK_NUM","1");
 	bank1.put("BANK_CATEGORY","회원문의");
    bank1.put("BANK_TITLE","국민 은행입니다");
    bank1.put("BANK_CONTENT","국민에게 돈 빌려 드립니다 ^오^.");
   
   
   List<Map<String,Object>> bank = new ArrayList<Map<String,Object>>();
   bank.add(bank1);
  
 
   request.setAttribute("bank",bank1);
%>
<!-- 테스트용 세팅 끝 -->

<h1><div>제휴은행 등록</div></h1>



<div>
<h2>새 질문 등록</h2>
<hr>
<br/>
</div>
 <form action="bankList.jsp" method="get" name="bankWriteForm">
	<div>
	은행종류
		<select>
			<option>은행종류</option>
			<option>국민 은행</option>
			<option>신한 은행</option>
		</select>
   </div>
   <br/>
   
  
		<div>
       		 제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="text" id="TITLE" name="TITLE" value= "${bank.BANK_TITLE }"/>
  		</div>
  		<br/>
		<div>    
	       	 내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<textarea rows="20" cols="50" title="내용" id="CONTENTS" name="CONTENTS">${bank.BANK_CONTENT}</textarea>
	    </div>

    <div>
    	<br/><br/>
<hr>	
    	<input type="file" name="file">첨부파일	
    		<c:forEach var="row" items="${list }"> 
	    		<input type="hidden" id="IDX" value="${row.IDX }"> 
	    			<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a>
	    			(${row.FILE_SIZE }kb) 	
    			</c:forEach>
    			<br/><br/>
    	<input type="file" name="file">첨부파일	
    		<c:forEach var="row" items="${list }"> 
	    		<input type="hidden" id="IDX" value="${row.IDX }"> 
	    			<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a>
	    			(${row.FILE_SIZE }kb) 	
    			</c:forEach>		
<hr>	
<br/><br/>
    	<a href="javascript:submit()">등록</a>

    	<a href="javascript:frameclose()">닫기</a>
    </div>
</form> 

<script>

function fn_openBoardUpdate(){ var idx = "${map.IDX}";
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />"); 
	comSubmit.addParam("IDX", idx); comSubmit.submit(); 
	} 
	
function fn_downloadFile(obj){ var idx = obj.parent().find("#IDX").val(); 
	var comSubmit = new ComSubmit(); 
	comSubmit.setUrl("<c:url value='/common/downloadFile.do' />"); 
	comSubmit.addParam("IDX", idx); 
	comSubmit.submit(); 
	} 

</script>

<br/><br/><br/><br/><br/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>