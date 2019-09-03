<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>"/>
<script type="text/javascript">
$(document).ready(function(){
 	var id = sessionStorage.getItem("MEM_ID");
	$("#submit").on("click",function(e){
		e.preventDefault();
		fn_submit(id);
	});
});
function fn_submit(obj){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myPage/myPageDelete'/>");
	comSubmit.addParam("MEM_ID",id);
	comSubmit.submit();
};
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="myPage.jspf" %>

<div class="myPageDelete">
	<div class="info11">	
		<div style=" text-align: center; font-weight:bold;" class="subtitle">ȸ��Ż��</div>
		<div>
		<p style= "color:red; font-weight:bold; text-align: center;" >*ȸ��Ż�� ��û�ϱ� ���� �Ʒ� ������ �� Ȯ�����ּ���.*</p>		
		<p style=" text-align: center;" >Ż�� ��û�� ��� Ż�� ó���˴ϴ�.</p>
		<p style=" text-align: center;">Ż�� �� �ۼ��� �Խù��̳� ��� ���� Ż�� �Ŀ��� �����˴ϴ�.</p>
		<p style=" text-align: center;">�Խù� ���� ���� ���ϴ� ��� �ݵ�� ���� ó�� �� Ż�� ��û���ּ���.</p>
		<p style=" text-align: center;">��й�ȣ Ȯ�� �� Ż���ϱ� ��ư�� ������ Ż�� ����˴ϴ�.</p>
		<br/>
		</div>
		<div class="pwd">
		��й�ȣ Ȯ��
			<form action="MyInfoDelete" method="post">
			<input type="password" id="password" name="MEM_PW">
			<button class="infobtn" type="submit">Ż���ϱ�</button>
			</form>
		</div>
	</div>	
</div>
<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>
