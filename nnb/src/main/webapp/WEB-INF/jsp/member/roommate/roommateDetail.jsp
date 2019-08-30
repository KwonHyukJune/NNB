<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- �׽�Ʈ�� ���� -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	function report(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/report'/>");
		comAjax.addParam("REPORT_D_ID","${mate.RI_MEM_ID}");
		comAjax.ajax();
	};
	function ignore(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/ignore'/>");
		comAjax.addParam("IGNORE_MEM","${mate.RI_MEM_ID}");
		comAjax.addParam("check",0);
		comAjax.ajax();
	};
	function insertFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/common/back.jsp'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		var url = window.location.href;
		comAjax.addParam("URL",url);
		comAjax.ajax();
	};
	function deleteFav(num){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/roommate/list/deleteFavRoommate'/>");
		comAjax.addParam("RI_MEM_ID","${mate.RI_MEM_ID}");
		comAjax.addParam("MEM_ID",mem);
		var url = window.location.href;
		comAjax.addParam("URL",url);
		comAjax.ajax();
	};
	function sendMessage(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/myPage/messageWriteForm'/>");
		comAjax.addParam("RECEIVER","${mate.RI_MEM_ID}");
		comAjax.ajax();
	};
</script>
</head>
<body style="text-align: center; display: block; margin: 0 auto; font-size: 16px; color: #999;" >
<div class="title">�����Ʈ �󼼺���</div>
<div class="roommateDeteil" style="text-align: center; display: block; margin: 0 auto; font-size: 16px; color: #999;">
<table class="alkdf" >
<tr><th>�г��� </th><td>${mate.MEM_NICK}</td></tr>
<tr><th >���� </th><td>${mate.RI_LOAN_BIG}</td></tr>
<tr><th>������ </th><td>${mate.RI_LOAN_BIG}</td></tr>
<tr><th>���� </th><td>${mate.RI_LOAN_SMALL}</td></tr>
<tr><th>��ȣ���� </th><td>${mate.RI_REGION1}</td></tr>
<tr><th>������� </th><td>${mate.RI_BIRTH}</td></tr>
<tr><th>���ֽñ� </th><td>${mate.RI_DATE_START}~${mate.RI_DATE_END}</td></tr>
<tr><th>�ڱ�Ұ� </th><td>${mate.RI_PROFILE}</td></tr>
<tr><th>���� </th><td>${mate.RI_GENDER}</td></tr>
</table>
	</div>
		<div class="ignore"><a href="#" class="btn" onclick="ignore();">����</a></div>
	<script type="text/javascript">
	function ignore(){
		var mem = "${mate.MEM_ID}";
		if(confirm("'"+mem+"' ȸ���� �����Ͻðڽ��ϱ�?")){
			var str = "<form id='frm' action='ignoreUser' method='post'>"
				+ "<input type='hidden' name='IGNORE_D_MEM' value='"+mem+"'>"
				+ "</form>";
			$(".ignore").after(str);
			frm.submit();
		};
	};
	
	</script>	
	<div class="report"><a href="#" onclick="report();">�Ű�</a></div>
	<c:if test="${mate.check=='0'}">
	<a href="#" class="btn" onclick="insertFav();">���ϱ�</a>
	</c:if>
	<c:if test="${mate.check=='1'}">
	<a href="#" class="btn" onclick="deleteFav();">�����</a>
	</c:if>
	<a href="#" class="btn" onclick="sendMessage();">�޽��� ������</a>
	<a href="#" class="btn" onclick="javascript:window.close();">�ݱ�</a>

<div>
</div>
<br>
<%-- <div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div> --%>
</body>
</html>
