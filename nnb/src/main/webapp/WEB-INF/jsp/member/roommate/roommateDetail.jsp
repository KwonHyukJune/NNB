<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<!-- �׽�Ʈ�� ���� -->
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
	Map<String,Object> mate = new HashMap<String,Object>();
	mate.put("check","1");
	mate.put("RI_MEM_NUM","1");
	mate.put("MEM_NICK","withfour");
	mate.put("RI_BIRTH","19960914");
	mate.put("RI_GENDER","����");
	mate.put("RI_REGION1","����");
	mate.put("RI_REGION2","��õ");
	mate.put("RI_REGION3","���");
	mate.put("RI_LOAN_BIG","300");
	mate.put("RI_LOAN_SMALL","30");
	mate.put("RI_PROFILE","����");
	mate.put("RI_DATE_START","20190606");
	mate.put("RI_DATE_END","20190808");
	
	request.setAttribute("mate", mate);
%>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/roommate.css'/>"/>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	function report(){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/report/form'/>");
		comAjax.addParam("REPORT_D_ID","${mate.RI_MEM_ID}");
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
<body>
<div class="title">�����Ʈ �󼼺���</div>

<div class="roommateDeteil">

<div class="report"><a href="#" onclick="report();">�Ű�</a></div>

<div class="h">�г���</div>
<div class="b">${mate.MEM_NICK}</div>
<div class="h">����</div>
<div class="b">${mate.RI_GENDER}</div>
<div class="h">�δ㰡�ɱݾ�</div>
<div class="b">������: ${mate.RI_LOAN_BIG}, ����:${mate.RI_LOAN_SMALL}</div>
<div class="h">��ȣ����</div>
<div class="b">${mate.RI_REGION1}<br>${mate.RI_REGION2}<br>${mate.RI_REGION3}</div>
<div class="h">�������</div>
<div class="b">${mate.RI_BIRTH}</div>
<div class="h">���ֽñ�</div>
<div class="b">${mate.RI_DATE_START}~${mate.RI_DATE_END}</div>
<div class="h">�ڱ�Ұ�</div>
<div class="b">${mate.RI_PROFILE}</div>
	
<div>
	<c:if test="${mate.check=='0'}">
	<a href="#" class="btn" onclick="insertFav();">���ϱ�</a>
	</c:if>
	<c:if test="${mate.check=='1'}">
	<a href="#" class="btn" onclick="deleteFav();">�����</a>
	</c:if>
	<a href="#" class="btn" onclick="sendMessage();">�޽��� ������</a>
	<a href="#" class="btn" onclick="javascript:window.close();">�ݱ�</a>
</div>

</div>
<br>
<div class="footer">
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>