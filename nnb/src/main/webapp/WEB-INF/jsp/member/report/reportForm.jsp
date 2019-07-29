<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script type="text/javascript">
	var mem = sessionStorage.getItem("MEM_ID");
	function submit(){
		var comSubmit = new ComSubmit(frm);
		comSubmit.setUrl("<c:url value='/report/submit'/>");
		comSubmit.addParam("REPORT_D_ID","${map.REPORT_D_ID}");
		/* POST_NUM ������ �������� ������? */
		comSubmit.addParam("REPORT_POST_NUM","${map.REPORT_POST_NUM}");
		comSubmit.addParam("REPORT_ID",mem);
		comSubmit.submit(frm);
	}
</script>
</head>
<body>

<div class="title">�Ű��ϱ�</div>

<form id="frm">
<div class="h">�Ű�����</div>
<div class="b">
	<select name="REPORT_TYPE">
		<option>--�Ű����� ����--</option>
		<option value="1">�弳 �� �����߾�</option>
		<option value="2">�������� ����</option>
		<option value="3">������ �Խñ�</option>
		<option value="4">����/����</option>
	</select>
</div>
<div class="h">���̵�</div>
<div class="b">${map.REPORT_D_ID}</div>
<c:if test="${map.REPORT_POST_NUM!=null || map.REPORT_POST_NUM!=''}">
<div class="h">�� ��ȣ</div>
<div class="b">${map.REPORT_POST_NUM}</div>
</c:if>
<div class="h">����</div>
<div class="b"><input type="text" id="title" name="title"></div>
<div class="h">����</div>
<div class="b"><textarea id="content" name="content"></textarea></div>
</form>
<div>
<a href="#" class="btn" onclick="submit();">����</a>
<a href="#" class="btn" onclick="window.close();">���</a>
</div>


<br>
<div>
<%@ include file="/WEB-INF/include/footer.jspf" %>
</div>
</body>
</html>