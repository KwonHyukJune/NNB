<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/service.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	function submit(){
		var conSubmit = new ComSubmit(frm);
		conSubmit.setUrl("<c:url value='/service/send'/>");
		conSubmit.addParam("id",mem);
		conSubmit.submit();
	};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="service.jspf" %>

<div class="qna">

<div class="subtitle">질문 등록</div>

<form id="frm">
	<div>
		<div class="p1">제목</div>
		<div class="p2"><input type="text" id="title" name="title"></div>
	</div>
	<div>
		<div class="p1">내용</div>
		<div class="p2"><textarea id="content" name="content"></textarea></div>
	</div>
</form>

<a href="#" onclick="submit()" class="btn">보내기</a>
	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
