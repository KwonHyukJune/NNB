<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>공지사항 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/myInterest.css'/>"/>

<script type="text/javascript">
function goPage1(num) {   // 공지사항 목록으로
	location.href="/nnb/admin/openNoticeList?num="+num; 
	}	
</script>

</head>

<br/><br/><br/>

<body>


<div><h1>공지사항</h1></div>
<br/>
<hr>
<br/><br/><br/>

<div class="selectNoticeDetail">


<div class="noticeList">
   
   <div class="notice">
      <ul>
      <li>번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; 
      	${map.NT_NUM}
      </li>
      <li>공지유형  :&nbsp; 
		 ${map.NT_TYPE}      
      </li>
      <li>날짜 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
         ${map.NT_DATE}
      </li>
      <li>제목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;
         ${map.NT_TITLE}
       </li> 
       <li>내용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;  
         ${map.NT_CONTENT}
          
      </li>
    </ul>
    <br/><br/><br/> 
    <a href="#" onClick="goPage1(${map.NT_NUM})">목록으로</a>
    

   </div>	
 
</div>

</div>
<br/><hr><br/><br/>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>