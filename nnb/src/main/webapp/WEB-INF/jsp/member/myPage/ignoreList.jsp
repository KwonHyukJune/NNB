<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
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
	<div>번호</div>
	<div>차단날짜</div>
	<div>아이디</div>
	<div>닉네임</div>
	</li>
<c:forEach var="mate" items="${list}">
	<li>
	<div>${mate.RNUM}</div>
	<div>${mate.IGNORE_DATE}</div>
	<div>${mate.IGNORE_D_MEM}</div>
	<div>${mate.MEM_NICK}</div>
	</li>
	<div><a href="#" class="btn" id="unign" onclick="unignore(${mate.IGNORE_NUM})">차단 해제</a></div>
</c:forEach>
</ul>
</c:if>
<button type="button" onclick="javascript:location.href='messageList';">뒤로</button>
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
