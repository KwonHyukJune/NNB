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
	<p>어떤 동네, 어떤 방에서 <br>살고싶으신가요?</p>
	<div class="search">
	<input type="text" id="roomSearch"/>
	<a href="#" class="btn" onclick="roomSearch();">방 찾기</a>
	</div>
	
	<br>
	
	<p>누구와 어떤 방에서 <br>살고싶으신가요?</p>
	<div class="search">
	<input type="text" id="mateSearch"/>
	<a href="#" class="btn" onclick="mateSearch();">룸메이트 찾기</a>
	</div>
</div>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>