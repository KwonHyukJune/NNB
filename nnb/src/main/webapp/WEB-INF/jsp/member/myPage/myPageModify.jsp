<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
	$('#amyPage').addClass('active');
}); 
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myPageModify">

������ �Ϸ�Ǿ����ϴ�.
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
