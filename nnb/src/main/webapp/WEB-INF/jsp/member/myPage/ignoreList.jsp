<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
function unignore(id){
	var mem = sessionStorage.getItem("MEM_ID");
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/myPage/unIgnoreUser'/>");
	comAjax.addParam("IGNORE_D_MEM",id);
	comAjax.addParam("IGNORE_MEM",mem)
	comAjax.ajax();
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
<c:forEach var="mate" items="mateList">
	<li>
	<div>${mate.MEM_NICK}</div>
	<div>${mate.AGE}</div>
	<div>${mate.RI_GENDER}</div>
	<div>${mate.RI_REGION1}</div>
	<div>${mate.RI_LOAN_SMALL}</div>
	<div><a href="#" class="btn" id="unign" onclick="unignore(${mate.MEM_ID})">차단 해제</a></div>
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
