<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/qna.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	$(document).ready(function(){
		$("#send").on("click", function(e){ //�ۼ��ϱ� ��ư
			submit();
		});			
		function submit(){
			var comSubmit = new ComSubmit('frm');
			comSubmit.setUrl("<c:url value='/service/qna'/>");
			comSubmit.addParam("MEM_ID",mem);
			comSubmit.submit();
		}
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/serviceHeader.jspf"%>
<form id="frm" name="frm">
<div class="styled__Wrap-sc-1v9ngdo-0 eugBve">
	<h1 class="styled__Name-sc-1v9ngdo-1 cYaAqA">������</h1>
		<p class="styled__Tel-sc-1v9ngdo-2 mWqem">02-5888-7400</p>
		<p class="styled__OpenTime-sc-1v9ngdo-3 csQndh">���� 09:00 ~ 18:00 (��, �Ͽ���, ������ �޹�)</p>	
	<ul class="hIJwlj">
		<li>
			<p class="efvxco">����</p>
			<input autocomplete="off" class="styled__TitleInput-sc-1v9ngdo-6 ilgADB Input-sfsekm-0 kTQnUD" id="QNA_TITLE" name="QNA_TITLE" placeholder="������ �Է��ϼ���.">
		</li>
		<li>
			<p class="efvxco">���ǳ���</p>
			<textarea class="styled__InquiryArea-sc-1v9ngdo-7 bqTGEL Textarea-sc-6jro6l-0 hunnDM" id="QNA_CONTENT" name="QNA_CONTENT" placeholder="������ �Է��ϼ���."></textarea>
		</li>
	</ul>
	<div align="center">
		<button class="iEZQG" id="send">������</button>
	</div>
</div>
</form>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
