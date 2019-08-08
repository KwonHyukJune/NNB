<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/bank.css'/>"/>
<script type="text/javascript">
function pop(url){
	console.log(url);
	var OpenWindow = window.open();
	OpenWindow.document.write("<img src="+url+">");
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<div class="bankview">

	<div class="title">제휴은행</div>
	<div class="detail">
	<div>
		<ul>
			<li class="p1">은행종류</li>
			<li class="p2">${bank.BANK_KIND}</li>
			<li class="p3">조회수</li>
			<li class="p4">${bank.BANK_HITCOUNT}</li>
		</ul>
	</div>
	<div>
		<ul>
			<li class="p1">제목</li>
			<li class="p2">${bank.BANK_TITLE}</li>
			<li class="p3">날짜</li>
			<li class="p4">${bank.BANK_REGDATE}</li>
		</ul>
	</div>
		<c:if test="${bank.BANK_STORED_FILE1!=null && bank.BANK_STORED_FILE1!=''}">
		<ul>
			<div class="image">
				<img src="<c:url value='/bankImages/${bank.BANK_STORED_FILE1}'/>"
					 onclick="pop(this.src)" style="cursor:pointer;">
				</a>
			<c:if test="${bank.BANK_STORED_FILE2!=null && bank.BANK_STORED_FILE2!=''}">
				<br>
				<img src="<c:url value='/bankImages/${bank.BANK_STORED_FILE1}'/>"
					 onclick="pop(this.src)" style="cursor:pointer;">
				</a>
			</c:if>
			</div>
			<div class="content">${bank.BANK_CONTENT}</div>
		</ul>
		</c:if>
	</div>
	<a href="list">목록으로</a>

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
