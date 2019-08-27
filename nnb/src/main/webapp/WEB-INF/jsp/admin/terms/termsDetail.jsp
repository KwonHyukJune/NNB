<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>약관 상세보기</title>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/adminHeader.jspf" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/terms.css'/>"/>
<script type="text/javascript">
function goPage1(num) {   // 새 약관 등록
	location.href="/nnb/admin/terms/list?num="+num; 
	}	
</script>
</head>
<body>
<br/>
<br/>
<div>
	<h1 class="cYaAqA">${terms.TERMS_TITLE }</h1>
</div>
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
				<p class="efvxco">내용</p>
				<p class="styled__InquiryArea-sc-1v9ngdo-7 bqTGEL Textarea-sc-6jro6l-0 hunnDM">${terms.TERMS_CONTENT }</p>
			</li>
		</ul>
	<div align="center">
    	<button class="iEZQG" onclick="location.href='<c:url value='/admin/terms/list'/>'">목록</button>
    </div>
</div>	
<br/><br/><br/>
<div>
<%@include file = "/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>