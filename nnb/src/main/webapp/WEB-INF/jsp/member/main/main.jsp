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
<div class="main bsRnpg">
	<p class="ipvawL blue"><span>� ����, � ��</span>���� </p>
	<p class="ipvawL">�������Ű���?</p>
	<form class="fRnXmp">
		<div class="search kMYYOo">
				<svg width="18" height="18" viewBox="0 0 18 18">
					<g fill="none" fill-rule="evenodd" stroke="#222">
						<circle cx="7.5" cy="7.5" r="6.5"></circle>
						<path d="M12 12l5 5"></path>
					</g>
				</svg>
			<input type="text" id="roomSearch" class="kZIxja"/>
			<button class="kvrxoz" onclick="roomSearch();">�� ã��</button>
		</div>
	</form>
	
	<br>
	
	<p class="ipvawL red"><span>������ � ��</span>����</p>
	<p class="ipvawL">�������Ű���?</p>
	<form class="fRnXmp">
		<div class="search kMYYOo">
			<svg width="18" height="18" viewBox="0 0 18 18">
				<g fill="none" fill-rule="evenodd" stroke="#222">
					<circle cx="7.5" cy="7.5" r="6.5"></circle>
					<path d="M12 12l5 5"></path>
				</g>
			</svg>
			<input type="text" id="mateSearch" class="kZIxja"/>
			<button class="kvrxoz" onclick="mateSearch();">�����Ʈ ã��</button>
		</div>
	</form>
</div>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>