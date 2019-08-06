<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#amessage').addClass('active');
});
function unignore(num){
	if(confirm('차단 해제?')){
		var str = "<form id='frm' action='ignoreCancel' method='post'>"
				+ "<input type='hidden' name='IGNORE_NUM' value='"+num+"'>"
				+ "</form>";
		$(".ignoreList").after(str);
		frm.submit();
	};
};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="ignoreList">

<div class="subtitle">차단 목록</div>
<p>총 ${count}건의 차단 목록이 있습니다.</p>
<c:if test="${count!=null && count!=''}">
<ul>
	<li>
	<div>닉네임</div>
	<div>나이</div>
	<div>성별</div>
	<div>지역</div>
	<div>예산</div>
	</li>
<c:forEach var="mate" items="${list}">
	<li>
	<div>${mate.MEM_NICK}</div>
<fmt:parseDate var="birthst" value="${mate.RI_BIRTH}" pattern="yyyyMMdd"/>
<fmt:formatDate var="birth" value="${birthst}" pattern="yyyy-MM-dd"/>
	<div>${birth}</div>
	<div>
		<c:if test="${mate.RI_GENDER=='M'}">
		남자
		</c:if>
		<c:if test="${mate.RI_GENDER=='F'}">
		여자
		</c:if>
	<div>${mate.RI_REGION1}</div>
	<div>${mate.RI_LOAN_BIG}/${mate.RI_LOAN_SMALL}</div>
	<div><a href="#" class="btn" id="unign" onclick="unignore(${mate.IGNORE_NUM})">차단 해제</a></div>
	</li>
</c:forEach>
</ul>
</c:if>
<%-- <div class="paging">
	${pagingHtml}
</div> --%>

</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
