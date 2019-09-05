<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<div style="display:none;">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</div>
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

<div class="ignoreList cAeKOJ">
<%@ include file="myPage.jspf" %> 
<div class="subtitle">차단 목록</div>
<p>총 ${count}건의 차단 목록이 있습니다.</p>
<c:if test="${count!=null && count!=''}">
	<ul class="qUCQS">
	<li class="pbYHJ">
	<p id="alis" style="width:20%;">번호</p>	
	<p id="alis" style="width:20%;">차단날짜</p>
	<p id="alis" style="width:20%;">아이디</p>
	<p id="alis" style="width:20%;">닉네임</p> 
	<p id="alis" style="width:20%;"></p> 
	</li>
<c:forEach var="mate" items="${list}" varStatus="i">
	<li id="li${i.index}" class="bryRNw">
	<p id="alis" style="width:20%;">${mate.RNUM}</p>
	<p id="alis" style="width:20%;">${mate.IGNORE_DATE}</p>
	<p id="alis" style="width:20%;">${mate.IGNORE_D_MEM}</p> 
	<p id="alis" style="width:20%;">${mate.MEM_NICK}</p>
	<p id="alis" style="width:20%;"><a href="#" class="btn" id="unign" onclick="unignore(${mate.IGNORE_NUM})">차단 해제</a></p>
	
	</li>
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
