<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bank.css'/>"/>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<div class="banklist">

	<div class="title">제휴은행</div>
	<div class="list">
	<ul>
		<li>
			<div>번호</div>
			<div>은행종류</div>
			<div>제목</div>
			<div>조회수</div>
			<div>날짜</div>
		</li>
	<c:forEach var="bank" items="${bankList}">
	<a href="<c:url value='/bank/view?num=${bank.BANK_NUM}'/>">
		<li>
			<div>${bank.BANK_NUM}</div>
			<div>${bank.BANK_KIND}</div>
			<div>${bank.BANK_TITLE}</div>
			<div>${bank.BANK_HITCOUNT}</div>
			<div>${bank.BANK_REGDATE}</div>
		</li>
	</a>
	</c:forEach>
	</ul>
	</div>
	
<%-- 	<div class="paging">
		${pagingHtml}
	</div> --%>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
