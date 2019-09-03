<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>공지사항 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminNotice.css'/>"/>	

<script type="text/javascript">
function goPage1(num) {   // 공지사항 목록으로
	location.href="/nnb/admin/openNoticeList?num="+num; 
	}	
</script>

</head>
<body>
<div class="selectNoticeList">
<div class="cYaAqA">
	<h1 class="kuldyr">공지 사항</h1>
</div>
<div class="eugBve">
 	<form method="post" id="frm" name="frm">
 	<ul class="hIJwlj">
 		<li>
      	 <p class="efvxco">공지유형</p>
      	 <p class="efvxco">${map.NT_TYPE }</p>
 		</li> 
 		<li>
 		 	<input type="hidden" name="num" id="num" value="${map.NT_NUM}">
 			<p class="efvxco">제목</p>
 			<p class="efvxco">${map.NT_TITLE }</p>
 		</li>
 		<li>
 			<p class="efvxco">내용</p>
 			<p class="styled__InquiryArea-sc-1v9ngdo-7 bqTGEL Textarea-sc-6jro6l-0 hunnDM">${map.NT_CONTENT }</p>
 		</li>
 	</ul>
 	</form>
 	<div align="center">
 		<button class='iEZQG' type="button" onclick="location.href='/nnb/admin/openNoticeList'">목록으로</button>
	</div>
 	</div>
</div>
<div>
	<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>