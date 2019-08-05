<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>

<script type="text/javascript">



</script>

</head>

<br/><br/><br/>

<body>


<div><h1>약관보기</h1></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectTermsDetail">


	<div>  
	   <div>      
		<ul>
			<li>번호 
			 ${terms.TERMS_NUM} &nbsp;     
			</li>	
			<li>날짜 
	         ${terms.TERMS_REGDATE}&nbsp;
	      	</li>
	      	<li>약관제목  :&nbsp;      	
	         ${terms.TERMS_TITLE}&nbsp;
	         </li>
	         <li>약관내용  :&nbsp;
			${terms.TERMS_CONTENT}    
	         </li>	
	          
	      </ul>
	    <br/><br/><br/> 
	      <a href="javascript:back()">목록으로</a>

	   </div>	
	</div>
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>