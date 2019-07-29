<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
function roomSearch(){
	var keyword = $("#roomSearch").val();
	var url = "<c:url value='/search/searchRoom?region="+keyword+"'/>"
	location.href=url;
};
function mateSearch(){
	var keyword = $("#mateSearch").val();
	var url = "<c:url value='/search/searchRoom?region="+keyword+"'/>"
	location.href=url;
};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<div class="main">
	<p>� ����, � �濡�� <br>�������Ű���?</p>
	<div class="search">
	<input type="text" id="roomSearch"/>
	<a href="#" class="btn" onclick="roomSearch();">�� ã��</a>
	</div>
	
	<br>
	
	<p>������ � �濡�� <br>�������Ű���?</p>
	<div class="search">
	<input type="text" id="mateSearch"/>
	<a href="#" class="btn" onclick="mateSearch();">�����Ʈ ã��</a>
	</div>
</div>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>