<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#amyProfile').addClass('active');
}); 
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>

<div class="myProfile">
<%@ include file="myPage.jspf" %>
<div class="title">���� �����Ʈ ������</div>
<%-- <c:set var="check" value="1"></c:set> --%>
<c:choose>
<c:when test="${map!=null}">
<div class="h">����</div>
<div class="b">${map.RI_GENDER}</div>
<div class="h">�δ㰡�ɱݾ�</div>
<div class="b">������: ${map.RI_LOAN_BIG}, ����:${map.RI_LOAN_SMALL}</div>
<div class="h">��ȣ����</div>
<div class="b">
${map.RI_REGION1}
<c:if test="${map.RI_REGION2!=null}">
, ${map.RI_REGION2}
</c:if>
<c:if test="${map.RI_REGION3!=null}">
, ${map.RI_REGION3}
</c:if>
</div>
<div class="h">����</div>
<div class="b">${map.RI_BIRTH}</div>
<div class="h">���ֽñ�</div>
<div class="b">${map.RI_DATE_START}~${map.RE_DATE_END}</div>
<div class="h">�ڱ�Ұ�</div>
<div class="b">${map.RI_PROFILE}</div>
<a href="<c:url value='/myPage/myProfileModifyForm'/>">����</a>
</c:when>
<c:otherwise>
<div>
��ϵ� �������� �����ϴ�.
</div>
<a href="<c:url value='/myPage/registMyProfileForm'/>">���� �ۼ��ϱ�</a>
</c:otherwise>
</c:choose>

</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
